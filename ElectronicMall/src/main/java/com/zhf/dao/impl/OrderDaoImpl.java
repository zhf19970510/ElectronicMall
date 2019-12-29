package com.zhf.dao.impl;

import com.zhf.dao.OrderDao;
import com.zhf.entity.*;
import com.zhf.exception.MyException;
import com.zhf.utils.ConnectionUtil;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created on 2019/12/28 0028.
 * @author Administrator
 */
public class OrderDaoImpl implements OrderDao {
    @Override
    public int addOrder(Connection connection, User user, float cost, String serialNumber) throws Exception {
        String sql = "INSERT INTO `order`(userId,loginName,userAddress,cost,serialNumber) VALUES(?,?,'北京市海淀区成府路',?,?)";
        int userId = user.getId();
        String loginName = user.getLoginName();
        int rowId = -1;
        rowId = ConnectionUtil.DML(connection, sql, new Object[]{userId, loginName, cost, serialNumber});
        return rowId;
    }

    @Override
    public int queryOrderByUserAndserialNumber(Connection connection,User user, String serialNumber) {
        String sql = "SELECT id FROM `order` WHERE userId=? AND serialNumber=?";
        int userId = user.getId();
        List<Integer> integers = new ArrayList<>();
        try {
            ConnectionUtil.DQL(connection,sql,new Object[]{userId,serialNumber},(rs)->{
                try {

                    if (rs.next()){
                        integers.add(rs.getInt(1));
                    }
                }catch (Exception e){
                    e.printStackTrace();
                }
            });
        }catch (Exception e){
            e.printStackTrace();
        }
        if(integers.size()==1){
            return integers.get(0);
        }
        return -1;
    }

    @Override
    public List<Order> QueryOrderByUser(User user) {
        String sql = "SELECT id,userAddress,createTime,cost,serialNumber from  `order` WHERE userId=? order by id desc";
        List<Order> orders = new ArrayList<>();
        ConnectionUtil.DQL(sql,new Object[]{user.getId()},(rs)->{
            try {
                while (rs.next()) {
                    int id = rs.getInt(1);
                    String address = rs.getString(2);
                    Date date = rs.getTimestamp(3);
                    float cost = rs.getFloat(4);
                    String serialNumber = rs.getString(5);
                    Order order = new Order();
                    order.setId(id);
                    order.setUser(user);
                    order.setUserAddress(address);
                    order.setCreateTime(date);
                    order.setCost(cost);
                    order.setSerialNumber(serialNumber);
                    orders.add(order);
                }
            }catch (Exception e){
                throw new MyException(500,"订单查询出错");
            }
        });
        String sql1 = "SELECT order_detail.id,productId,quantity,cost,fileName,product.`name` as productName,categoryLevel1Id,product_category.`name` as categoryName,price FROM order_detail,product,product_category WHERE orderId=? and order_detail.productId = product.id and categoryLevel1Id = product_category.id order by id desc";
        //根据orderId 查询对应的orderDetail
        for(Order order:orders){
            List<OrderDetail> details = new ArrayList<>();
            int orderId = order.getId();
            ConnectionUtil.DQL(sql1,new Object[]{orderId},(rs)->{
                try {
                    while (rs.next()) {
                        OrderDetail orderDetail = new OrderDetail();
                        int id = rs.getInt(1);
                        orderDetail.setId(id);
                        Product product = new Product();
                        product.setId(rs.getInt(2));
                        product.setPrice(rs.getFloat(9));
                        orderDetail.setQuantity(rs.getInt(3));
                        orderDetail.setCost(rs.getFloat(4));
                        product.setFileName(rs.getString(5));
                        product.setName(rs.getString(6));
                        ProductCategory productCategory = new ProductCategory();
                        productCategory.setId(rs.getInt(7));
                        productCategory.setName(rs.getString(8));
                        product.setCategoryLevel1(productCategory);
                        orderDetail.setProduct(product);
                        details.add(orderDetail);

                    }
                }catch (Exception e){
                    e.printStackTrace();
                }
            });
            order.setDetails(details);
        }
        return orders;
    }
}
