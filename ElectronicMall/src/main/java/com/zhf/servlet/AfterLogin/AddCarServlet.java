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
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.util.List;

/**
 * Created on 2019/12/25 0025.
 * @author Administrator
 */
@WebServlet("/afterLogin/addCar")
public class AddCarServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object[] productAndUser = getProductAndUser(request);
        Product product =(Product) productAndUser[0];
        User user = (User) productAndUser[1];
        List<Cart> carts = showCartServlet.getSessionCarts(request);
        int amount = 0;
        boolean isNew = true;
        for (Cart cart:carts){
            if(cart.getProduct().equals(product)){
                // 在数据库的购物车对应的表里面对应该商品数量加1
                CartService cartService = new CartServiceImpl();
                amount = cartService.updateCartProductAmount(user, product,"+");
                isNew = false;
                break;
            }
        }
        if(isNew){
            CartService cartService = new CartServiceImpl();
            cartService.insertCartProduct(user,product);
            amount = 1;
        }
        String requestByAdd = request.getParameter("requestByAdd");
        if(requestByAdd!=null && requestByAdd.equals("yes")) {
            writeOutSubTotal(product,amount,response);
        }else {
            request.getRequestDispatcher("showCart").forward(request, response);
        }
    }

    public static Object[] getProductAndUser(HttpServletRequest request){
        int id = Integer.parseInt(request.getParameter("productId"));
        ProductService productService = new ProductServiceImpl();
        Product product = productService.getProductById(id);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        return new Object[]{product,user};
    }
    public static void writeOutSubTotal(Product product,int amount,HttpServletResponse response) throws IOException {
        float price = product.getPrice();
        double subTotal = amount * price;
        NumberFormat nf = NumberFormat.getNumberInstance();
        //设置小数点位数为一位
        nf.setMaximumFractionDigits(1);
        nf.setMinimumFractionDigits(1);
        PrintWriter writer = response.getWriter();
        writer.write(nf.format(subTotal));
        writer.close();
    }
}
