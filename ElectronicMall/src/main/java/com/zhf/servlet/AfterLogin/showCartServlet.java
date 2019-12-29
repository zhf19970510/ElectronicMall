package com.zhf.servlet.AfterLogin;

import com.zhf.entity.Cart;
import com.zhf.entity.User;
import com.zhf.service.CartService;
import com.zhf.service.impl.CartServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Created on 2019/12/25 0025.
 * @author Administrator
 */
@WebServlet("/afterLogin/showCart")
public class showCartServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Cart> carts = getSessionCarts(request);
        request.setAttribute("carts",carts);
        request.getRequestDispatcher("showCart.jsp").forward(request,response);
    }
    public static List<Cart> getSessionCarts(HttpServletRequest request){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        CartService cartService = new CartServiceImpl();
        List<Cart> carts = cartService.queryCartByUser(user);
        return carts;
    }
}
