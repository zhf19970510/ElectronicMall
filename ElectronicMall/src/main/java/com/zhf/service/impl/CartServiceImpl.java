package com.zhf.service.impl;

import com.zhf.dao.CartDao;
import com.zhf.dao.impl.CartDaoImpl;
import com.zhf.entity.Cart;
import com.zhf.entity.Product;
import com.zhf.entity.User;
import com.zhf.service.CartService;

import java.util.List;

/**
 * Created on 2019/12/25 0025.
 *
 * @author Administrator
 */
public class CartServiceImpl implements CartService {
    private CartDao cartDao = new CartDaoImpl();

    @Override
    public List<Cart> queryCartByUser(User user) {

        List<Cart> carts = cartDao.queryCartByUser(user);
        return carts;
    }

    @Override
    public int updateCartProductAmount(User user, Product product, String opt) {
        return cartDao.updateCartProductAmount(user.getId(), product.getId(), opt);
    }

    @Override
    public void insertCartProduct(User user, Product product) {
        cartDao.insertCartProduct(user.getId(), product.getId());
    }

    @Override
    public boolean deleteCartInfoByUserAndProduct(User user, Product product) {
        int uid = user.getId();
        int pid = product.getId() != null ? product.getId() : 0;
        int opt = cartDao.deleteCartInfoByUserAndProduct(uid, pid);
        return opt > 0;
    }

    @Override
    public Cart queryCartByUserAndProduct(User user, Product product) {
        Cart cart = cartDao.queryCartByUserAndProduct(user, product);
        return cart;
    }
}
