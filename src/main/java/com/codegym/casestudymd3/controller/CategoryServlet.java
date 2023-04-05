package com.codegym.casestudymd3.controller;

import com.codegym.casestudymd3.dao.ProductDAO;
import com.codegym.casestudymd3.model.Category;
import com.codegym.casestudymd3.model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryServlet", value = "/category")
public class CategoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        int idCategory = Integer.parseInt(request.getParameter("idCategory"));
        ProductDAO productDAO = new ProductDAO();
        List<Product> list = productDAO.getProductById(idCategory);
        List<Category> listCategory = productDAO.getAllCategory();
        Product lastProduct = productDAO.getLast();

        request.setAttribute("lastP",lastProduct);
        request.setAttribute("listC",listCategory);
        request.setAttribute("listP",list);


        request.getRequestDispatcher("/WEB-INF/view/products/products.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
