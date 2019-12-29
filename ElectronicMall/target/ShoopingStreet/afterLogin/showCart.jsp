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
    <div style="margin: 25px;margin-left: 100px">
        <form action="afterLogin/confirmOrderServlet" method="post" id="checkSumForm">
            <img src="img/img1.jpg" /><br/><br/>
            <ul>
                <li>
                    <span style="font-weight: bold;">商品名称</span>
                    <span style="font-weight: bold;">商品类型</span>
                    <span style="font-weight: bold;">购买数量</span>
                    <span style="font-weight: bold;">小计</span>
                    <span style="font-weight: bold;">操作</span>
                    <input type="checkbox" name="all" id="all" onclick="checkAll()">全选
                </li>
                <c:forEach items="${requestScope.carts}" var="cart" varStatus="status">
                <li class="mycar">
                    <span style="margin-left: -213px"><img src="${cart.product.fileName}" width="70%"></span>
                    <span>${cart.product.name}</span>
                    <span>${cart.product.categoryLevel1.name}</span>
                    <span style="padding-left: 47px;">
                        <input type="button" class="car_btn_1" index="${status.index}" />
                        <input type="text" name="amount"  value="${cart.amount}"  class="car_ipt" />
                        <input type="button"  class="car_btn_2" index="${status.index}" />
                    </span>

                    <span  style="color:#ff4e00;text-align: center;" name="subTotal">￥${cart.product.price*cart.amount}</span>
                    <span>
                        <a name="delete" href="#" index="${status.index}">删除</a>
                    </span>
                    <input type="checkbox" name="single" productId="${cart.product.id}" value="${cart.product.id}" onclick="checkItem(this)" index="${status.index}">
                </li>
                </c:forEach>
            </ul>

            <%--<div style="display: inline-block; float: right; margin-right: 50px; font-size: 22px;">商品总价: ￥<span style="color: red;" name="totalCount">0.0</span> 元</div><br/>--%>
            <button name="confirm" style="border: 0; padding: 0;margin-top: 20px;clear: both;float: right; margin-right: 50px;" onclick="return myConfirm()"><img src="img/buy2.gif"></button>
        </form>
    </div>
</div>
</body>
<script type="text/javascript">
    $(".car_btn_1").click(function () {
        // 获取当前为第几个对象，以方便修改对应amount的值(找到对应下标)
        var index = $(this).attr("index");
        // 获取当前amount
        var a  = $("input[name=amount]").eq(index).val();
        // 根据当前amount值判断是否，让当前按钮失效
        if(a == 0){
            return;
        }
        var productId = $("input[name=single]").eq(index).attr("productId");
        var dataParam = {"productId":productId};
        $.get({
            url:"/ElectronicMall/afterLogin/subCar",
            data:dataParam,
            dataType:"text",
            success:function (msg) { // msg 是后端传过来的小计
                // 将该msg的值填入amount对应input的value中
                $("input[name=amount]").eq(index).val(parseInt(a)-1);
                $("span[name=subTotal]").eq(index).text("￥"+msg);
            }
        })

    })
    $(".car_btn_2").click(function () {
        // 获取当前为第几个对象，以方便修改对应amount的值(找到对应下标)
        var index = $(this).attr("index");
        // 获取当前amount
        var a  = $("input[name=amount]").eq(index).val();
        var productId = $("input[name=single]").eq(index).attr("productId");
        var dataParam = {"productId":productId,"requestByAdd":"yes"};
        $.get({
            url:"/ElectronicMall/afterLogin/addCar",
            data:dataParam,
            dataType:"text",
            success:function (msg) { // msg 是后端传过来的小计
                // 将该msg的值填入amount对应input的value中
                $("input[name=amount]").eq(index).val(parseInt(a)+1);
                $("span[name=subTotal]").eq(index).text("￥"+msg);
            }
        })
    })
    $("a[name=delete]").click(function () {
        // 获取当前为第几个对象，以方便修改对应amount的值(找到对应下标)
        var index = $(this).attr("index");
        var productId = $("input[name=single]").eq(index).attr("productId");
        var dataParam = {"productId":productId};
        $.get({
            url:"/ElectronicMall/afterLogin/delCar",
            data:dataParam,
            dataType:"text",
            success:function (msg) {
                if(msg == 'Y'){
                    $("li[class=mycar]").eq(index).remove();
                    //修改对应index的值
                    var btn1_size = $("li[class=mycar]").length;
                    for(var i = 0;i<btn1_size;i++){
                        $(".car_btn_1").eq(i).attr("index",i);
                        $(".car_btn_2").eq(i).attr("index",i);
                        $("a[name=delete]").eq(i).attr("index",i);
                        $("input[name=single]").eq(i).attr("index",i);
                    }

                }
            }
        })
        return false;
    })

    function checkAll(){
        var oInput=document.getElementsByName("single");
        var totalCount = 0.0;
        for(var i=0;i<oInput.length;i++){
            if(document.getElementById("all").checked==true){
                oInput[i].checked=true;
                var subTotal = $("span[name=subTotal]").eq(i).text().substr(1);
                var sub = parseFloat(subTotal);
                totalCount = totalCount + sub;
            }else{
                oInput[i].checked=false;
            }
        }
        // $("span[name=totalCount]").text(totalCount);
    }
    function checkItem(ele){
        var root = document.getElementById("all");
        var oldTotalCount = $("span[name=totalCount]").text();
        oldTotalCount = parseFloat(oldTotalCount);
        var index = $(ele).attr("index");
        index = parseInt(index);
        var subTotal = $("span[name=subTotal]").eq(index).text().substr(1);
        subTotal = parseFloat(subTotal);
        if(!ele.checked){
            //当在全选状态去除某个非全选复选框时，全选复选框checked属性要设为false
            root.checked=false;
            oldTotalCount = oldTotalCount - subTotal;
        }else{
            //当在全不选状态时，补全剩下的非全选复选框时，全选复选框checked属性设为true
            oldTotalCount = oldTotalCount + subTotal;
            var elem = document.getElementsByName(ele.name);
            var flag = true;
            for(var i = 0;i<elem.length;i++){
                if(!elem[i].checked){
                    flag = false;
                    break;
                }
            }
            root.checked = flag;
        }
        //$("span[name=totalCount]").text(oldTotalCount);
    }
    function myConfirm() {
        var checkbox1 = document.getElementsByName("single");
        var flag = false;
        for (var i=0;i<checkbox1.length;i++){
            if(checkbox1[i].checked){
                flag = true;
                break;
            }
        }
        if(!flag){
            alert("请勾选要结算的商品");
            return false;
        }
        $("#checkSumForm").submit();
    }
</script>
</html>