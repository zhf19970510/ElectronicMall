package com.zhf.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created on 2019/12/25 0025.
 */
@WebFilter("/admin/*")
public class AdminLoginValidationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        MyLoginValidation((HttpServletRequest) req, (HttpServletResponse) resp, chain,"admin");

    }

    public static void MyLoginValidation(HttpServletRequest req, HttpServletResponse resp, FilterChain chain,String role) throws IOException, ServletException {
        HttpServletRequest request = req;
        HttpServletResponse response = resp;
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute(role) == null) {
            String path = request.getContextPath();
            String basePath = request.getScheme() + "://"
                    + request.getServerName() + ":"
                    + request.getServerPort()
                    + path + "/";
            response.sendRedirect(basePath+"login.jsp");
        } else {
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {

    }
}
