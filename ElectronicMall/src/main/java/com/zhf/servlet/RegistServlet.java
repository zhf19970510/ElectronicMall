package com.zhf.servlet;

import com.zhf.service.UserService;
import com.zhf.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created on 2019/12/23 0023.
 * @author Administrator
 */
@WebServlet("/regist")
public class RegistServlet extends HttpServlet {
    private UserService userService = new UserServiceImpl();
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String loginName = request.getParameter("loginName");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        //先判断用户名是否重复
        boolean exist = false;
        exist = userService.queryName(loginName);
        if(exist){
            request.setAttribute("msg","用户名已存在");
            request.getRequestDispatcher("regist.jsp").forward(request,response);
        }else {
            if(!password.equals(repassword)){
                request.setAttribute("msg","两次输入的密码不一致");
                request.getRequestDispatcher("regist.jsp").forward(request,response);
            }else {
                //做插入操作
                boolean b = userService.addUser(loginName, password);
                if(b) {
                    response.sendRedirect("login.jsp");
                }else {
                    request.setAttribute("msg","注册失败！");
                    request.getRequestDispatcher("regist.jsp").forward(request,response);
                }
            }
        }

    }
}
