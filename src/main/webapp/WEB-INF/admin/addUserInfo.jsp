<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() +
        ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>添加用户</title>
    <link href="${pageContext.request.contextPath}/css/adduser.css"
          rel="stylesheet">
</head>
<body>
<br><br><br>
<div id="divBody" style="margin: 0 auto">
    <div id="divTitle">
        <span id="spanTitle">添加新用户</span>
    </div>
    <div id="divTable">
        <form  method="post" action="user/userinfos" id="adduserForm">
            <table id="tableForm">
                <tr>
                    <td class="tdText">账号：</td>
                    <td class="tdInput">
                        <input class="inputClass" type="text" name="useraccount" id="useraccount" placeholder="请输入账号">
                    </td>
                    <td class="tdError">
                        <label class="errorClass" id="useraccountError"></label>
                    </td>
                </tr>
                <tr>
                    <td class="tdText">角色：</td>
                    <td>
                        &nbsp;&nbsp;&nbsp;
                        <label class="radio-inline">
                            <input type="radio" name="role"
                                   id="admin" value="0" checked> 管理员
                        </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label class="radio-inline">
                            <input type="radio" name="role"
                                   id="user" value="1"> 普通用户
                        </label>
                    </td>
                </tr>
                <tr>
                    <td class="tdText">用户名：</td>
                    <td class="tdInput">
                        <input class="inputClass" type="text" name="name" id="name" placeholder="请输入用户名">
                    </td>
                    <td class="tdError">
                        <label class="errorClass" id="nameError"></label>
                    </td>
                </tr>
                <tr>
                    <td class="tdText">密码：</td>
                    <td ><input class="inputClass" type="password" name="userpass" id="userpass" placeholder="请输入密码(3~8位)"></td>
                    <td ><label class="errorClass" id="userpassError"></label></td>
                </tr>
                <tr>
                    <td class="tdText">确认密码：</td>
                    <td><input class="inputClass" type="password" name="reuserpass" id="reuserpass" placeholder="请再次输入密码"></td>
                    <td><label class="errorClass" id="reuserpassError"></label></td>
                </tr>
                <tr>
                    <td class="tdText">性别：</td>
                    <td>
                        &nbsp;&nbsp;&nbsp;
                        <label class="radio-inline">
                            <input type="radio" name="sex"
                                   id="male" value="男" checked> 男
                        </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label class="radio-inline">
                            <input type="radio" name="sex"
                                   id="female" value="女"> 女
                        </label>
                    </td>
                </tr>
                <tr>
                    <td class="tdText">年龄：</td>
                    <td class="tdInput">
                        <input class="inputClass" type="text" name="age" id="age" placeholder="请输入年龄">
                    </td>
                    <td class="tdError">
                        <label class="errorClass" id="ageError"></label>
                    </td>
                </tr>
                <tr>
                    <td class="tdText">电话：</td>
                    <td><input class="inputClass" type="text" name="phone" id="phone" placeholder="请输入有效的电话号码"></td>
                    <td><label class="errorClass" id="phoneError"></label></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <div class="buttondiv" style="margin: 0 auto">
                            <input class="buttoninput" type="submit" value="提 交"/>
                            <input class="buttoninput" type="reset" value="重 置"/>
                            <input class="buttoninput" type="button" value="取 消" onclick="history.back()"/>
                        </div>
                    </td>
                    <td></td>
                </tr>
            </table>
        </form>
    </div>
</div>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<script>
    $(function () {
        $(".errorClass").each(function(){
            showError($(this));
        });

        $(".inputClass").focus(function(){//得到焦点隐藏
            var labelId=$(this).attr("id")+"Error";
            $("#"+labelId).text("");
            showError($("#"+labelId));
        });

        $(".inputClass").blur(function(){
            var id=($(this).attr("id"));
            //var funName="valid"+id.substring(0,1).toUpperCase()+id.substring(1)+"()";
            eval("valid"+id.substring(0,1).toUpperCase()+id.substring(1)+"()");
        });

        $("#adduserForm").submit(function(){
            var bool=true;
            if(!validUseraccount()){bool=false;}
            if(!validUserpass()){bool=false;}
            if(!validReuserpass()){bool=false;}
            if(!validPhone()){bool=false;}
            if(!validAge()){bool=false;}
            if(!bool)
                alert("请填写完整有效的信息!");
            return bool;
        });

    });

    //账号校验
    function validUseraccount(){
        var id="useraccount";
        var value=$("#"+id).val();
        if(!value){
            $("#"+id+"Error").text("*账号不能为空");
            showError($("#"+id+"Error"));
            return false;
        }
        if(value.length<3||value.length>10){
            $("#"+id+"Error").text("*账号长度必须在3~10");
            showError($("#"+id+"Error"));
            return false;
        }
        $.ajax({
            url:"user/userExist",
            data:JSON.stringify({useraccount:value}),
            dataType:"json",
            async:true,
            cache:false,
            type:"post",
            contentType:"application/json",
            error:function(){
                alert("name error");
            },
            success:function(result){
                if(result){
                    $("#"+id+"Error").text("*该账号已存在");
                    showError($("#"+id+"Error"));
                    return false;
                    //alert($("#"+id+"Error"));
                }
            }
        })
        return true;
    }

    //用户名校验
    function validName(){
        var id="name";
        var value=$("#"+id).val();
        if(!value){
            $("#"+id+"Error").text("*用户名不能为空");
            showError($("#"+id+"Error"));
            return false;
        }
        if(value.length>8){
            $("#"+id+"Error").text("*用户名最大长度为8");
            showError($("#"+id+"Error"));
            return false;
        }
        return true;
    }


    //密码校验
    function validUserpass(){
        var id="userpass";
        var value=$("#"+id).val();
        if(!value){
            $("#"+id+"Error").text("*登录密码不能为空");
            showError($("#"+id+"Error"));
            return false;
        }
        if(value.length<3||value.length>8){
            $("#"+id+"Error").text("*登录密码长度必须在3~8");
            showError($("#"+id+"Error"));
            return false;
        }
        return true;
    }

    //密码确认校验
    function validReuserpass(){
        var id="reuserpass";
        var value=$("#"+id).val();
        if(!value){
            $("#"+id+"Error").text("*确认密码不能为空");
            showError($("#"+id+"Error"));
            return false;
        }
        if(value.length<3||value.length>8){
            $("#"+id+"Error").text("*确认密码长度必须在3~8");
            showError($("#"+id+"Error"));
            return false;
        }
        if(value!=$("#userpass").val()){
            $("#"+id+"Error").text("*两次密码不同");
            showError($("#"+id+"Error"));
            return false;
        }
        return true;
    }

    //电话号码检验
    function validPhone() {
        var id="phone";
        var value=$("#"+id).val();
        var phoneReg = /^1[3456789][0-9]{9}$/;
        if(!phoneReg.test(value)){
            $("#"+id+"Error").text("*电话号码无效");
            showError($("#"+id+"Error"));
            return false;
        }

    }

    //年龄检验
    function validAge() {
        var id="age";
        var value=$("#"+id).val();
        var ageReg = /^(([0-9]|[1-9][0-9]|1[0-1][0-9])(\.[0-9]+)?|120)$/;;
        if(!ageReg.test(value)){
            $("#"+id+"Error").text("*请输入有效的年龄");
            showError($("#"+id+"Error"));
            return false;
        }
    }

    //展示错误的信息
    function showError(ele) {//检测到有毛病，有文字,就显示，，，
        var text = ele.text();
        if (!text) {
            ele.css("display", "none");
        } else {
            ele.css("display", "");
        }
    }

</script>
</body>
</html>
