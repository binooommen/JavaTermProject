/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import credentials.database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author c0647015
 */
public class home {

    private List<Customer> listOfCustomer = new ArrayList<>();
    private List<Product> listOfProduct = new ArrayList<>();
    private List<Sale> listOfSale = new ArrayList<>();
    private List<Purchase> listOfPurchase = new ArrayList<>();

    public home() {

    }

    public List<Customer> getListOfCustomer() {
        return listOfCustomer;
    }

    public void setListOfCustomer(List<Customer> listOfCustomer) {
        this.listOfCustomer = listOfCustomer;
    }

    public void setCustomerData(String query) throws SQLException {
        Connection conn = database.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(query);
        ResultSet rs = pstmt.executeQuery();
        List<Customer> listOfCustomer = new <Customer>ArrayList();
        while (rs.next()) {
            Customer cus = new Customer();
            cus.setId(rs.getInt("id"));
            cus.setName(rs.getString("name"));
            cus.setCreate_date(rs.getString("create_date"));
            listOfCustomer.add(cus);
        }
        setListOfCustomer(listOfCustomer);
    }

    public List<Product> getListOfProduct() {
        return listOfProduct;
    }

    public void setListOfProduct(List<Product> listOfProduct) {
        this.listOfProduct = listOfProduct;
    }

    public void setProductData(String query) throws SQLException {
        Connection conn = database.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(query);
        ResultSet rs = pstmt.executeQuery();
        List<Product> listOfProduct = new <Product>ArrayList();
        while (rs.next()) {
            Product pr = new Product();
            pr.setId(rs.getInt("id"));
            pr.setName(rs.getString("name"));
            pr.setCreate_date(rs.getString("create_date"));
            pr.setCost_price(rs.getFloat("cost_price"));
            pr.setList_price(rs.getFloat("list_price"));
            pr.setDescription(rs.getString("description"));
            listOfProduct.add(pr);
        }
        setListOfProduct(listOfProduct);
    }

    public List<Sale> getListOfSale() {
        return listOfSale;
    }

    public void setListOfSale(List<Sale> listOfSale) {
        this.listOfSale = listOfSale;
    }

    public void setSaleData(String query) throws SQLException {
        Connection conn = database.getConnection();
        System.out.println(query);
        PreparedStatement pstmt = conn.prepareStatement(query);
        ResultSet rs = pstmt.executeQuery();
        List<Sale> listOfSale = new <Sale>ArrayList();
        while (rs.next()) {
            Sale sl = new Sale();
            sl.setId(rs.getInt("id"));
            sl.setCreate_date(rs.getString("create_date"));
            sl.setCustomer_id(rs.getInt("customer_id"));
            sl.setProduct_id(rs.getInt("product_id"));
            sl.setCustomer_name(rs.getString("customer_name"));
            sl.setProduct_name(rs.getString("product_name"));
            sl.setQuantity(rs.getFloat("quantity"));
            sl.setTotal(rs.getString("total"));
            sl.setNote(rs.getString("note"));
            listOfSale.add(sl);
        }
        setListOfSale(listOfSale);
    }

    public List<Purchase> getListOfPurchase() {
        return listOfPurchase;
    }

    public void setListOfPurchase(List<Purchase> listOfPurchase) {
        this.listOfPurchase = listOfPurchase;
    }

    public void setPurchaseData(String query) throws SQLException {
        Connection conn = database.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(query);
        ResultSet rs = pstmt.executeQuery();
        List<Purchase> listOfPurchase = new <Purchase>ArrayList();
        while (rs.next()) {
            Purchase pu = new Purchase();
            pu.setId(rs.getInt("id"));
            pu.setCreate_date(rs.getString("create_date"));
            pu.setProduct_id(rs.getInt("product_id"));
            pu.setQuantity(rs.getFloat("quantity"));
            pu.setTotal(rs.getString("total"));
            pu.setNote(rs.getString("note"));
            listOfPurchase.add(pu);
        }
        setListOfPurchase(listOfPurchase);
    }

}
