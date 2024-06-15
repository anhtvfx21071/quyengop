package com.example.asm1.controller;

import com.example.asm1.model.Donation;
import com.example.asm1.model.UserDonation;
import com.example.asm1.service.DonationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/donationUser")
public class DonationControllerUser {
    @Autowired
    private DonationService donationService;

    //Hiển thị danh sách các đợt quyên góp của người dùng
    @RequestMapping("/home")
    public String showDonation(Model theModel, @RequestParam(value = "index", required = false) Integer index) {
        int row = donationService.totalPage();
        int page;
        if (row % 5 == 0) {
            page = row / 5;
        } else {
            page = row / 5 + 1;
        }
        theModel.addAttribute("page", page);
        if (index == null) {
            index = 0;
        } else {
            index = (index - 1) * 5;
        }
        List<Donation> donations = donationService.getFiveDonation(index);
        theModel.addAttribute("donations", donations);
        return "public/home";
    }
    //Hiển thị 5 đợt trên 1 trang
    @RequestMapping("/fiveDonation")
    public String fiveDonation(Model theModel, @RequestParam(value = "index", required = false) Integer index) {
        int row = donationService.totalPage();
        int page;
        if (row % 5 == 0) {
            page = row / 5;
        } else {
            page = row / 5 + 1;
        }
        theModel.addAttribute("page", page);
        if (index == null) {
            index = 0;
        } else {
            index = (index - 1) * 5;
        }
        List<Donation> donations = donationService.getFiveDonation(index);
        theModel.addAttribute("donations", donations);
        return "public/home";
    }

    //hiển thị chi tiết 1 đợt và danh sách các người trong đợt quyên góp đó
    @GetMapping("/detail")
    public String showLogin(Model theModel, @RequestParam("id") int idDonation) {
        Donation donation = donationService.getDonation(idDonation);
        theModel.addAttribute("donation", donation);
        List<UserDonation> userDonations = donationService.getUserDonation(idDonation);
        theModel.addAttribute("userDonations", userDonations);
        return "public/detail";
    }
    //Thực hiện quyên góp mới
    @RequestMapping("/addUserDonation")
    public String addUserDonation(@ModelAttribute UserDonation userDonation,
                                  @RequestParam("idD") int idDonation,
                                  @RequestParam("idU") int idUser) {
        donationService.addUserDonation(userDonation, idUser, idDonation);
        return "redirect:/donationUser/home";
    }
}
