package com.example.asm1.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "donation")
public class Donation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Column(name = "code")
    private String code;
    @Column(name = "description")
    private String description;
    @Column(name = "start_date")
    private String startDate;
    @Column(name = "end_date")
    private String endDate;
    @Column(name = "money")
    private int money;
    @Column(name = "name")
    private String name;
    @Column(name = "organization_name")
    private String organizationName;
    @Column(name = "phone_number")
    private String phoneNumber;

    @Column(name = "status")
    private int status;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "donation")
    private Set<UserDonation> userDonations;

    public Donation() {
    }

    public Donation(int id, String code, String description, String startDate, String endDate, int money, String name, String organizationName, String phoneNumber, int status, Set<UserDonation> userDonations) {
        this.id = id;
        this.code = code;
        this.description = description;
        this.startDate = startDate;
        this.endDate = endDate;
        this.money = money;
        this.name = name;
        this.organizationName = organizationName;
        this.phoneNumber = phoneNumber;
        this.status = status;
        this.userDonations = userDonations;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getOrganizationName() {
        return organizationName;
    }

    public void setOrganizationName(String organizationName) {
        this.organizationName = organizationName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Set<UserDonation> getUserDonations() {
        return userDonations;
    }

    public void setUserDonations(Set<UserDonation> userDonations) {
        this.userDonations = userDonations;
    }
}
