package com.example.asm1.service;

import com.example.asm1.dao.DonationDAO;
import com.example.asm1.model.Donation;
import com.example.asm1.model.User;
import com.example.asm1.model.UserDonation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
public class DonationServiceimp implements DonationService {
    @Autowired
    private DonationDAO donationDAO;
    //Lấy danh sach tk
    @Override
    @Transactional
    public List<User> getUsers() {
        return donationDAO.getUsers();
    }
    //thêm tk
    @Override
    @Transactional
    public void addUser(User theUser) {
        donationDAO.addUser(theUser);
    }
    //Thay đổi trạng thái
    @Override
    @Transactional
    public void statusChange(int idUser) {
        donationDAO.statusChange(idUser);
    }
    //Xóa 1 tk thông qua id
    @Override
    @Transactional
    public void deleteUser(int idUser) {
        donationDAO.deleteUser(idUser);
    }
    //lấy 1 tk thông qua id
    @Override
    @Transactional
    public User getUser(int id) {
        return donationDAO.getUser(id);
    }
    //Lấy danh sách các đợt ủng hộ
    @Override
    @Transactional
    public List<Donation> getDonations() {
        return donationDAO.getDonations();
    }
    //Thêm 1 đợt ủng hộ
    @Override
    @Transactional
    public void addDonation(Donation donation) {
        donationDAO.addDonation(donation);
    }
    //Xóa 1 đợt ủng hộ thông qua id
    @Override
    @Transactional
    public void deleteDonation(int idDonation) {
        donationDAO.deleteDonation(idDonation);
    }
    //lấy 1 đợt ủng hộ
    @Override
    @Transactional
    public Donation getDonation(int idDonation) {
        return donationDAO.getDonation(idDonation);
    }
    //lấy 1 người ủng hộ thông qua id
    @Override
    @Transactional
    public List<UserDonation> getUserDonation(int idDonation) {
        return donationDAO.getUserDonation(idDonation);
    }
    //Thay đổi trạng thái 1 đợt ủng hộ
    @Override
    @Transactional
    public void changeDonationStatus(int idDonation) {
        donationDAO.changeDonationStatus(idDonation);
    }
    //lấy ds 5 người bắt đầu từ vị trí index
    @Override
    @Transactional
    public List<Donation> getFiveDonation(int index) {
        return donationDAO.getFiveDonation(index);
    }
    //lấy tổng số danh sach đợt quyên góp
    @Override
    @Transactional
    public int totalPage() {
        return donationDAO.totalPage();
    }
    //Lấy thông tin tk đăng nhập
    @Override
    @Transactional
    public User getUserLogin(String email, String password) {
        return donationDAO.getUserLogin(email, password);
    }
    //Thêm 1 người dùng
    @Override
    @Transactional
    public void addUserDonation(UserDonation userDonation, int idUser, int idDonation) {
        donationDAO.addUserDonation(userDonation, idUser, idDonation);
    }
    //thêm vai trò mặc định
    @Override
    @Transactional
    public void addRole() {
        donationDAO.addRole();
    }
    //lấy id vai trò
    @Override
    @Transactional
    public int idRole(String name) {
        return donationDAO.idRole(name);
    }
    //Thay đổi trạng thái của người ủng hộ
    @Override
    @Transactional
    public void changeUserDonation(int id, int status) {
        donationDAO.changeUserDonation(id, status);
    }

}
