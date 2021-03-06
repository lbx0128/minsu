<%--
  Created by IntelliJ IDEA.
  User: lbx0128
  Date: 2018/12/29
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>今日推荐</title>
    <title></title>
    <link href="${pageContext.request.contextPath}/css/carousel.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/css/recommend.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/search.css" type="text/css">
</head>
<body>
<%@ include file="navbar.jsp" %>
<%@ include file="carousel.jsp" %>
<%@ include file="search.jsp" %>
<div class="recommend">
    <div style="text-align: center">
        <div class="recommend_top">今日推荐</div>
    </div>

    <div class="recommend_main">
        <c:forEach items="${hotelSixInfos}" var="hotelSixInfo" begin="0" end="0">
            <div class="hotel_one" onclick="window.open('../user/particulars/'+${hotelSixInfo.hotelId})">
                <div class="hotel">
                    <div class="recommend_img">
                        <img class="recommend_img" src=${hotelSixInfo.hotelImage} width=150 length=150>
                    </div>
                    <div class="recommend_describe">
                        <span class="city_span">地点：${hotelSixInfo.hotelCity}</span>
                        <br>
                        <span>价格：${hotelSixInfo.hotelPrice}/天</span>
                        <br>
                        <span>收藏数：${hotelSixInfo.favorNum}</span>
                    </div>
                </div>
            </div>
        </c:forEach>
        <c:forEach items="${hotelSixInfos}" var="hotelSixInfo" begin="1" end="1">
            <div class="hotel_two" onclick="window.open('../user/particulars/'+${hotelSixInfo.hotelId})">
                <div class="hotel">
                    <div class="recommend_img">
                        <img class="recommend_img" src=${hotelSixInfo.hotelImage} width=150 length=150>
                    </div>
                    <div class="recommend_describe">
                        <span class="city_span">地点：${hotelSixInfo.hotelCity}</span>
                        <br>
                        <span>价格：${hotelSixInfo.hotelPrice}/天</span>
                        <br>
                        <span>收藏数：${hotelSixInfo.favorNum}</span>
                    </div>
                </div>
            </div>
        </c:forEach>
        <c:forEach items="${hotelSixInfos}" var="hotelSixInfo" begin="2" end="2">
            <div class="hotel_three" onclick="window.open('../user/particulars/'+${hotelSixInfo.hotelId})">

                <div class="hotel">
                    <div class="recommend_img">
                        <img class="recommend_img" src=${hotelSixInfo.hotelImage} width=150 length=150>
                    </div>
                    <div class="recommend_describe">
                        <span class="city_span">地点：${hotelSixInfo.hotelCity}</span>
                        <br>
                        <span>价格：${hotelSixInfo.hotelPrice}/天</span>
                        <br>
                        <span>收藏数：${hotelSixInfo.favorNum}</span>
                    </div>
                </div>
            </div>
        </c:forEach>
        <c:forEach items="${hotelSixInfos}" var="hotelSixInfo" begin="3" end="3">
            <div class="hotel_four" onclick="window.open('../user/particulars/'+${hotelSixInfo.hotelId})">
                <div class="hotel">
                    <div class="recommend_img">
                        <img class="recommend_img" src=${hotelSixInfo.hotelImage} width=150 length=150>
                    </div>
                    <div class="recommend_describe">
                        <span class="city_span">地点：${hotelSixInfo.hotelCity}</span>
                        <br>
                        <span>价格：${hotelSixInfo.hotelPrice}/天</span>
                        <br>
                        <span>收藏数：${hotelSixInfo.favorNum}</span>
                    </div>
                </div>
            </div>
        </c:forEach>
        <c:forEach items="${hotelSixInfos}" var="hotelSixInfo" begin="4" end="4">
            <div class="hotel_five" onclick="window.open('../user/particulars/'+${hotelSixInfo.hotelId})">
                <div class="hotel">
                    <div class="recommend_img">
                        <img class="recommend_img" src=${hotelSixInfo.hotelImage} width=150 length=150>
                    </div>
                    <div class="recommend_describe">
                        <span class="city_span">地点：${hotelSixInfo.hotelCity}</span>
                        <br>
                        <span>价格：${hotelSixInfo.hotelPrice}/天</span>
                        <br>
                        <span>收藏数：${hotelSixInfo.favorNum}</span>
                    </div>
                </div>
            </div>
        </c:forEach>
        <c:forEach items="${hotelSixInfos}" var="hotelSixInfo" begin="5" end="5">
        <div class="hotel_six" onclick="window.open('../user/particulars/'+${hotelSixInfo.hotelId})">
            <div class="hotel">
                <div class="recommend_img">
                    <img class="recommend_img" src=${hotelSixInfo.hotelImage} width=150 length=150>
                </div>
                <div class="recommend_describe">
                    <span class="city_span">地点：${hotelSixInfo.hotelCity}</span>
                    <br>
                    <span>价格：${hotelSixInfo.hotelPrice}/天</span>
                    <br>
                    <span>收藏数：${hotelSixInfo.favorNum}</span>
                </div>
            </div>
        </div>
    </div>
    </c:forEach>
</div>
</body>
<script src="${pageContext.request.contextPath}/js/search.js"></script>
</html>