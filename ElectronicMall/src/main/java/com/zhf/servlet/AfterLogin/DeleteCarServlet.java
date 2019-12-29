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
import java.io.PrintWriter;

/**
 * Created on 2019/12/26 0026.
 * @author Administrator
 */
@SuppressWarnings("Duplicates")
@WebServlet("/afterLogin/delCar")
public class DeleteCarServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId =Integer.parseInt(request.getParameter("productId"));
        Object[] productAndUser = AddCarServlet.getProductAndUser(request);
        Product product =(Product) productAndUser[0];
        User user = (User) productAndUser[1];
        CartService cartService = new CartServiceImpl();
        boolean isDelete = cartService.deleteCartInfoByUserAndProduct(user,product);
        String flag = "Y";
        if(!isDelete){
            flag = "N";
        }
        PrintWriter writer = response.getWriter();
        writer.write(flag);
        writer.close();

    }
}
