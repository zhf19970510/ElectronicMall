package com.zhf.servlet;

import com.zhf.entity.Product;
import com.zhf.service.ProductService;
import com.zhf.service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created on 2019/12/24 0024.
 * @author Administrator
 */
@WebServlet("/productDetail")
public class ProductDetailServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId =Integer.parseInt(request.getParameter("productId"));
        ProductService productService = new ProductServiceImpl();

        Product product = productService.getProductById(productId);

        request.setAttribute("product",product);

        request.getRequestDispatcher("productDetails.jsp").forward(request,response);

    }
}
