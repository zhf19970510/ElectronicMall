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
    <title>确认订单</title>
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
        ul li>span{
            display: inline-block;
            text-align: center;
            width: 180px;
            margin:0;
        }

        .car_btn_1 {
            width: 21px;
            height: 21px;
            overflow: hidden;
            background: url(img/jian.gif) no-repeat center top;
            float: left;
            border: 0;
            border-right: 1px solid #cccccc;
            cursor: pointer;
        }

        .car_btn_2 {
            width: 21px;
            height: 21px;
            overflow: hidden;
            background: url(img/jia.gif) no-repeat center top;
            float: left;
            border: 0;
            border-left: 1px solid #cccccc;
            cursor: pointer;
        }
        .car_ipt {
            width: 42px;
            height: 21px;
            line-height: 21px \9;
            background-color: #FFF;
            color: #555555;
            font-size: 14px;
            text-align: center;
            font-family: "Microsoft YaHei";
            float: left;
            padding: 0;
            border: 0;
        }
        .myPersonalInfo{
            display: inline-block;
            background: rgb(222,225,230);
            line-height: 50px;
            font-size: 18px;
            border: 1px solid rgb(40,41,35);
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
    <div style="margin: 25px;margin-left: 100px">
        <form action="afterLogin/submitOrder" method="post">
            <img src="img/img2.jpg" /><br/><br/>
            <ul>
                <li>
                    <span>商品名称</span>
                    <span>商品类型</span>
                    <span>购买数量</span>
                    <span>小计</span>
                </li>
                <c:forEach items="${requestScope.carts}" var="cart" varStatus="status">
                <li>
                    <span style="margin-left: -180px"><img src="${cart.product.fileName}" width="70%"></span>
                    <span>${cart.product.name}</span>
                    <span>${cart.product.categoryLevel1.name}</span>
                    <span style="padding-left: 60px;">
                    <input type="text" name="amount"  value="${cart.amount}" class="car_ipt" />
                </span>
                    <span  style="color:#ff4e00;text-align: center;" name="subTotal">￥${cart.product.price*cart.amount}</span>
                    <div style="display: none;">
                        <input type="text" name="productId" value="${cart.product.id}">
                    </div>
                </li>

                </c:forEach>
            </ul>
            <div style="color:#3e3e3e; font-size:20px;margin: 40px;margin-top: 20px;margin-left: 25px;">
                收货人信息
            </div>
            <ul style="text-align: center;">
                <li style="border-bottom: 0"><span class="myPersonalInfo" style="font-weight: bolder;width: 200px;">收件人</span><span  class="myPersonalInfo" style="width: 700px;border-left: 0;">${sessionScope.user.loginName}</span></li>
                <li style="border-bottom: 0"><span  class="myPersonalInfo" style="font-weight: bolder;width: 200px;">邮箱</span><span  class="myPersonalInfo" style="width: 700px; border-left: 0;">${sessionScope.user.email}</span></li>
                <li style="border-bottom: 0"><span  class="myPersonalInfo" style="font-weight: bolder;width: 200px;">手机</span><span  class="myPersonalInfo" style="width: 700px; border-left: 0;">${sessionScope.user.mobile}</span></li>
                <li style="border-bottom: 0"><span  class="myPersonalInfo" style="font-weight: bolder;width: 200px;">收件地址</span><span  class="myPersonalInfo" style="width: 700px; border-left: 0;">北京市海淀区大有庄</span></li>
            </ul>
            <div style="display: inline-block; float: right; margin-right: 50px; font-size: 22px;">商品总价: ￥<span style="color: red;">${requestScope.total}</span> 元</div><br/>
            <button name="confirm" style="border: 0; padding: 0;margin-top: 20px;clear: both;float: right; margin-right: 50px;"><img src="img/btn_sure.gif"></button>
        </form>
    </div>
</div>
</body>
</html>