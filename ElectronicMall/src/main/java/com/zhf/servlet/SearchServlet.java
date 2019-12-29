package com.zhf.servlet;

import com.zhf.entity.Page;
import com.zhf.entity.Product;
import com.zhf.service.ProductService;
import com.zhf.service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created on 2019/12/23 0023.
 */
@WebServlet("/search")
public class SearchServlet extends HttpServlet {
    ProductService productService = new ProductServiceImpl();
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String key = request.getParameter("q");
        List<Product> products = productService.queryProductByKey(key);
        request.setAttribute("products",products);
        request.getRequestDispatcher("searchResult.jsp").forward(request,response);
    }
}
