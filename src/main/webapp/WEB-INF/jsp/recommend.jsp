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
    <link href="${pageContext.request.contextPath}/css/recommend.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/search.css" type="text/css">
</head>
<body>
<%@ include file="ignore/search.jsp" %>
<div class="recommend">
    <div style="text-align: center">
        <div class="recommend_top">今日推荐</div>
    </div>

    <div class="recommend_main">
        <c:forEach items="${hotelSixInfos}" var="hotelSixInfo" begin="0" end="0">
            <div class="hotel_one">
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
            <div class="hotel_two">
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
            <div class="hotel_three">

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
            <div class="hotel_four">
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
            <div class="hotel_five">
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
        <div class="hotel_six">
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
</html>