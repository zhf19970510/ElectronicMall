package com.zhf.dao.impl;

import com.zhf.dao.CartDao;
import com.zhf.entity.Cart;
import com.zhf.entity.Product;
import com.zhf.entity.User;
import com.zhf.utils.ConnectionUtil;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Created on 2019/12/25 0025.
 * @author Administrator
 */
public class CartDaoImpl implements CartDao {
    @Override
    public List<Cart> queryCartByUser(User user) {

        int uid = user.getId();
        List<Cart>carts = new ArrayList<>();
        String sql = "SELECT * FROM allCartInfo WHERE userId = ?";
        ConnectionUtil.DQL(sql,new Object[]{uid},(rs)->{
            try {
                while (rs.next()) {
                    Cart cart = new Cart();
                    getCartData(cart,rs,user);
                    carts.add(cart);
                }
            }catch (Exception e){
                e.printStackTrace();
            }
        });
        return carts;
    }

    @Override
    public int updateCartProductAmount(Integer id, Integer id1,String opt) {
        int uid = id!=null?id:0;
        int productId = id1!=null?id1:0;
        String sql = "update cart set amount=amount"+opt+"1 where userId=? and productId = ?";
        int dml = ConnectionUtil.DML(sql, new Object[]{uid, productId});
        String sql1 = "SELECT amount FROM cart WHERE userId=? AND productId=?";
        List<Integer> amounts = new ArrayList<>();
        ConnectionUtil.DQL(sql1,new Object[]{uid,productId},(rs)->{
            try {
                if (rs.next()) {
                    amounts.add(rs.getInt(1));
                }
            }catch (Exception e){
                e.printStackTrace();
            }
        });
        if(amounts.size()==1){
            return amounts.get(0);
        }else {
            return 0;
        }

    }

    @Override
    public void insertCartProduct(Integer id, Integer id1) {
        int uid = id!=null?id:0;
        int productId = id1!=null?id1:0;
        String sql = "INSERT INTO cart(productId,amount,userId) values(?,?,?)";
        ConnectionUtil.DML(sql,new Object[]{productId,1,uid});
    }

    @Override
    public int deleteCartInfoByUserAndProduct(int uid, int pid) {
        String sql = "DELETE FROM cart WHERE userId=? AND productId=?";
        int dml = ConnectionUtil.DML(sql, new Object[]{uid, pid});
        return dml;
    }

    @Override
    public Cart queryCartByUserAndProduct(User user, Product product) {
        int uid =user.getId();
        int pid = product.getId();
        String sql = "SELECT * FROM allCartInfo WHERE userId = ? AND productId=?";
        Cart cart = new Cart();
        ConnectionUtil.DQL(sql,new Object[]{uid,pid},(rs)->{
            try {
                if(rs.next()) {
                    getCartData(cart, rs, user);
                }
            }catch (Exception e){
                e.printStackTrace();
            }
        });
        return cart;
    }

    public void getCartData(Cart cart, ResultSet rs,User user) throws Exception{
        cart.setId(rs.getInt(1));
        Product product1 = new Product();
        ProductDaoImpl.tableToPojo(product1,rs,new Integer[]{3,5,6,7,8,9,10,11,12,13,14,15,16});
        cart.setProduct(product1);
        cart.setUser(user);
        cart.setAmount(rs.getInt(4));
    }

}
