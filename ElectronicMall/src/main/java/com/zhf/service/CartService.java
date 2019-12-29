package com.zhf.service;

import com.zhf.entity.Cart;
import com.zhf.entity.Product;
import com.zhf.entity.User;

import java.util.List;

/**
 * Created on 2019/12/25 0025.
 */
public interface CartService {
    List<Cart> queryCartByUser(User user);

    int updateCartProductAmount(User user, Product product,String opt);

    void insertCartProduct(User user, Product product);

    boolean deleteCartInfoByUserAndProduct(User user, Product product);

    Cart queryCartByUserAndProduct(User user, Product product);
}
