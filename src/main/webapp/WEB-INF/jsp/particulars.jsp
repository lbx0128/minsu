<%--
  Created by IntelliJ IDEA.
  User: lbx0128
  Date: 2019/1/2
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-Hans">

<head>
    <meta charset="utf-8">
    <title>详情</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/particulars.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/comment.css">
</head>

<body>
<%@ include file="navbar.jsp" %>
<div class="hotel-info">
        <div class="hotel-info-head">
            <h1 class="hotel-name">${hotelInfos.hotelCity}</h1>
            <hr>
            <div class="hotel-info-body">
                <div class="item">
                    <span>地址：</span>
                    <span>${hotelInfos.hotelAddress}</span>
                </div>
                <div class="item">
                    <span>电话：</span>
                    <span>${hotelInfos.ownerPhone}</span>
                </div>
                <div class="item">
                    <span>房东</span>
                    <span>${hotelInfos.ownerName}</span>
                </div>
            </div>
            <hr style="display:block">
        </div>
        <div class="hotel-img">
            <img class="hotel-img" src="${hotelInfos.hotelImage}">
        </div>
</div>
<%@ include file="comment.jsp" %>
</body>

</html>
