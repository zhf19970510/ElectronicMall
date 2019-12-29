package com.zhf.servlet;

import com.zhf.entity.Page;
import com.zhf.entity.Product;
import com.zhf.entity.User;
import com.zhf.service.ProductService;
import com.zhf.service.UserService;
import com.zhf.service.impl.ProductServiceImpl;
import com.zhf.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

/**
 * Created on 2019/12/23 0023.
 *
 * @author Administrator
 */
public class ProductServlet extends HttpServlet {
    private ProductService productService = new ProductServiceImpl();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie:cookies){
            if(cookie.getName().equals("loginId")){

                int id = Integer.parseInt(cookie.getValue());
                UserService userService = new UserServiceImpl();
                User user = userService.queryUserById(id);
                if(user!=null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", user);
                }
                break;
            }
        }
        String currentPage = request.getParameter("currentPage");
        if (currentPage == null) {
            currentPage = "1";
        }
        Page<Product> page = new Page<>();
        int current = Integer.parseInt(currentPage);
        page.setCurrentPage(current);
        List<Product> products = productService.queryAllProduct(page);
        request.setAttribute("products", products);
        request.setAttribute("page", page);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }


}
