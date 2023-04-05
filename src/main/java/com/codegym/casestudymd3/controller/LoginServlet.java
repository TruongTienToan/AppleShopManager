package com.codegym.casestudymd3.controller;

import com.codegym.casestudymd3.dao.CustomerDAO;
import com.codegym.casestudymd3.model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/view/login/login.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        try {
            CustomerDAO customerDAO = new CustomerDAO();
            Customer account = customerDAO.login(email,password);
            if (account == null){
                request.setAttribute("mess","Wrong user or password !!!");
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/view/login/login.jsp");
                requestDispatcher.forward(request,response);
            }else {
                HttpSession session = request.getSession();
                session.setAttribute("acc",account);
                response.sendRedirect("/home");
//                RequestDispatcher dispatcher = req.getRequestDispatcher("/customer");
//                dispatcher.forward(req,resp);
            }
        } catch (Exception e) {
        }

    }
}
