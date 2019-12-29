package com.zhf.servlet.AfterLogin;

import com.zhf.entity.Order;
import com.zhf.entity.User;
import com.zhf.service.OrderService;
import com.zhf.service.impl.OrderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Created on 2019/12/28 0028.
 * @author Administrator
 */
@WebServlet("/afterLogin/showOrder")
public class showOrderServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        OrderService orderService = new OrderServiceImpl();
        List<Order> orders = orderService.queryOrderByUser(user);
        request.setAttribute("orders",orders);
        request.getRequestDispatcher("showOrder.jsp").forward(request,response);

    }
}
