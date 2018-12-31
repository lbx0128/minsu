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
    <base href="<%=basePath %>">
    <title>旅馆列表</title>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap/bootstarp3.3.7.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/url.css"
          rel="stylesheet">
</head>

<h1>房间管理</h1>
<hr>
<body>

    <%-- 需要一个搜索框, 只能搜索地区 --%>
    <p>
        <select id="select-search" class="form-control">
            <option>选择类型</option>
            <option value="ownername">房主姓名</option>
            <option value="ownerphone">房主手机</option>
            <option value="hoteladdress">地区</option>
        </select>
        <input type="text" id="text-search">
        <button type="button" class="btn btn-info" id="button-search">搜索
        </button>
    </p>


    <%-- 显示信息 --%>
    <table class="table table-hover" width="80%">
        <tr>
            <th>房东姓名</th>
            <th>房东手机</th>
            <th>所在省份</th>
            <th>所在城市</th>
            <th>价格</th>
            <th>详细地址</th>
            <th>收藏数</th>
            <th>操作</th>
        </tr>
    <c:forEach items="${hotelInfos}" var="hotelinfo">
        <tr>
            <td>${hotelinfo.ownerName}</td>
            <td>${hotelinfo.ownerPhone}</td>
            <td>${hotelinfo.hotelProvince}</td>
            <td>${hotelinfo.hotelCity}</td>
            <td>${hotelinfo.hotelPrice}</td>
            <td>${hotelinfo.hotelAddress}</td>
            <td>${hotelinfo.favorNum}</td>
            <td>
                <a href="hotel/hotelinfos/edit/${hotelinfo.hotelId}">
                    <button type="button" class="btn btn-info">编辑</button>
                </a>

                <a href="hotel/hotelinfos/del/${hotelinfo.hotelId}">
                    <button type="button" class="btn btn-danger">删除</button>
                </a>

            </td>
        </tr>

    </c:forEach>
    </table>
    共${rowNumber}条数据 当前第${pageIndex} 页 共${pageNumber}页

    <nav aria-label="...">
        <ul class="pager">
            <li>
                <c:choose>
                    <c:when test="${pageIndex <= 1}">
                        <a href="hotel/hotelinfos/${pageIndex}">上一页</a>
                    </c:when>
                    <c:otherwise>
                        <a href="hotel/hotelinfos/${pageIndex-1}">上一页</a>
                    </c:otherwise>
                </c:choose>
            </li>
            <li>
                <c:choose>
                    <c:when test="${pageIndex >= pageNumber}">
                        <a href="hotel/hotelinfos/${pageIndex}">下一页</a>
                    </c:when>
                    <c:otherwise>
                        <a href="hotel/hotelinfos/${pageIndex+1}">下一页</a>
                    </c:otherwise>
                </c:choose>
            </li>
        </ul>
    </nav>

    <%--<c:if test="${pageIndex > 1}">--%>
        <%--<a href="hotel/hotelinfos/${pageIndex-1}">上一页</a>--%>
    <%--</c:if>--%>
    <%--<c:if test="${pageIndex < pageNumber}">--%>
        <%--<a href="hotel/hotelinfos/${pageIndex+1}">下一页</a>--%>
    <%--</c:if>--%>
    <input type="text" id="text-index" size="1"/>页
    <button id="button-jump-index" class="btn btn-primary">跳转</button>

    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath}/js/jquery/jquery1.12.4.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap/bootstrap3.3.7.js"></script>
    <script>
        $(document).ready(function () {
            // 跳转到指定页面
            $("#button-jump-index").click(function () {
                // 获取输入的跳转页
                var index =
                    parseInt($("#text-index").val());
                console.log(index);
                if (index <= ${pageNumber} && index >= 1)
                    window.location.href = "hotel/hotelinfos/" + index;
            });

            // 搜索指定类型的内容
            $("#button-search").click(function () {
                // 获取搜索的类型
                var type = $("#select-search").val();
                console.log(type);
                // 获取输入的关键字
                var keyword = $("#text-search").val();
                console.log(keyword);
                window.location.href = "hotel/hotelinfos/search/" + type +
                    "/" + keyword;
            });
        });
    </script>


</body>

</html>
