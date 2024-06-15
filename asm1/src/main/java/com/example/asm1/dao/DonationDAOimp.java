package com.example.asm1.dao;

import com.example.asm1.model.Donation;
import com.example.asm1.model.Role;
import com.example.asm1.model.User;
import com.example.asm1.model.UserDonation;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.NoResultException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class DonationDAOimp implements DonationDAO {
    @Autowired
    private SessionFactory sessionFactory;
    //lấy danh sách người dùng
    @Override
    public List<User> getUsers() {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<User> theQuery = currentSession.createQuery("from User", User.class);
        List<User> users = theQuery.getResultList();
        return users;
    }
    //thêm 1 tk mới
    @Override
    public void addUser(User theUser) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(theUser);
    }
    //Thay đổi trạng thái người dùng
    @Override
    public void statusChange(int idUser) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<User> theQuery = currentSession.createQuery("from User where id=:id", User.class);
        theQuery.setParameter("id", idUser);
        User user = theQuery.getSingleResult();
        if (user.getStatus() == 0) {
            user.setStatus(1);
        } else {
            user.setStatus(0);
        }
        currentSession.saveOrUpdate(user);
    }
    //Xóa người dùng
    @Override
    public void deleteUser(int idUser) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query theQuery = currentSession.createQuery("delete from User where id=:userId");
        theQuery.setParameter("userId", idUser);
        theQuery.executeUpdate();
    }
    //Lấy 1 người dùng
    @Override
    public User getUser(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<User> theQuery = currentSession.createQuery("from User where id=:id", User.class);
        theQuery.setParameter("id", id);
        User user = theQuery.getSingleResult();
        return user;
    }

    //thêm 1 đợt ủng hộ
    @Override
    public void addDonation(Donation donation) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(donation);
    }
    //Xóa 1 đợt ủng hộ
    @Override
    public void deleteDonation(int idDonation) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query theQuery = currentSession.createQuery("delete from Donation where id=:idDonation");
        theQuery.setParameter("idDonation", idDonation);
        theQuery.executeUpdate();
    }

    //lấy thông tin 1 đợt ủng hộ
    @Override
    public Donation getDonation(int idDonation) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Donation> theQuery = currentSession.createQuery("from Donation where id=:id", Donation.class);
        theQuery.setParameter("id", idDonation);
        Donation donation = theQuery.getSingleResult();
        Query query = currentSession.createQuery("select sum(ud.money) from UserDonation ud where ud.donation.id =:id and ud.status = 1");
        query.setParameter("id", idDonation);
        Long sumMoney = (Long) query.getSingleResult();
        if (sumMoney == null) {
            donation.setMoney(0);
        } else {
            int money = sumMoney.intValue();
            donation.setMoney(money);
        }
        return donation;
    }
    //lấy ds các người ủng hộ
    @Override
    public List<UserDonation> getUserDonation(int idDonation) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<UserDonation> theQuery = currentSession.createQuery("from UserDonation where donation.id=:id", UserDonation.class);
        theQuery.setParameter("id", idDonation);
        List<UserDonation> userDonations = theQuery.getResultList();
        return userDonations;
    }
    //Thay đổi trạng thái 1 đợt quyeen góp
    @Override
    public void changeDonationStatus(int idDonation) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Donation> theQuery = currentSession.createQuery("from Donation where id=:id", Donation.class);
        theQuery.setParameter("id", idDonation);
        Donation donation = theQuery.getSingleResult();
        int donationStatus = donation.getStatus();
        donation.setStatus(donationStatus + 1);
        currentSession.saveOrUpdate(donation);
    }
    //Lấy 1 danh sách 5 người bắt đầu từ vị trí index
    @Override
    public List<Donation> getFiveDonation(int index) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Donation> theQuery = currentSession.createQuery("from Donation", Donation.class);
        theQuery.setFirstResult(index);
        theQuery.setMaxResults(5);
        List<Donation> donations = theQuery.getResultList();
        return donations;
    }

    //lấy tổng các đợt quyên góp
    @Override
    public int totalPage() {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Long> theQuery = currentSession.createQuery("SELECT COUNT(*) FROM Donation", Long.class);
        int row = theQuery.getSingleResult().intValue();
        return row;
    }
    //Lấy thông tin 1 tk thông qua email và pass để thực hiện đăng nhập
    @Override
    public User getUserLogin(String email, String password) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<User> theQuery = currentSession.createQuery("FROM User WHERE email = :email AND password = :password", User.class);
        theQuery.setParameter("email", email);
        theQuery.setParameter("password", password);
        User user = theQuery.uniqueResult();
        return user;
    }
    //Thêm 1 người ủng hộ
    @Override
    public void addUserDonation(UserDonation userDonation, int idUser, int idDonation) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<User> theUser = currentSession.createQuery("from User where id=:id", User.class);
        theUser.setParameter("id", idUser);
        User user = theUser.getSingleResult();
        Query<Donation> theQuery = currentSession.createQuery("from Donation where id=:id", Donation.class);
        theQuery.setParameter("id", idDonation);
        Donation donation = theQuery.getSingleResult();
        userDonation.setDonation(donation);
        userDonation.setUser(user);
        currentSession.saveOrUpdate(userDonation);
    }
    //Thêm dữ liệu mặc định về vai trò
    @Override
    public void addRole() {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Role> theQuery = currentSession.createQuery("from Role where roleName=:roleName", Role.class);
        theQuery.setParameter("roleName", "Admin");
        Role adminRole = null;
        try {
            adminRole = theQuery.getSingleResult();
        } catch (NoResultException ex) {
            Role role1 = new Role();
            role1.setRoleName("Admin");
            currentSession.save(role1);
            Role role2 = new Role();
            role2.setRoleName("User");
            currentSession.save(role2);
        }
    }

    // lấy id của vai trò
    @Override
    public int idRole(String name) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Role> query = currentSession.createQuery("from Role where roleName=:name", Role.class);
        query.setParameter("name", name);
        Role role = query.getSingleResult();
        return role.getId();
    }

    //Thay đổi trạng thái người quyên góp
    @Override
    public void changeUserDonation(int id, int status) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<UserDonation> query = currentSession.createQuery("update UserDonation set status=:status where id=:id");
        query.setParameter("status", status);
        query.setParameter("id", id);
        query.executeUpdate();
    }

    //lấy danh sách các đợt quyên góp
    @Override
    public List<Donation> getDonations() {
        Session currentSession = sessionFactory.getCurrentSession();
        List<Donation> donations = currentSession.createQuery("from Donation ", Donation.class).getResultList();
        for (Donation donation : donations
        ) {
            int id = donation.getId();
            Query query = currentSession.createQuery("select sum(ud.money) from UserDonation ud where ud.donation.id =:id and ud.status = 1");
            query.setParameter("id", id);
            Long sumMoney = (Long) query.getSingleResult();
            if (sumMoney == null) {
                donation.setMoney(0);
            } else {
                int money = sumMoney.intValue();
                donation.setMoney(money);
            }
        }
        return donations;
    }

}
