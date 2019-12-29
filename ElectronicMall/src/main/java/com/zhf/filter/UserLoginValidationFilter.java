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
@WebFilter("/afterLogin/*")
public class UserLoginValidationFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        AdminLoginValidationFilter.MyLoginValidation((HttpServletRequest) req, (HttpServletResponse) resp, chain,"user");
    }

    @Override
    public void destroy() {

    }
}
