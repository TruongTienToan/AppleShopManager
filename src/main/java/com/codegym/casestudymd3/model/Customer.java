package com.codegym.casestudymd3.model;

public class Customer {
    private int idCustomer;
    private String fullName;
    private String password;
    private String address;
    private String phone;
    private String email;
    private int idRole;

    public Customer() {

    }

    public Customer(String fullName, String password, String address, String phone, String email, int idRole) {
        this.fullName = fullName;
        this.password = password;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.idRole = idRole;
    }

    public Customer(int idCustomer, String fullName, String password, String address, String phone, String email, int idRole) {
        this.idCustomer = idCustomer;
        this.fullName = fullName;
        this.password = password;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.idRole = idRole;
    }

    public Customer(String password, String email) {
        this.password = password;
        this.email = email;
    }

    public int getIdCustomer() {
        return idCustomer;
    }

    public void setIdCustomer(int idCustomer) {
        this.idCustomer = idCustomer;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getIdRole() {
        return idRole;
    }

    public void setIdRole(int idRole) {
        this.idRole = idRole;
    }
}
