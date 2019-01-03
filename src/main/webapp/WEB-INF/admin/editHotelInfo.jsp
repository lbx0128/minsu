<%--
  Created by IntelliJ IDEA.
  User: hero
  Date: 2018/12/29
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() +
        ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>编辑房间</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/register.css"
          rel="stylesheet">
</head>
<body>
    <%@include file="../include/navigation.jsp"%>
    <div class="content">
        <h1>修改信息</h1>
        <hr>

        <form class="form-horizontal" action="hotel/hotelinfos/edit" method="post" enctype="multipart/form-data">
            <input type="text" value="${hotelInfo.hotelId}" hidden="hidden" name="hotelId"/>
            <div class="form-group">
                <label for="ownerName" class="col-sm-2 control-label">房主姓名</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="ownerName" name="ownerName"
                           value="${hotelInfo.ownerName}" required>
                </div>
            </div>
            <div class="form-group">
                <label for="ownerPhone" class="col-sm-2 control-label">房主手机</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="ownerPhone" name="ownerPhone"
                           value="${hotelInfo.ownerPhone}" required>
                </div>
            </div>

            <%--TODO 联动选择地区--%>
            <div class="form-group">
                <label for="hotelProvince" class="col-sm-2 control-label">所在省份</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="hotelProvince"
                           value="${hotelInfo.hotelProvince}" name="hotelProvince" required>
                </div>
            </div>
            <div class="form-group">
                <label for="hotelCity" class="col-sm-2 control-label">所在城市</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="hotelCity"
                           name="hotelCity" value="${hotelInfo.hotelCity}" required>
                </div>
            </div>

            <div class="form-group">
                <label for="hotelPrice" class="col-sm-2 control-label">房间价格</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="hotelPrice"
                           name="hotelPrice"
                           placeholder="房间价格"  value="${hotelInfo.hotelPrice}" required>
                </div>
            </div>

            <div class="form-group">
                <label for="hotelAddress" class="col-sm-2 control-label">房间详细地址</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="hotelAddress"
                           name="hotelAddress"
                           placeholder="房间详细地址" value="${hotelInfo.hotelAddress}" required>
                </div>
            </div>
            <%--TODO 上传图片--%>
            <div class="form-group">
                <label for="hotelImageName" class="col-sm-2 control-label">房间实图</label>
                <div class="col-sm-10">
                    <input type="file" class="form-control" id="hotelImageName" accept="image/*"
                           value="${hotelInfo.hotelImage}" name="hotelImageName" onchange="changeFile(this)">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <img src="${hotelInfo.hotelImage}" id="img" alt="图片预览" style="width:150px; height: 100px" />
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-1">
                    <button type="submit" class="btn btn-info">提交</button>
                </div>
                <div class="col-sm-9">
                    <button class="btn btn-info" onclick="history.back()">取消</button>
                </div>
            </div>
        </form>
    </div>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

    <script>
        function changeFile(obj) {
            var reader = new FileReader();
            reader.readAsDataURL(obj.files[0]);
            reader.onload = function (ev) {
                var img = document.getElementById("img");
                img.src = ev.target.result;
            }
        }
    </script>

</body>
</html>
