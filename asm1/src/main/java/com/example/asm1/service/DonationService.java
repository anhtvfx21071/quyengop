package com.example.asm1.service;

import com.example.asm1.model.Donation;
import com.example.asm1.model.User;
import com.example.asm1.model.UserDonation;

import java.util.List;

public interface DonationService {
    List<User> getUsers();

    void addUser(User theUser);

    void statusChange(int idUser);

    void deleteUser(int idUser);

    User getUser(int id);

    List<Donation> getDonations();

    void addDonation(Donation donation);

    void deleteDonation(int idDonation);

    Donation getDonation(int idDonation);

    List<UserDonation> getUserDonation(int idDonation);

    void changeDonationStatus(int idDonation);

    List<Donation> getFiveDonation(int index);

    int totalPage();

    User getUserLogin(String email, String password);

    void addUserDonation(UserDonation userDonation, int idUser, int idDonation);

    void addRole();

    int idRole(String name);

    void changeUserDonation(int id, int status);
}
