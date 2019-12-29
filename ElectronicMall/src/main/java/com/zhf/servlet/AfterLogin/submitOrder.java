package com.zhf.servlet.AfterLogin;

import com.zhf.entity.Cart;
import com.zhf.entity.Product;
import com.zhf.entity.User;
import com.zhf.service.CartService;
import com.zhf.service.OrderService;
import com.zhf.service.ProductService;
import com.zhf.service.impl.CartServiceImpl;
import com.zhf.service.impl.OrderServiceImpl;
import com.zhf.service.impl.ProductServiceImpl;
import com.zhf.utils.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.RequestWrapper;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created on 2019/12/27 0027.
 * @author Administrator
 */
@WebServlet("/afterLogin/submitOrder")
public class submitOrder extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] productIds = request.getParameterValues("productId");
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        ProductService productService = new ProductServiceImpl();
        CartService cartService = new CartServiceImpl();
        List<Cart> carts = new ArrayList<>();
        float cost = 0.0f;
        // 生成一个随机订单号
        String uuid = StringUtils.randomUUID();
        for (String productId:productIds){
            int pid = Integer.parseInt(productId);
            Product product = productService.getProductById(pid);
            Cart cart = cartService.queryCartByUserAndProduct(user,product);
            float price = cart.getProduct().getPrice();
            int amount = cart.getAmount();
            float subtotal = price*amount;
            cost += subtotal;
            carts.add(cart);
        }
        OrderService orderService = new OrderServiceImpl();
        boolean isCreated = orderService.createOrder(user,cost,uuid,carts);
        if(isCreated) {
            request.setAttribute("cost", cost);
            request.setAttribute("serialNumber", uuid);
            request.getRequestDispatcher("submitOrder.jsp").forward(request, response);
        }else {
            request.getRequestDispatcher("../error.jsp").forward(request,response);
        }
    }
}
