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
public class Product {

    private int id;
    private String create_date;
    private String name;
    private Float cost_price;
    private Float list_price;
    private Float quantity_on_hand;
    private String description;

    public Product() {
    }

    public Product(int id, String create_date, String name, Float cost_price, Float list_price, Float quantity_on_hand, String description) {
        this.id = id;
        this.create_date = create_date;
        this.name = name;
        this.cost_price = cost_price;
        this.list_price = list_price;
        this.quantity_on_hand = quantity_on_hand;
        this.description = description;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Float getCost_price() {
        return cost_price;
    }

    public void setCost_price(Float cost_price) {
        this.cost_price = cost_price;
    }

    public Float getList_price() {
        return list_price;
    }

    public void setList_price(Float list_price) {
        this.list_price = list_price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Float getQuantity_on_hand() {
        return quantity_on_hand;
    }

    public void setQuantity_on_hand(Float quantity_on_hand) {
        this.quantity_on_hand = quantity_on_hand;
    }
    
    

}
