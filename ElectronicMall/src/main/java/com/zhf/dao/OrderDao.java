package com.zhf.dao;

import com.zhf.entity.Order;
import com.zhf.entity.User;

import java.sql.Connection;
import java.util.List;

/**
 * Created on 2019/12/28 0028.
 */
public interface OrderDao {
    int addOrder(Connection connection, User user, float cost, String serialNumber) throws Exception;

    int queryOrderByUserAndserialNumber(Connection connection, User user, String serialNumber);

    List<Order> QueryOrderByUser(User user);
}
