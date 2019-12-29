package com.zhf.servlet.AfterLogin;

import com.zhf.entity.User;
import com.zhf.service.UserService;
import com.zhf.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created on 2019/12/25 0025.
 * @author Administrator
 */
@WebServlet("/afterLogin/personalInfo")
public class PersonalInfoServlet extends HttpServlet {
    UserService userService = new UserServiceImpl();
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.queryUserById(id);
        request.setAttribute("user",user);
        request.getRequestDispatcher("personalInfo.jsp").forward(request,response);
    }
}
