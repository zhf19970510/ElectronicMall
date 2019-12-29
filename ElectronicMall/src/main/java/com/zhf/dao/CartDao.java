package com.zhf.dao;

import com.zhf.entity.Cart;
import com.zhf.entity.Product;
import com.zhf.entity.User;

import java.util.List;

/**
 * Created on 2019/12/25 0025.
 */
public interface CartDao {
    List<Cart> queryCartByUser(User user);

    int updateCartProductAmount(Integer userId, Integer productId,String opt);

    void insertCartProduct(Integer userId, Integer productId);

    int deleteCartInfoByUserAndProduct(int uid, int pid);

    Cart queryCartByUserAndProduct(User user, Product product);
}
