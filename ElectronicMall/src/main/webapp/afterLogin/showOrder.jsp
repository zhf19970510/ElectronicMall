<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="fix" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":"
            + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <base href="<%=basePath %>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>我的订单</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
    <link rel="shortcut icon" href="img/electronicMall.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/base.css">
    <style>
        ul li {
            list-style: none;
            padding: 5px;
            margin: 0;
            border-bottom: 1px solid rgb(231, 231, 231);
            text-align: center;
        }

        ul li > span {
            display: inline-block;
            text-align: center;
            width: 260px;
            margin: 0;
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

        .myPersonalInfo {
            display: inline-block;
            background: rgb(222, 225, 230);
            line-height: 50px;
            font-size: 18px;
            border: 1px solid rgb(40, 41, 35);
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
                    <input type="text" name="q" class="form-control" placeholder="请输入关键字" action="search" method="get">
                </div>
                <button type="submit" class="btn btn-default">查找</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <c:choose>
                    <c:when test="${sessionScope.user ne null}">
                        <li>
                            <a href="afterLogin/personalInfo?id=${sessionScope.user.id}">${sessionScope.user.loginName}</a>
                        </li>
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
    <img src="img/img3.jpg"/><br/><br/>
    <ul>
        <li>
            <span>订单编号</span>
            <span>创建时间</span>
            <span>消费总额</span>
            <span>收货地址</span>
        </li>
        <c:forEach items="${requestScope.orders}" var="order" varStatus="status">
            <li>
                <button style="display: inline-block;border:0; padding-left: -30px;" name="detail" index="${status.index}">▶</button>
                <span>${order.serialNumber}</span>
                <span>${order.createTime}</span>
                <span style="margin-left: -30px;">
                    ￥${order.cost}
                </span>
                <span style="text-align: center;" name="subTotal">${order.userAddress}</span>
                <div style="display: none;" name="orderDetails">
                    <ul>
                        <li>
                            <span>商品名称</span>
                            <span>商品类型</span>
                            <span>购买数量</span>
                            <span>小计</span>
                        </li>
                        <c:set value="${order.details}" var="subItem"></c:set>
                        <c:forEach items="${subItem }" var="detail" varStatus="status1">
                            <li>
                                <span style="margin-left: -180px;margin-right: 0;"><img src="${detail.product.fileName}"
                                                                       width="30%" /></span>
                                <span style=" margin-left: -87px;">${detail.product.name}</span>
                                <span>${detail.product.categoryLevel1.name}</span>
                                <span style="padding-left:110px;">
                    <input type="text" name="amount" value="${detail.quantity}" class="car_ipt"/>
                </span>
                                <span style="color:#ff4e00;text-align: center;"
                                      name="subTotal">￥${detail.product.price*detail.quantity}</span>
                            </li>

                        </c:forEach>
                    </ul>
                </div>
            </li>

        </c:forEach>
    </ul>

</div>
</body>
<script>
    $("button[name=detail]").click(function () {
        var symbol = $(this).text();
        var index = $(this).attr("index");
        if (symbol == "▶") {
            $("div[name=orderDetails]").eq(index).show();
            $("button[name=detail]").eq(index).text("▼");
        } else if (symbol == "▼") {
            $("div[name=orderDetails]").eq(index).hide();
            $("button[name=detail]").eq(index).text("▶");
        }
    })
</script>
</html>