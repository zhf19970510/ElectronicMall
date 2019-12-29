package com.zhf.filter;


import javax.servlet.*;
import java.io.IOException;

/**
 * Created on 2019/12/4 0004.
 */
public class EncodingFilter implements Filter {
    private String encoding = "GBK";

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        encoding = filterConfig.getInitParameter("encoding");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        request.setCharacterEncoding(encoding);
        chain.doFilter(request,response);
        response.setCharacterEncoding("utf-8");
    }

    @Override
    public void destroy() {
    }
}
