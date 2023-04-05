package com.codegym.casestudymd3.controller;

import com.codegym.casestudymd3.dao.CustomerDAO;
import com.codegym.casestudymd3.dao.RoleDAO;
import com.codegym.casestudymd3.model.Customer;
import com.codegym.casestudymd3.model.Role;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.BiConsumer;



@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private CustomerDAO customerDAO;
    private RoleDAO roleDAO;
    private String errors = "";

    @Override
    public void init() {
        try {
            customerDAO = new CustomerDAO();
            roleDAO = new RoleDAO();

            if (this.getServletContext().getAttribute("listRole") == null) {
                getServletContext().setAttribute("listRole", roleDAO.selectAllRole());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = " ";
        }
        try {
            switch (action) {
                case "create":
                    showCreateCustomer(request, response);
                    break;
                case "edit":
                    showEditCustomer(request, response);
                    break;
                case "delete":
                    showDeleteCustomer(request, response);
                    break;
                default:
//                    listCustomer(req, resp);
                    listNumberPage(request, response);
                    break;
            }

        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    insertCustomer(request, response);
                    break;
                case "edit":
                    updateCustomer(request, response);
                    break;
                default:
                    System.out.println("error");
                    break;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void listNumberPage(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        int page = 1;
        int recordsPerPage = 5;
        String q = "";
        if (req.getParameter("q") != null){
            q = req.getParameter("q");
        }
        if (req.getParameter("page") != null) {
            page = Integer.parseInt(req.getParameter("page"));
        }
        List<Customer> customerList = customerDAO.getNumberPage((page - 1) * recordsPerPage, recordsPerPage,q);
        int noOfRecords = customerDAO.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

        req.setAttribute("listCustomer", customerList);
        req.setAttribute("noOfPages", noOfPages);
        req.setAttribute("currentPage", page);
        req.setAttribute("q",q);
        String message = null;
        if (req.getParameter("message") != null) {
            message = req.getParameter("message");
        }
        req.setAttribute("message", message);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/view/admin/index.jsp");
        requestDispatcher.forward(req, resp);

    }
    private void updateCustomer(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        Customer customer = new Customer();
        boolean flag = true;
        Map<String, String> hashMap = new HashMap<String, String>();  // Luu lai truong nao bi loi va loi gi

        try {
            customer.setIdCustomer(Integer.parseInt(req.getParameter("idCustomer")));
            Customer customerCheck = customerDAO.selectCustomer(Integer.parseInt(req.getParameter("idCustomer")));
            String checkPhone = customerCheck.getPhone();
            String checkEmail = customerCheck.getEmail();

            customer.setFullName(req.getParameter("fullName"));
            customer.setPassword(req.getParameter("password"));
            customer.setAddress(req.getParameter("address"));
            String phone = req.getParameter("phone");
            customer.setPhone(phone);
            String email = req.getParameter("email");
            customer.setEmail(email);
//            customer.setIdRole(Integer.parseInt(req.getParameter("idRole")));

            System.out.println(this.getClass() + "Country value from request: " + req.getParameter("country"));
            int inRole = Integer.parseInt(req.getParameter("idRole"));
            customer.setIdRole(inRole);

            System.out.println(this.getClass() + "User info from request: " + customer);

            ValidatorFactory validatorFactory = Validation.buildDefaultValidatorFactory();
            Validator validator = validatorFactory.getValidator();

            Set<ConstraintViolation<Customer>> constraintViolations = validator.validate(customer);

            System.out.println("User: " + customer);

            if (!constraintViolations.isEmpty()) {

                errors = "<ul>";
                // constraintViolations is has error
                for (ConstraintViolation<Customer> constraintViolation : constraintViolations) {
                    errors += "<li>" + constraintViolation.getPropertyPath() + " " + constraintViolation.getMessage()
                            + "</li>";
                }
                errors += "</ul>";


                req.setAttribute("editCustomer", customer);
                req.setAttribute("errors", errors);

                List<Role> roleList = roleDAO.selectAllRole();
                req.setAttribute("listRole", roleList);

                System.out.println(this.getClass() + " !constraintViolations.isEmpty()");
                req.getRequestDispatcher("/WEB-INF/view/admin/edit.jsp").forward(req, resp);
            } else {
                if (checkEmail.equals(email)){
                    customer.setEmail(checkEmail);
                    flag = true;
                }else if (customerDAO.selectCustomerByEmail(email) != null) {
                    flag = false;
                    hashMap.put("email", "Email exits in database");
                }

                if (checkPhone.equals(phone)){
                    customer.setPhone(checkPhone);
                    flag = true;
                } else if (customerDAO.selectCustomerByphone(phone) != null){
                    flag = false;
                    hashMap.put("phone", "phone exits in database");
                }

                if (flag) {
                    customerDAO.updateCustomer(customer);
                    System.out.println("list " + customer);
                    List<Customer> customers = customerDAO.selectAllCustomer();
                    req.setAttribute("listCustomer", customers);
                    req.setAttribute("message", "Edit success !!!");
                    resp.sendRedirect("/customer?message=success");
                    RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/admin/edit.jsp");
                    dispatcher.forward(req, resp);
                } else {
                    errors = "<ul>";
                    hashMap.forEach(new BiConsumer<String, String>() {
                        @Override
                        public void accept(String keyError, String valueError) {
                            errors += "<li>" + valueError
                                    + "</li>";
                        }
                    });
                    errors += "</ul>";

                    req.setAttribute("editCustomer", customer);
                    req.setAttribute("errors", errors);


                    System.out.println(this.getClass() + " !constraintViolations.isEmpty()");

                    req.getRequestDispatcher("/WEB-INF/view/admin/edit.jsp").forward(req, resp);
                }
            }
        } catch (NumberFormatException ex) {
            System.out.println(this.getClass() + " NumberFormatException: User info from request: " + customer);
            errors = "<ul>";
            errors += "<li>" + "Input format not right"
                    + "</li>";

            errors += "</ul>";


            req.setAttribute("editCustomer", customer);
            req.setAttribute("errors", errors);

            req.getRequestDispatcher("/WEB-INF/view/admin/edit.jsp").forward(req, resp);
        } catch (Exception ex) {
            System.out.println("ko tim thay");
        }
    }
    private void insertCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException, ClassNotFoundException {
        Customer customer = new Customer();
        boolean flag = true;
        Map<String, String> hashMap = new HashMap<String, String>();  // Luu lai truong nao bi loi va loi gi


        System.out.println(this.getClass() + " insertUser with validate");
        try {
            customer.setIdCustomer(Integer.parseInt(req.getParameter("idCustomer")));
            customer.setFullName(req.getParameter("fullName"));
            customer.setPassword(req.getParameter("password"));
            customer.setAddress(req.getParameter("address"));
            String phone = req.getParameter("phone");
            customer.setPhone(phone);
            customer.setPhone(req.getParameter("phone"));
            String email = req.getParameter("email");
            customer.setEmail(email);
//            customer.setIdRole(Integer.parseInt(req.getParameter("idRole")));

            System.out.println(this.getClass() + "Country value from request: " + req.getParameter("country"));
            int inRole = Integer.parseInt(req.getParameter("idRole"));
            customer.setIdRole(inRole);

            System.out.println(this.getClass() + "User info from request: " + customer);

            ValidatorFactory validatorFactory = Validation.buildDefaultValidatorFactory();
            Validator validator = validatorFactory.getValidator();

            Set<ConstraintViolation<Customer>> constraintViolations = validator.validate(customer);

            System.out.println("User: " + customer);

            if (!constraintViolations.isEmpty()) {

                errors = "<ul>";
                // constraintViolations is has error
                for (ConstraintViolation<Customer> constraintViolation : constraintViolations) {
                    errors += "<li>" + constraintViolation.getPropertyPath() + " " + constraintViolation.getMessage()
                            + "</li>";
                }
                errors += "</ul>";


                req.setAttribute("customer", customer);
                req.setAttribute("errors", errors);

                List<Role> roleList = roleDAO.selectAllRole();
                req.setAttribute("listRole", roleList);

                System.out.println(this.getClass() + " !constraintViolations.isEmpty()");
                req.getRequestDispatcher("/WEB-INF/view/admin/create.jsp").forward(req, resp);
            } else {
                if (customerDAO.selectCustomerByEmail(email) != null) {
                    flag = false;
                    hashMap.put("email", "Email exits in database");
                }
                if (customerDAO.selectCustomerByphone(phone) != null){
                    flag = false;
                    hashMap.put("phone", "phone exits in database");
                }
                if (flag) {
                    customerDAO.insertCustomer(customer);
                    Customer c = new Customer();
                    req.setAttribute("customer", c);
                    req.setAttribute("message", "Insert success...........");
                    req.setAttribute("success", "Update thành công");
                    resp.sendRedirect("/customer");
//                    resp.sendRedirect("/customer");
                    req.getRequestDispatcher("/WEB-INF/view/admin/create.jsp").forward(req, resp);
                } else {
                    errors = "<ul>";
                    hashMap.forEach(new BiConsumer<String, String>() {
                        @Override
                        public void accept(String keyError, String valueError) {
                            errors += "<li>" + valueError
                                    + "</li>";
                        }
                    });
                    errors += "</ul>";
                    req.setAttribute("customer", customer);
                    req.setAttribute("errors", errors);
                    req.getRequestDispatcher("/WEB-INF/view/admin/create.jsp").forward(req, resp);
                }
            }
        } catch (NumberFormatException ex) {
            System.out.println(this.getClass() + " NumberFormatException: User info from request: " + customer);
            errors = "<ul>";
            errors += "<li>" + "Input format not right"
                    + "</li>";

            errors += "</ul>";


            req.setAttribute("customer", customer);
            req.setAttribute("errors", errors);

            req.getRequestDispatcher("/WEB-INF/view/admin/create.jsp").forward(req, resp);
        } catch (Exception ex) {
            System.out.println("ko tim thay");
        }
    }

    private void showDeleteCustomer(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        int idCustomer = Integer.parseInt(req.getParameter("idCustomer"));
        customerDAO.deleteCustomer(idCustomer);

//        List<Customer> customers = customerDAO.selectAllUser();
//        req.setAttribute("listCustomer", customers);
        int page = 1;
        int recordsPerPage = 5;
        String q = "";
        if (req.getParameter("q") != null){
            q = req.getParameter("q");
        }
        if (req.getParameter("page") != null) {
            page = Integer.parseInt(req.getParameter("page"));
        }
        ;

        List<Customer> customerList = customerDAO.getNumberPage((page - 1) * recordsPerPage, recordsPerPage,q);
        int noOfRecords = customerDAO.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
        System.out.println("noOfPages" + noOfPages);
        System.out.println(noOfRecords);
        req.setAttribute("listCustomer", customerList);
        req.setAttribute("noOfPages", noOfPages);
        req.setAttribute("currentPage", page);
        req.setAttribute("q",q);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/admin/index.jsp");
        dispatcher.forward(req, resp);
    }

    private void showEditCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException, ClassNotFoundException {
        int idCustomer = Integer.parseInt(req.getParameter("idCustomer"));
        Customer customer = customerDAO.selectCustomer(idCustomer);
        req.setAttribute("editCustomer", customer);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/view/admin/edit.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void showCreateCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Customer customer = new Customer();
        req.setAttribute("customer", customer);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/view/admin/create.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void listCustomer(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        System.out.println("list");
        List<Customer> customers = customerDAO.selectAllCustomer();
        req.setAttribute("listCustomer", customers);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/admin/index.jsp");
        dispatcher.forward(req, resp);

    }
}
