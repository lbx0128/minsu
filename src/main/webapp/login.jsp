<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hero
  Date: 2018/12/31
  Time: 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() +
        ":" + request.getServerPort() + request.getContextPath() + "/";
%>

<html>
<head>
    <base href="<%=basePath %>">
    <title>登录</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        img.loginBackgroundImg {
            display: block;
            margin: 0px auto;
        }

        div.loginSmallDiv {
            background-color: white;
            position: absolute;
            right: 30%;
            top: 180px;
            width: 350px;
            height: 400px;
            padding: 60px 25px 80px 25px;
        }

        div.login_acount_text {
            color: #3C3C3C;
            font-size: 16px;
            font-weight: bold;
        }

        div.loginInput {
            border: 1px solid #CBCBCB;
            margin: 20px 0px;
        }

        div.loginInput span.loginInputIcon {
            margin: 0px;
            background-color: #CBCBCB;
            width: 40px;
            height: 40px;
            display: inline-block;
        }

        span.loginInputIcon span.glyphicon {
            font-size: 22px;
            position: relative;
            left: 9px;
            top: 9px;
            color: #606060;
        }

        div.loginInput input {
            display: inline-block;
            border: 0px solid transparent;
            width: 244px;
            height: 30px;
            position: relative;
            left: 6px;
            top: 6px;
        }

        body {
            font-size: 12px;
            font-family: Arial;
        }

        a {
            color: #999;
        }

        a:hover {
            text-decoration: none;
            color: #00a6c4;
        }

        button.redButton {
            color: white;
            background-color: #00a6c4;
            font-size: 14px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div id="loginDiv" style="position: relative">
    <img id="loginBackgroundImg" class="loginBackgroundImg"
         src="image/login1.png">

    <%--<form class="loginForm" action="account/login" method="post">--%>
    <%--<form class="loginForm">--%>
        <div id="loginSmallDiv" class="loginSmallDiv">
            <div class="loginErrorMessageDiv" hidden="hidden">
                <div class="alert alert-danger">
                    <button type="button" class="close" data-dismiss="alert"
                            aria-label="Close"></button>
                    <span class="errorMessage"></span>
                </div>
            </div>

            <div class="login_acount_text">账户登录</div>
            <div class="loginInput">
				<span class="loginInputIcon">
					<span class=" glyphicon glyphicon-user"></span>
				</span>
                <input id="name" name="name" placeholder="手机/会员名/邮箱"
                       type="text">
            </div>

            <div class="loginInput ">
				<span class="loginInputIcon ">
					<span class=" glyphicon glyphicon-lock"></span>
				</span>
                <input id="password" name="password" type="password"
                       placeholder="密码" type="text">
            </div>

            <div>
                <a class="notImplementLink" href="#nowhere">忘记登录密码</a>
                <a href="register.jsp" class="pull-right">免费注册</a>
            </div>
            <div style="margin-top:20px">
                <button class="btn btn-block redButton" id="button-login">登录
                </button>
            </div>
        </div>
    <%--</form>--%>


</div>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<script>
    $(function () {
        // $("div.loginErrorMessageDiv").hide();
        // 刚进来哪来的错啊

        // $("form.loginForm").submit(function () {
        $("#button-login").click(function () {
            // 判断是否输入了用户名和密码
            if (0 === $("#name").val().length || 0 ===
                $("#password").val().length) {
                $("span.errorMessage").html("请输入账号密码");
                $("div.loginErrorMessageDiv").show();
            }
            // 如果有, 就
            else {
                $.post("account/login",
                    {name: $("#name").val(), password: $("#password").val()},
                    function (data) {
                        //TODO 登录验证成功, 跳转到(用户/管理员)首页
                        if(data.status === "success") {
                            window.location.href = "hotel/hotelinfos/1"
                            // $("span.errorMessage").html(data.admin);
                            // $("div.loginErrorMessageDiv").show();
                        }
                        else {
                            $("span.errorMessage").html("用户名或密码错误");
                            $("div.loginErrorMessageDiv").show();
                        }
                    },
                    "json");
            }
        });
        $(":input").keyup(function () {
            $("div.loginErrorMessageDiv").hide();
        });
        var left = window.innerWidth / 2 + 162;
        $("div.loginSmallDiv").css("left", left);
    })
</script>
</body>
</html>



