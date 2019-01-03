<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() +
        ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>用户信息编辑</title>
</head>
<body>
<h1>用户信息编辑</h1>
<hr>
    <form action="/uer/userinfos/edit" method="post">
        <input type="hidden" name="useraccount" value="${userInfo.useraccount}"/>
        <p>姓名 <input type="text" name="name"
                       value="${userInfo.name}"/></p>
        <p>性别 <input type="text" name="sex"
                       value="${userInfo.sex}"/></p>
        <p>年龄 <input type="text" name="age"
                       value="${userInfo.age}" /></p>
        <p>手机号 <input type="text" name="phone"
                      value="${userInfo.phone}" /></p>
        <p>
            <input type="submit" value="提交"/>&nbsp;&nbsp;&nbsp;
            <input type="button" value="取消" onclick="history.back()"/>
        </p>
    </form>
</body>
</html>
