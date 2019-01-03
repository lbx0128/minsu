<%--
  Created by IntelliJ IDEA.
  User: hero
  Date: 2018/12/29
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() +
        ":" + request.getServerPort() + request.getContextPath() + "/";
%>

<html>
<head>
    <base href="<%=basePath %>">
    <title></title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/hotelinfo.css" rel="stylesheet">
</head>

<body>
    <%@include file="../include/navigation.jsp"%>

    <div class="content">
        <h1>房源管理</h1>
        <hr>
        <%-- 需要一个搜索框, 只能搜索地区 --%>
        <select id="select-search" class="form-control">
            <option>选择类型</option>
            <c:forEach items="${searchType}" var="sety">
                <option value="${sety.key}">${sety.value}</option>
            </c:forEach>
        </select>
        <input type="text" id="text-search" class="form-control"
               placeholder="keywords" required="required">
        <button type="button" class="btn btn-info" id="button-search">搜索
        </button>
        <a href="hotel/hotelinfos">
            <button type="button" class="btn btn-info button-add-hotelinfo">新增
            </button>
        </a>

        <%-- 显示信息 --%>
        <table class="table table-hover">
            <tr>
                <th>房东姓名</th>
                <th>房东手机</th>
                <th>所在省份</th>
                <th>所在城市</th>
                <th>价格</th>
                <th>图片预览</th>
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

                <td>
                    <button type="button" data-toggle="modal" data-target="#myModal${hotelinfo.hotelId}">Launch</button>
                    <div class="modal fade" tabindex="-1" role="dialog"
                         aria-labelledby="gridSystemModalLabel" id="myModal${hotelinfo.hotelId}">
                        <div class="modal-dialog" role="img">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <%--<h4 class="modal-title" id="gridSystemModalLabel">Modal title</h4>--%>
                                </div>
                                <div class="modal-body">
                                    <img src="${hotelinfo.hotelImage}" />
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
                </td>

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
                <c:choose>
                    <c:when test="${pageIndex <= 1}">
                        <li class="disabled">
                            <a href="hotel/hotelinfos/${pageIndex}">上一页</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li>
                            <a href="hotel/hotelinfos/${pageIndex-1}">上一页</a>
                        </li>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${pageIndex >= pageNumber}">
                        <li class="disabled">
                            <a href="hotel/hotelinfos/${pageIndex}">下一页</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li>
                            <a href="hotel/hotelinfos/${pageIndex+1}">下一页</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </nav>

        <button id="button-jump-index" class="btn btn-primary">跳转</button><input type="text" id="text-index" class="form-control"/>页
    </div>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <%--页面相关点击事件--%>
    <%--<script src="${pageContext.request.contextPath}/js/hotelinfo.js"></script>--%>
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
                    "/" + keyword + "/" + 1;
            });
        });
    </script>


</body>

</html>
