<%@ page import="com.zhf.entity.Page" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="fix" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"
            +request.getServerName()+":"
            +request.getServerPort()
            +path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>搜索结果</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
    <link rel="shortcut icon" href="img/electronicMall.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/base.css">
    <style>
        ul li{
            list-style: none;
            padding: 5px;
            margin: 0;
            border-bottom: 1px solid rgb(231,231,231);
            text-align: center;
        }
        ul li span{
            display: inline-block;
            text-align: center;
            width: 200px;
        }

    </style>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">
                <img class="logo" src="img/electronicMall.png">
            </a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="index.do">首页<span class="sr-only">(current)</span></a></li>
            </ul>
            <form class="navbar-form navbar-left" style="margin-left:200px; " action="search">
                <div class="form-group">
                    <input type="text" name="q" class="form-control" placeholder="请输入关键字" action="search" method="get" >
                </div>
                <button type="submit" class="btn btn-default">查找</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <c:choose>
                    <c:when test="${sessionScope.user ne null}">
                        <li><a href="afterLogin/personalInfo?id=${sessionScope.user.id}">${sessionScope.user.loginName}</a></li>
                        <li><a href="loginOut">注销</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="login.jsp">登录</a></li>
                        <li><a href="regist.jsp">注册</a></li>
                    </c:otherwise>
                </c:choose>

            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="main">
    <ul>
        <c:choose>
            <c:when test="${ (requestScope.products eq null) or (requestScope.products.size() eq 0)}">
                <div style="text-align: center; font-weight: bold; font-size: 18px; color: red;">您搜索的商品没有找到！</div>
            </c:when>
            <c:otherwise>
            <li style="background-color:#f6f6f6;">
                <span style="font-weight: bold;">商品名称</span>
                <span style="font-weight: bold;">价格</span>
                <span style="font-weight: bold;">种类</span>
                <span style="font-weight: bold;">库存量</span>
            </li>
            </c:otherwise>
        </c:choose>
        <c:forEach items="${requestScope.products}" var="product" varStatus="status">
            <c:choose>
                <c:when test="${status.index%2 != 0 }">
                    <li style="background-color:#f6f6f6;">
                </c:when>
                <c:otherwise>
                    <li>
                </c:otherwise>
            </c:choose>
            <span><a href="productDetail?productId=${product.id}">${product.name}</a></span>
            <span>${product.price}元</span>
            <span>${product.categoryLevel1.name}</span>
            <span>${product.stock}</span>
            </li>
        </c:forEach>

    </ul>
</div>
</body>
</html>
