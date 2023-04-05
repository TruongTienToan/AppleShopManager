package com.codegym.casestudymd3.dao;

import com.codegym.casestudymd3.model.Customer;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerDAO {
    List<Customer> selectAllCustomer() throws SQLException, ClassNotFoundException;
    Customer selectCustomer(int id) throws SQLException, ClassNotFoundException;
    //    List<Customer> getNumberPage(int offset, int noOfRecords) throws ClassNotFoundException, SQLException;
    void insertCustomer(Customer customer) throws SQLException, ClassNotFoundException;
    boolean deleteCustomer(int id) throws ClassNotFoundException, SQLException;
    boolean updateCustomer(Customer customer) throws ClassNotFoundException, SQLException;
}
