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
    <base href="<%=basePath %>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>商品详情</title>
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
        .details{
            padding: 50px 100px;
        }
        ul>li>div{
            display: inline-block;
            padding: 5px;
            border: 1px solid grey;
        }
        .main>h2{
            margin-top: 50px;
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
    <h2 style="text-align: center;">${requestScope.product.name}</h2>
    <div class="details">

        <div style="margin-right: 100px; display: inline-block; float: left;">
            <img src="${requestScope.product.fileName}" width="250px" height="300px" style="margin-top: -50px" />
        </div>
        <div style="float: left; width: 500px">
            <ul>
                <li style="margin-bottom: 30px; text-align: left;">价格：<span style="color: red; font-weight: bold;">￥${requestScope.product.price}</span></li>
                <li style="margin-bottom: 30px; text-align: left;">种类：<div style="margin-right: 18px;text-align: center;">${requestScope.product.categoryLevel1.name}</div><div style="margin-right: 18px">${requestScope.product.categoryLevel2.name}</div><div>${requestScope.product.categoryLevel3.name}</div></li>
                <li style="margin-bottom: 30px; text-align: left;">库存量：${requestScope.product.stock}</li>
                <li style="margin-bottom: 30px; text-align: left;">详情：${requestScope.product.description}</li>
            </ul>
            <div style="text-align: center;"><a href="afterLogin/addCar?productId=${requestScope.product.id}"><img src="img/j_car.png"></a></div>
        </div>
    </div>
</div>
</body>
</html>