package com.zhf.servlet;

import com.zhf.service.UserService;
import com.zhf.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created on 2019/12/24 0024.
 */
@WebServlet("/checkName")
public class CheckName extends HttpServlet {
    private UserService userService = new UserServiceImpl();
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String loginName = request.getParameter("loginName");
        String flag = "Y";
        // 到用户表中查找是否已经有该用户名
        boolean exist = false;
        exist = userService.queryName(loginName);
        if(exist){
            flag="N";
        }
        PrintWriter out = response.getWriter();
        out.write(flag);
        out.close();

    }
}
