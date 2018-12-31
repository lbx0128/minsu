<%--
  Created by IntelliJ IDEA.
  User: hero
  Date: 2018/12/29
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() +
        ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>新增房间</title>
</head>
<body>
    <h1>新增房间</h1>
    <hr>
    <form action="hotel/hotelinfos" method="post">
        <p>房主姓名 <input type="text" name="ownerName" /></p>
        <p>房主手机 <input type="text" name="ownerPhone" /></p>
        <p>房间实图 <input type="text" name="hotelImage" /></p>
        <p>所在省份 <input type="text" name="hotelProvince" /></p>
        <p>所在城市 <input type="text" name="hotelCity" /></p>
        <p>房间价格 <input type="text" name="hotelPrice" /></p>
        <p>房间详细地址 <input type="text" name="hotelAddress" /></p>
        <p><input type="submit" value="提交"></p>
    </form>
</body>
</html>
