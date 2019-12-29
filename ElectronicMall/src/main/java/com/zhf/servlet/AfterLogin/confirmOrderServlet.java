package com.zhf.servlet.AfterLogin;

import com.zhf.entity.Cart;
import com.zhf.entity.Product;
import com.zhf.entity.User;
import com.zhf.service.CartService;
import com.zhf.service.ProductService;
import com.zhf.service.impl.CartServiceImpl;
import com.zhf.service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created on 2019/12/27 0027.
 * @author Administrator
 */
@WebServlet("/afterLogin/confirmOrderServlet")
public class confirmOrderServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] productIds = request.getParameterValues("single");
        for(String productIdS: productIds){
            System.out.println(productIdS);
        }
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        ProductService productService = new ProductServiceImpl();
        List<Cart> carts = new ArrayList<>();
        CartService cartService = new CartServiceImpl();
        //需要计算总额
        float total = 0;
        for(String productId:productIds){
            try {
                int pid = Integer.parseInt(productId);
                Product product = productService.getProductById(pid);
                Cart cart = cartService.queryCartByUserAndProduct(user,product);
                float subAmount = cart.getAmount()*product.getPrice();
                total += subAmount;
                carts.add(cart);
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        request.setAttribute("carts",carts);
        request.setAttribute("total",total);
        request.getRequestDispatcher("confirmOrder.jsp").forward(request,response);
    }
}
