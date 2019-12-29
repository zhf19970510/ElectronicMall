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
    <title>购物车</title>
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
    <div style="font-size: 18px; text-align: center; margin: 20px auto;">感谢您在本店购物！您的订单已提交成功，请请记住您的订单号: <span style="color:#ff4e00;">${requestScope.serialNumber}</span>
    </div>
    <div style="text-align: center; margin: 20px auto; font-size: 15px;">
        您选定的配送方式为: <span style="color:#ff4e00;">申通快递</span>； &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;您选定的支付方式为: <span style="color:#ff4e00;">支付宝</span>； &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您的应付款金额为: <span style="color:#ff4e00;">￥${requestScope.cost}</span>
    </div>
    <hr width="80%" style="border: 1px solid rgb(231,231,231)" />
    <div style="text-align: center; font-size: 15px; line-height: 40px;">
        银行名称 收款人信息：全称 ××× ；帐号或地址 ××× ；开户行 ×××。 <br />
        注意事项：办理电汇时，请在电汇单“汇款用途”一栏处注明您的订单号。
    </div>
    <div style="text-align: center; line-height: 80px;">
        <a href="index.do">首页</a> &nbsp; &nbsp; <a href="afterLogin/personalInfo?id=${sessionScope.user.id}">用户中心</a>
    </div>
</div>
</body>
</html>