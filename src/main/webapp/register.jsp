<%--
  Created by IntelliJ IDEA.
  User: hero
  Date: 2018/12/31
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() +
        ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>注册</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/register.css" rel="stylesheet">
</head>
<body>
<h1>用户注册</h1>
<hr>
<form class="form-horizontal register-form" action="#">
    <div class="form-group">
        <label for="account" class="col-sm-2 control-label">账号</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="account"
                   placeholder="账号">
        </div>
    </div>
    <div class="form-group">
        <label for="password" class="col-sm-2 control-label">密码</label>
        <div class="col-sm-10">
            <input type="password" class="form-control" id="password" placeholder="Password">
        </div>
    </div>
    <div class="form-group">
        <label for="repeatpassword" class="col-sm-2 control-label">确认密码</label>
        <div class="col-sm-10">
            <input type="password" class="form-control" id="repeatpassword"
                   placeholder="重复输入密码">
        </div>
    </div>
    <div class="form-group">
        <label for="name" class="col-sm-2 control-label">姓名</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="name"
                   placeholder="你的名字">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">性别</label>
        <div class="col-sm-10">
            <label class="radio-inline">
                <input type="radio" name="inlineRadioOptions"
                       id="inlineRadio1" value="man"> 男
            </label>
            <label class="radio-inline">
                <input type="radio" name="inlineRadioOptions"
                       id="inlineRadio2" value="woman"> 女
            </label>
        </div>
    </div>
    <div class="form-group">
        <label for="age" class="col-sm-2 control-label">年龄</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="age"
                   placeholder="多大">
        </div>
    </div>
    <div class="form-group">
        <label for="phone" class="col-sm-2 control-label">手机号</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="phone"
                   placeholder="手机号">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-info">注册</button>
        </div>
    </div>
</form>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<script>
    $(function(){
        <%--<c:if test="${!empty msg}">--%>
        <%--$("span.errorMessage").html("${msg}");--%>
        <%--$("div.registerErrorMessageDiv").css("visibility","visible");--%>
        <%--</c:if>--%>

        $("div.registerErrorMessageDiv").hide();

        $(".registerForm").submit(function(){
            if(0==$("#account").val().length){
                $("span.errorMessage").html("请输入用户名");
                $("div.registerErrorMessageDiv").css("visibility","visible");
                return false;
            }
            if(0==$("#password").val().length){
                $("span.errorMessage").html("请输入密码");
                $("div.registerErrorMessageDiv").css("visibility","visible");
                return false;
            }
            if(0==$("#repeatpassword").val().length){
                $("span.errorMessage").html("请输入重复密码");
                $("div.registerErrorMessageDiv").css("visibility","visible");
                return false;
            }
            if($("#password").val() !=$("#repeatpassword").val()){
                $("span.errorMessage").html("重复密码不一致");
                $("div.registerErrorMessageDiv").show();
                return false;
            }
            return true;
        });
    })
</script>
</body>
</html>
