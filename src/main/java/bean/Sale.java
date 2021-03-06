/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author c0647015
 */
public class Sale {

    private int id;
    private String create_date;
    private int customer_id;
    private String customer_name;
    private int product_id;
    private String product_name;
    private Float quantity;
    private String total;
    private String note;

    public Sale() {
    }

    public Sale(int id, String create_date, int customer_id, String customer_name, int product_id, String product_name, Float quantity, String total, String note) {
        this.id = id;
        this.create_date = create_date;
        this.customer_id = customer_id;
        this.customer_name = customer_name;
        this.product_id = product_id;
        this.product_name = product_name;
        this.quantity = quantity;
        this.total = total;
        this.note = note;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCreate_date() {
        return create_date;
    }

    public void setCreate_date(String create_date) {
        this.create_date = create_date;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public String getCustomer_name() {
        return customer_name;
    }

    public void setCustomer_name(String customer_name) {
        this.customer_name = customer_name;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public Float getQuantity() {
        return quantity;
    }

    public void setQuantity(Float quantity) {
        this.quantity = quantity;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }



}
