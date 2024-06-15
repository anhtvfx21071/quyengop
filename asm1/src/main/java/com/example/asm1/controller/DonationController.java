package com.example.asm1.controller;

import com.example.asm1.model.Donation;
import com.example.asm1.model.Role;
import com.example.asm1.model.User;
import com.example.asm1.model.UserDonation;
import com.example.asm1.service.DonationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@RequestMapping("/donationAdmin")
public class DonationController {
    @Autowired
    private DonationService donationService;

    //Hiển thị form đăng nhập
    @RequestMapping("/login")
    public String showLogin() {
        donationService.addRole();
        return "admin/login";
    }
    //Kiểm tra tk có tồn tại trong database không
    @RequestMapping("/checkLogin")
    public String Show(HttpServletRequest request, Model model, @RequestParam("email") String email, @RequestParam("password") String password) {
        try {
            User user = donationService.getUserLogin(email, password);
            if (user.getStatus() == 0) {
                model.addAttribute("check", 1);
                return "admin/login";
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("checkUser", user);

                Role role = user.getRole();
                if (role.getRoleName().equals("Admin")) {
                    return "admin/home";
                } else {
                    return "redirect:/donationUser/home";

                }
            }
        } catch (Exception e) {
            model.addAttribute("check", 1);
            return "admin/login";
        }
    }

    //Hiển thị trang home của admin
    @RequestMapping("/home")
    public String homePage() {
        return "admin/home";
    }
    //hiển thị trang account của admin
    @RequestMapping("/account")
    public String showAccount(Model theModel) {
        List<User> theUsers = donationService.getUsers();
        theModel.addAttribute("users", theUsers);
        return "admin/account";
    }
    //thêm user vào database
    @PostMapping("/addUser")
    public String addUser(@ModelAttribute User user) {
        Role role = user.getRole();
        if (role.getRoleName().equals("Admin")) {
            role.setId(donationService.idRole("Admin"));
        } else {
            role.setId(donationService.idRole("User"));
        }
        donationService.addUser(user);
        return "redirect:/donationAdmin/account";
    }
    //Thay đổi trạng thái của user
    @PostMapping("/statusChange")
    public String statusChange(@RequestParam("idUser") int idUser) {
        donationService.statusChange(idUser);
        return "redirect:/donationAdmin/account";
    }
    // Xóa đi người dùng thông qua id
    @PostMapping("/deleteUser")
    public String deleteUser(@RequestParam("idUser") int idUser) {
        donationService.deleteUser(idUser);
        return "redirect:/donationAdmin/account";
    }

    //Cập nhật lại thông tin user
    @PostMapping("/updateUser")
    public String updataUser(@ModelAttribute User user) {

        Role role = user.getRole();
        if (role.getRoleName().equals("Admin")) {
            role.setId(1);
        } else {
            role.setId(2);
        }
        donationService.addUser(user);
        return "redirect:/donationAdmin/account";
    }
    //Hiển thị các đợt ủng hộ
    @RequestMapping("/donation")
    public String showDonation(Model theModel) {
        List<Donation> donations = donationService.getDonations();
        theModel.addAttribute("donations", donations);
        return "admin/donation";
    }
    //Thêm một đợt ủng hộ
    @RequestMapping("/addDonation")
    public String addDonation(@ModelAttribute Donation donation) {
        donationService.addDonation(donation);
        return "redirect:/donationAdmin/donation";
    }
    //Xóa 1 đợt ủng hộ thông qua id
    @PostMapping("/deleteDonation")
    public String deleteDonation(@RequestParam("idDonation") int idDonation) {
        donationService.deleteDonation(idDonation);
        return "redirect:/donationAdmin/donation";
    }
    //Cập nhật 1 đợt ủng hộ
    @PostMapping("/updateDonation")
    public String updataDonation(@ModelAttribute Donation donation) {
        donationService.addDonation(donation);
        return "redirect:/donationAdmin/donation";
    }
    // Hiển thị chi tiết 1 đợt ủng hộ
    @GetMapping("/detail")
    public String showDetail(Model theModel, @RequestParam("id") int idDonation) {
        Donation donation = donationService.getDonation(idDonation);
        theModel.addAttribute("donation", donation);
        List<UserDonation> userDonations = donationService.getUserDonation(idDonation);
        theModel.addAttribute("userDonations", userDonations);
        return "admin/detail";
    }
    //Thay đổi trạng thái 1 đợt ủng hộ
    @PostMapping("/statusDonation")
    public String changeDonationStatus(@RequestParam("idDonationStatus") int idDonation) {
        donationService.changeDonationStatus(idDonation);
        return "redirect:/donationAdmin/donation";
    }
    //Thay đổi trạng thái của user ủng hộ để xác nhận có nhận tiền đó hay không
    @PostMapping("/statusUserDonation")
    public String changeStatusUserDonation(@RequestParam("idUD") int id, @RequestParam("satusUD") int status,
                                           Model theModel, @RequestParam("idD") int idDonation) {
        donationService.changeUserDonation(id, status);
        Donation donation = donationService.getDonation(idDonation);
        theModel.addAttribute("donation", donation);
        List<UserDonation> userDonations = donationService.getUserDonation(idDonation);
        theModel.addAttribute("userDonations", userDonations);
        return "admin/detail";
    }
}
