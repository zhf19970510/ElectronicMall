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
    <title>注册</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="js/jquery-3.2.1.js" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
    <link rel="shortcut icon" href="img/electronicMall.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/login_regist.css">

    <style>
        ul li {
            list-style: none;
            padding: 5px;
            margin: 0;
            border-bottom: 1px solid rgb(231, 231, 231);
            text-align: center;
        }

        ul li span {
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
                    <input type="text" name="q" class="form-control" placeholder="请输入关键字">
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
    <div style="text-align: center; font-weight: bold; font-size: 18px; color: red;">${msg}</div>
    <form action="regist" method="post" id="registForm">
        <div class="form-container" style="width: 300px; margin: 0 auto;">
            <h3 class="page-title">注册</h3>
            <div class="form-group">
                <input type="text" class="form-control" placeholder="用户名" name="loginName" id="loginName">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="密码" name="password" id="password">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="确认密码" name="repassword" id="repassword">
            </div>
            <div class="form-group">
                <button class="btn btn-primary btn-block" id = "RegistBtn">立即注册</button>
            </div>
        </div>
    </form>

</div>
</body>
<script type="text/javascript">
    $("#loginName").on('blur', function () {
        var loginName =$(this).val();
        var dataParam = {"loginName":loginName};
        $.post({
            url:"/ElectronicMall/checkName",
            data:dataParam,
            dataType:"text",
            success:function (msg) {
                if(msg == 'N'){
                    $("#s1").remove();
                    var span = "<span id='s1' style='color:red'>用户名已存在</span>";
                    $("#loginName").after(span);
                }else {
                    $("#s1").remove();
                }
            }
        })

    })
    $("#repassword").on('blur',function () {
        var password = $("#password").val();
        var repassword = $("#repassword").val();
        if(password != repassword){
            $("#s1").remove();
            var span = "<span id='s1' style='color:red'>两次输入的密码不一致</span>";
            $("#repassword").after(span);
        }else {
            $("#s1").remove();
        }
    })
    $("#RegistBtn").click(function () {
        var name = $("#loginName").val();
        var password = $("#password").val();
        var repassword = $("#repassword").val();
        if(name.trim() && password.trim() && repassword.trim()){
            $("#registForm").submit();
        }else {
            alert("用户名或密码不能为空");
        }
    })
</script>
</html>