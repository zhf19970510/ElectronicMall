package com.zhf.service;

import com.zhf.entity.Cart;
import com.zhf.entity.Order;
import com.zhf.entity.User;

import java.util.List;

/**
 * Created on 2019/12/28 0028.
 */
public interface OrderService {
    boolean createOrder(User user, float cost, String serialNumber, List<Cart> carts);
    List<Order> queryOrderByUser(User user);
}
