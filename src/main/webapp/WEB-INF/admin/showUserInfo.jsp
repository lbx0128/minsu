<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() +
        ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>用户列表</title>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap/bootstarp3.3.7.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/url.css"
          rel="stylesheet">
</head>

<body>
    <h1>用户管理</h1>
    <hr>
    <p>
        <select id="select-search" class="form-control">
            <option>选择类型</option>
            <option value="useraccount">用户账号</option>
            <option value="name">用户姓名</option>
        </select>
        <input type="text" id="text-search">
        <button type="button" class="btn btn-info" id="button-search">搜索
        </button>
    </p>

    <%-- 显示信息 --%>
    <table class="table table-hover" width="80%">
        <tr>
            <th>用户账号</th>
            <th>用户身份</th>
            <th>用户名</th>
            <th>性别</th>
            <th>年龄</th>
            <th>电话</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${userInfos}" var="userinfo">
            <tr>
                <td>${userinfo.useraccount}</td>
                <td>
                    <c:if test="${userinfo.role==0}">管理员</c:if>
                    <c:if test="${userinfo.role==1}">普通用户</c:if>
                </td>
                <td>${userinfo.name}</td>
                <td>${userinfo.sex}</td>
                <td>${userinfo.age}</td>
                <td>${userinfo.phone}</td>
                <td>
                    <a href="user/userinfos/edit/${userinfo.useraccount}">
                        <button type="button" class="btn btn-info">编辑</button>
                    </a>

                    <a href="user/userinfos/del/${userinfo.useraccount}">
                        <button type="button" class="btn btn-danger">删除</button>
                    </a>

                </td>
            </tr>

        </c:forEach>
    </table>

    <p>共${rowNumber}条数据 当前第${pageIndex} 页 共${pageNumber}页</p>

    <nav aria-label="...">
        <ul class="pager">
            <li>
                <c:choose>
                    <c:when test="${pageIndex <= 1}">
                        <a href="user/userinfos/${pageIndex}">上一页</a>
                    </c:when>
                    <c:otherwise>
                        <a href="user/userinfos/${pageIndex-1}">上一页</a>
                    </c:otherwise>
                </c:choose>
            </li>
            <li>
                <c:choose>
                    <c:when test="${pageIndex >= pageNumber}">
                        <a href="user/userinfos/${pageIndex}">下一页</a>
                    </c:when>
                    <c:otherwise>
                        <a href="user/userinfos/${pageIndex+1}">下一页</a>
                    </c:otherwise>
                </c:choose>
            </li>
        </ul>
    </nav>

    <p>
        <input type="text" id="text-index" size="1"/>页
        <button id="button-jump-index" class="btn btn-primary">跳转</button>
    </p>


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
                    window.location.href = "user/userinfos/" + index;
            });

            // 搜索指定类型的内容
            $("#button-search").click(function () {
                // 获取搜索的类型
                var type = $("#select-search").val();
                console.log(type);
                // 获取输入的关键字
                var keyword = $("#text-search").val();
                console.log(keyword);
                window.location.href = "user/userinfos/search/" + type +
                    "/" + keyword;
            });
        });
    </script>
</body>
</html>
