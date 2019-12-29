package com.zhf.dao;

import com.zhf.entity.Cart;
import com.zhf.entity.Order;

import java.sql.Connection;

/**
 * Created on 2019/12/28 0028.
 */
public interface OrderDetailDao {
    int addOrderDetail(Connection connection,int orderId,Cart cart) throws Exception;
}
