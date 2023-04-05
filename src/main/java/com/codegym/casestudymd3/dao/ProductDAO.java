package com.codegym.casestudymd3.dao;

import com.codegym.casestudymd3.connection.DBContext;
import com.codegym.casestudymd3.model.Category;
import com.codegym.casestudymd3.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    DBContext dbContext = new DBContext();
    Connection connection;
    PreparedStatement ps;
    ResultSet rs;

    private int noOfRecords;

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select * from product";
        try {
            connection = dbContext.getConnection();
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int idProduct = rs.getInt("idProduct");
                String title = rs.getString("title");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                String image = rs.getString("image");
                int idCategory = rs.getInt("idCategory");
                String description = rs.getString("description");
                list.add(new Product(idProduct, title, price, quantity, image, idCategory, description));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public List<Category> getAllCategory() {
        List<Category> listCategory = new ArrayList<>();
        String query = "select * from category";
        try {
            connection = dbContext.getConnection();
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int idCategory = rs.getInt("idCategory");
                String nameCategory = rs.getString("nameCategory");
                listCategory.add(new Category(idCategory, nameCategory));
            }
        } catch (Exception e) {

        }
        return listCategory;
    }

    public Product getLast() {
        String query = "select * from product\n" +
                "order by idproduct desc \n" +
                "limit 1";
        try {
            connection = dbContext.getConnection();
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                int idProduct = rs.getInt("idProduct");
                String title = rs.getString("title");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                String image = rs.getString("image");
                int idCategory = rs.getInt("idCategory");
                String description = rs.getString("description");
                return new Product(idProduct, title, price, quantity, image, idCategory, description);
            }

        } catch (Exception e) {

        }
        return null;
    }

    public List<Product> getProductById(int idCategory) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product where idCategory = ? ";
        try {
            connection = dbContext.getConnection();
            ps = connection.prepareStatement(query);
            ps.setInt(1, idCategory);
            rs = ps.executeQuery();
            while (rs.next()) {
                int idProduct = rs.getInt("idProduct");
                String title = rs.getString("title");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                String image = rs.getString("image");
                String description = rs.getString("description");
                list.add(new Product(idProduct, title, price, quantity, image, idCategory, description));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public void insertProduct(Product product) throws ClassNotFoundException, SQLException {
        String query = "INSERT INTO product(title, price, quantity, image, idCategory, description) \n" +
                "VALUES (?,?,?,?,?,?);";
        connection = dbContext.getConnection();
        ps = connection.prepareStatement(query);
        ps.setString(1, product.getTitle());
        ps.setDouble(2, product.getPrice());
        ps.setInt(3, product.getQuantity());
        ps.setString(4, product.getImage());
        ps.setInt(5, product.getIdCategory());
        ps.setString(6, product.getDescription());

        ps.executeUpdate();
        connection.close();
    }

    public List<Product> selecAllProduct(int offset, int noOfRecords) throws ClassNotFoundException, SQLException {
        connection = dbContext.getConnection();
        String query = "SELECT SQL_CALC_FOUND_ROWS * FROM product limit " + offset + "," + noOfRecords;
        List<Product> listP = new ArrayList<>();
        ps = connection.prepareStatement(query);
        rs = ps.executeQuery();
        while (rs.next()) {
            Product product = new Product();
            product.setIdProduct(rs.getInt("idProduct"));
            product.setTitle(rs.getString("title"));
            product.setPrice(rs.getDouble("price"));
            product.setQuantity(rs.getInt("quantity"));
            product.setImage(rs.getString("image"));
            product.setIdCategory(rs.getInt("idCategory"));
            product.setDescription(rs.getString("description"));
            listP.add(product);

        }
        rs = ps.executeQuery("SELECT FOUND_ROWS()");
        if (rs.next()) {
            this.noOfRecords = rs.getInt(1);
        }
        connection.close();
        return listP;
    }

    public List<Product> selecAllProduct(int offset, int noOfRecords, String q) throws ClassNotFoundException, SQLException {
        connection = dbContext.getConnection();
        List<Product> listP = new ArrayList<>();
        String query = "SELECT SQL_CALC_FOUND_ROWS * FROM product where title like ? limit " + offset + "," + noOfRecords;
        ps = connection.prepareStatement(query);
        ps.setString(1, "%" + q + "%");
        rs = ps.executeQuery();
        while (rs.next()) {
            Product product = new Product();
            product.setIdProduct(rs.getInt("idProduct"));
            product.setTitle(rs.getString("title"));
            product.setPrice(rs.getDouble("price"));
            product.setQuantity(rs.getInt("quantity"));
            product.setImage(rs.getString("image"));
            product.setIdCategory(rs.getInt("idCategory"));
            product.setDescription(rs.getString("description"));
            listP.add(product);

        }
        rs = ps.executeQuery("SELECT FOUND_ROWS()");
        if (rs.next()) {
            this.noOfRecords = rs.getInt(1);
        }
        connection.close();
        return listP;
    }

    public int getNoOfRecords() {
        return noOfRecords;
    }

    public boolean updateProduct(Product product) throws ClassNotFoundException, SQLException {
        boolean flag;
        String query = "UPDATE product SET title = ?, price=?, quantity=?,image=?,idCategory=?,description=? WHERE (idProduct = ?);";
        connection = dbContext.getConnection();
        ps = connection.prepareStatement(query);
        ps.setString(1, product.getTitle());
        ps.setDouble(2, product.getPrice());
        ps.setInt(3, product.getQuantity());
        ps.setString(4, product.getImage());
        ps.setInt(5, product.getIdCategory());
        ps.setString(6, product.getDescription());
        ps.setInt(7, product.getIdProduct());

        flag = ps.executeUpdate() > 0;
        connection.close();
        return flag;
    }

    public Product selectProductById(int id) throws ClassNotFoundException, SQLException {
        Product product = null;
        String query = "SELECT * FROM product where idProduct = ?";
        connection = dbContext.getConnection();

        ps = connection.prepareStatement(query);
        ps.setInt(1, id);
        rs = ps.executeQuery();
        while (rs.next()) {
            return new Product(
                    rs.getInt("idProduct"),
                    rs.getString("title"),
                    rs.getDouble("price"),
                    rs.getInt("quantity"),
                    rs.getString("image"),
                    rs.getInt("idCategory"),
                    rs.getString("description"));

        }
        connection.close();
        return null;
    }

    public boolean deleteProduct(int id) throws ClassNotFoundException, SQLException {
        boolean flag;
        String query = "DELETE FROM product WHERE idProduct = ?";
        connection = dbContext.getConnection();
        ps = connection.prepareStatement(query);
        ps.setInt(1, id);
        flag = ps.executeUpdate() > 0;
        connection.close();
        return flag;
    }
}
