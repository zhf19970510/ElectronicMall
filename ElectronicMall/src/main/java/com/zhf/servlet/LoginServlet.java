package com.zhf.servlet;

import com.zhf.entity.User;
import com.zhf.service.UserService;
import com.zhf.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

/**
 * Created on 2019/12/23 0023.
 *
 * @author Administrator
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String loginName = request.getParameter("loginName");
        String password = request.getParameter("password");
        String remberme = request.getParameter("remberme");
        if (loginName == null || password == null || loginName == "" || password == "") {
            request.setAttribute("errorMsg", "用户名或密码不能为空");

        } else {
            UserService userService = new UserServiceImpl();
            User user = userService.getLoginUser(loginName, password);
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                if ("on".equals(remberme)) {
                    Cookie cookie = new Cookie("loginId", String.valueOf(user.getId()));
                    cookie.setMaxAge(24 * 3600);
                    response.addCookie(cookie);
                }
            }
        }
        request.getRequestDispatcher("index.do").forward(request, response);
    }
}
