package com.zhf.entity;

/**
 * Created on 2019/12/25 0025.
 */
public class Cart {
    private int id;
    private Product product;
    private int amount;
    private User user;

    public Cart() {
    }

    public Cart(Product product, int amount, User user) {
        this.product = product;
        this.amount = amount;
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
