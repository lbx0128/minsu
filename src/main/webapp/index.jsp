<%--
  Created by IntelliJ IDEA.
  User: hero
  Date: 2018/12/29
  Time: 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% String basePath = request.getScheme() + "://" + request.getServerName() +
        ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>首页</title>
    <link rel="shortcut icon"
          href="https://www.baidu.com/favicon.ico">
</head>
<body>
<h1>带民俗欢迎你呀</h1>
<hr>
<a href="hotel/hotelinfos/1">房源信息</a>
<a href="hotel/hotelinfos">新增房间</a>
<a href="hotel/recommend">今日推荐</a>
<a href="user/userinfos/1">用户信息</a>
<a href="user/userinfos">新增用户</a>
</body>
</html>
