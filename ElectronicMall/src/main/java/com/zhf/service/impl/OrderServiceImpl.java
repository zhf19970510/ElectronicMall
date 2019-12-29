package com.zhf.service.impl;

import com.zhf.dao.OrderDao;
import com.zhf.dao.OrderDetailDao;
import com.zhf.dao.impl.OrderDaoImpl;
import com.zhf.dao.impl.OrderDetailDaoImpl;
import com.zhf.entity.Cart;
import com.zhf.entity.Order;
import com.zhf.entity.User;
import com.zhf.exception.MyException;
import com.zhf.service.OrderService;
import com.zhf.utils.ConnectionUtil;

import java.sql.Connection;
import java.util.List;

/**
 * Created on 2019/12/28 0028.
 */
public class OrderServiceImpl implements OrderService {

    @Override
    public boolean createOrder(User user, float cost, String serialNumber, List<Cart> carts) {
        Connection connection = ConnectionUtil.getConnection();
        OrderDao orderDao = new OrderDaoImpl();
        OrderDetailDao orderDetailDao = new OrderDetailDaoImpl();
        boolean flag = true;
        try {
            connection.setAutoCommit(false);
            int rowid = orderDao.addOrder(connection, user, cost, serialNumber);
            if(rowid>0){
                // 将对应插入的orderid取出来
                int orderId = orderDao.queryOrderByUserAndserialNumber(connection,user,serialNumber);
                if(orderId>0) {
                    boolean flag1 = true;
                    for (Cart cart : carts) {
                        //将订单明细插入
                        int rowId = orderDetailDao.addOrderDetail(connection, orderId, cart);
                        if(rowId<0){
                            flag1 = false;
                            flag = false;
                            break;
                        }
                    }
                    if(flag1) {
                        connection.commit();
                    }
                }else{
                    flag = false;
                }
            }else{
                flag = false;
            }
            if(!flag){
                try {
                    connection.rollback();
                }catch (Exception e1){
                    e1.printStackTrace();
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            try {
                connection.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return flag;
    }

    @Override
    public List<Order> queryOrderByUser(User user) {
        OrderDao orderDao = new OrderDaoImpl();
        List<Order> orders = orderDao.QueryOrderByUser(user);
        return orders;
    }
}
