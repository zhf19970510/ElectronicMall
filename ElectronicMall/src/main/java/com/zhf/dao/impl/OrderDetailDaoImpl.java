package com.zhf.dao.impl;

import com.zhf.dao.OrderDetailDao;
import com.zhf.entity.Cart;
import com.zhf.utils.ConnectionUtil;

import java.sql.Connection;

/**
 * Created on 2019/12/28 0028.
 */
public class OrderDetailDaoImpl implements OrderDetailDao {

    @Override
    public int addOrderDetail(Connection connection, int orderId,Cart cart) throws Exception{
        String sql = "INSERT INTO order_detail(orderId,productId,quantity,cost) VALUES(?,?,?,?)";
        int rowId = -1;
        rowId = ConnectionUtil.DML(connection, sql, new Object[]{
                orderId,
                cart.getProduct().getId(),
                cart.getAmount(),
                cart.getProduct().getPrice() * cart.getAmount()
        });
        return rowId;
    }
}
