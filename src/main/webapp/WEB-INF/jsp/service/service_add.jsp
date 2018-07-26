<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="text/css" rel="stylesheet" media="all" href="../styles/global.css"/>
    <link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css"/>
    <script language="JavaScript" type="text/javascript"
            src="<%=request.getContextPath()%>/js/jquery-3.2.1.js"></script>
    <title>Title</title>
    <script language="javascript" type="text/javascript">
        //保存成功的提示信息
        function showResult() {
            showResultDiv(true);
            window.setTimeout("showResultDiv(false);", 3000);
        }
        function showResultDiv(flag) {
            var divResult = document.getElementById("save_result_info");
            if (flag)
                divResult.style.display = "block";
            else
                divResult.style.display = "none";
        }

        $.fn.serializeObject = function () {
            var o = {};
            var a = this.serializeArray();
            $.each(a, function () {
                if (o[this.name]) {
                    if (!o[this.name].push) {
                        o[this.name] = [o[this.name]];
                    }
                    o[this.name].push(this.value || '');
                } else {
                    o[this.name] = this.value || '';
                }
            });
            return o;
        };
        // 提交按钮
        function submit() {
            var d = JSON.stringify($(".main_form").serializeObject());
            console.log(d);
            $.ajax({
                type: "post",
                url: "/ssm/service/addPost",
                // 后台向前端发数据 声明
//                dataType: "json",
                // 前端向后台发送json数据时要声明
                contentType: "application/json",
                data: d,
                success: function (data) {
                    if (data.success == "1") {
                        $("#save_result_info").html("保存成功");
                        showResult();
                        load("/ssm/service/main");
//                        window.setTimeout(window.location.href = "/ssm/service/main", 3000)
                    }
                },
                error: function () {
                    alert("错误");
                }
            })
        }
        // 3秒跳转页面
        var secs = 2; //倒计时的秒数
        var URL ;
        function load(url){
            URL = url;
            for(var i=secs;i>=0;i--)
            {
                window.setTimeout('doUpdate(' + i + ')', (secs-i) * 1000);
            }
        }
        function doUpdate(num)
        {
//            document.getElementById('ShowDiv').innerHTML = '将在'+num+'秒后自动跳转到主页' ;
            if(num == 0) { window.location = URL; }
        }
        //自动查询账务账号
        function searchAccounts() {
            var idcard_no = $("#idcard_no").val();
            $.ajax({
                type: "post",
                url: "/ssm/service/identify",
                data: {
                    "idcard_no": idcard_no
                },
                success: function (data) {
                    console.log(data);
                    if (data.errorMsg != '') {
                        document.getElementById("save_result_info").innerHTML = data.errorMsg;
                        showResult();
                    } else {
                        var login_name = data.login_name;
                        var account_id = data.account_id;
                        $("#login_name").val(login_name);
                        $("#account_id").val(account_id);
                    }
                },
                error: function () {
                    alert("错误");
                }
            })
        }
    </script>
</head>
<body>
<!--Logo区域开始-->
<div id="header">
    <img src="../images/logo.png" alt="logo" class="left"/>
    <a href="#">[退出]</a>
</div>
<!--Logo区域结束-->
<!--导航区域开始-->
<div id="navi">
    <ul id="menu">
        <li><a href="<%=request.getContextPath()%>/main.do" class="index_off"></a></li>
        <li><a href="../role/role_list.jsp" class="role_off"></a></li>
        <li><a href="../admin/admin_list.jsp" class="admin_off"></a></li>
        <li><a href="<%=request.getContextPath()%>/cost/list.do" class="fee_off"></a></li>
        <li><a href="<%=request.getContextPath()%>/account/main" class="account_off"></a></li>
        <li><a href="<%=request.getContextPath()%>/service/main" class="service_on"></a></li>
        <li><a href="../bill/bill_list.html" class="bill_off"></a></li>
        <li><a href="<%=request.getContextPath()%>/report/main" class="report_off"></a></li>
        <li><a href="../user/user_info.html" class="information_off"></a></li>
        <li><a href="../user/user_modi_pwd.html" class="password_off"></a></li>
    </ul>
</div>
<!--导航区域结束-->
<!--主要区域开始-->
<div id="main">
    <!--保存操作的提示信息-->
    <div id="save_result_info" class="save_fail">保存失败！192.168.0.23服务器上已经开通过 OS 账号 “mary”。</div>
    <form action="#" method="post" class="main_form">
        <!--内容项-->
        <div class="text_info clearfix"><span>身份证：</span></div>
        <div class="input_info">
            <input type="text" value="" class="width180" id="idcard_no" name="idcard_no"/>
            <input type="button" value="查询账务账号" class="btn_search_large" onclick="searchAccounts();"/>
            <span class="required">*</span>
            <div class="validate_msg_short">没有此身份证号，请重新录入。</div>
        </div>
        <div class="text_info clearfix"><span>账务账号：</span></div>
        <div class="input_info">
            <input type="text" value="" id="login_name" readonly="readonly"/>
            <span class="required">*</span>
            <div class="validate_msg_long">没有此账务账号，请重新录入。</div>
        </div>
        <div class="text_info clearfix"><span>资费类型：</span></div>
        <div class="input_info">
            <select name="cost_id">
                <c:forEach items="${list}" var="cost">
                    <option value="${cost.cost_id}">${cost.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="text_info clearfix"><span>服务器 IP：</span></div>
        <div class="input_info">
            <%--<input type="text" name="unix_host" value="192.168.0.23"/>--%>
            <select name="unix_host">
                <c:forEach items="${host}" var="host">
                    <option value="${host.host_id}">${host.host_id}</option>
                </c:forEach>
            </select>
            <span class="required">*</span>
            <div class="validate_msg_long">15 长度，符合IP的地址规范</div>
        </div>
        <div class="text_info clearfix"><span>登录 OS 账号：</span></div>
        <div class="input_info">
            <input type="text" value="" name="os_username"/>
            <span class="required">*</span>
            <div class="validate_msg_long">8长度以内的字母、数字和下划线的组合</div>
        </div>
        <div class="text_info clearfix"><span>密码：</span></div>
        <div class="input_info">
            <input type="password" id="login_passwd" name="login_passwd"/>
            <span class="required">*</span>
            <div class="validate_msg_long">30长度以内的字母、数字和下划线的组合</div>
        </div>
        <div class="text_info clearfix"><span>重复密码：</span></div>
        <div class="input_info">
            <input type="password" id="re_login_passwd"/>
            <span class="required">*</span>
            <div class="validate_msg_long">两次密码必须相同</div>
        </div>
        <!--操作按钮-->

        <input type="hidden" id="account_id" value="" name="account_id">
    </form>
    <div class="button_info clearfix">
        <input type="button" value="保存" class="btn_save" onclick="submit();"/>
        <input type="button" value="取消" class="btn_save"/>
    </div>
</div>
<!--主要区域结束-->
<div id="footer">
    <span>[源自北美的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</span>
    <br/>
    <span>版权所有(C)云科技有限公司 </span>
</div>
</body>
</html>
