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
    <title>编辑房间</title>
</head>
<body>
    <h1>编辑房间</h1>
    <hr>
    <form action="hotel/hotelinfos/edit" method="post">
        <input type="hidden" name="hotelId" value="${hotelInfo.hotelId}"/>
        <p>房主姓名 <input type="text" name="ownerName"
                       value="${hotelInfo.ownerName}"/></p>
        <p>房主手机 <input type="text" name="ownerPhone"
                       value="${hotelInfo.ownerPhone}"/></p>
        <p>房间实图 <input type="text" name="hotelImage"
                       value="${hotelInfo.hotelImage}"/></p>
        <p>所在省份 <input type="text" name="hotelProvince"
                       value="${hotelInfo.hotelProvince}" /></p>
        <p>所在城市 <input type="text" name="hotelCity"
                       value="${hotelInfo.hotelCity}"/></p>
        <p>房间价格 <input type="text" name="hotelPrice"
                        value="${hotelInfo.hotelPrice}"/></p>
        <p>房间详细地址 <input type="text" name="hotelAddress"
                        value="${hotelInfo.hotelAddress}"/></p>
        <p>
            <input type="submit" value="提交"/>&nbsp;&nbsp;&nbsp;
            <input type="button" value="取消" onclick="history.back()"/>
        </p>
    </form>
</body>
</html>
