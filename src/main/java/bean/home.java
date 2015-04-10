/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package bean;

import services.customer;

/**
 *
 * @author c0647015
 */
public class home {
    private customer customer;
    private customer product;
    private customer purchase;
    private customer sale;

    public home() {
        
    }
    
    public home(customer customer, customer product, customer purchase, customer sale) {
        this.customer = customer;
        this.product = product;
        this.purchase = purchase;
        this.sale = sale;
    }

    public customer getCustomer() {
        return customer;
    }

    public void setCustomer(customer customer) {
        this.customer = customer;
    }

    public customer getProduct() {
        return product;
    }

    public void setProduct(customer product) {
        this.product = product;
    }

    public customer getPurchase() {
        return purchase;
    }

    public void setPurchase(customer purchase) {
        this.purchase = purchase;
    }

    public customer getSale() {
        return sale;
    }

    public void setSale(customer sale) {
        this.sale = sale;
    }
    
    
}
