package com.zhf.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

/**
 * Created on 2019/12/23 0023.
 */
@WebServlet("/loginOut")
public class LoginOutServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest requset, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = requset.getSession();
        session.setAttribute("user",null);
        //让当前的session对象强制过期，也叫做session销毁，一般用来做注销操作
        session.invalidate();
        Cookie[] cookies = requset.getCookies();
        for(Cookie cookie:cookies){
            if(cookie.getName().equals("loginId")){
                cookie.setValue("-1");
                cookie.setMaxAge(0);
                response.addCookie(cookie);
                break;
            }
        }
        response.sendRedirect("index.do");
    }
}
