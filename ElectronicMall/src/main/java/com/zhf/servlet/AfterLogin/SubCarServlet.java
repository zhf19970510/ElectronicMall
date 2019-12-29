package com.zhf.servlet.AfterLogin;

import com.zhf.entity.Product;
import com.zhf.entity.User;
import com.zhf.service.CartService;
import com.zhf.service.impl.CartServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created on 2019/12/26 0026.
 * @author Administrator
 */
@WebServlet("/afterLogin/subCar")
public class SubCarServlet extends HttpServlet {
    @SuppressWarnings("Duplicates")
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object[] productAndUser = AddCarServlet.getProductAndUser(request);
         Product product =(Product) productAndUser[0];
        User user = (User) productAndUser[1];
        CartService cartService = new CartServiceImpl();
        int amount = cartService.updateCartProductAmount(user, product, "-");
        AddCarServlet.writeOutSubTotal(product,amount,response);

    }
}
