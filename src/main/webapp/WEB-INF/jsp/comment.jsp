<%--
  Created by IntelliJ IDEA.
  User: lbx0128
  Date: 2019/1/3
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@page pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="comment-info">
    <span>用户评论：</span>
    <c:forEach items="${commentInfos}" var="commentInfos">
        <div class="comment-info-head">
            <h4 class="comment-name">${commentInfos.useraccount}</h4>
            <div class="comment-info-body">
                <div class="item">
                    <span>${commentInfos.comment}</span>
                </div>
            </div>
            <hr style="display:block">
        </div>
    </c:forEach>
</div>