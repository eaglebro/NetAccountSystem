<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link type="text/css" rel="stylesheet" media="all" href="../styles/global.css"/>
    <link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css"/>
    <script language="JavaScript" type="text/javascript"
            src="<%=request.getContextPath()%>/js/jquery-3.2.1.js"></script>
    <script language="javascript" type="text/javascript">
        //保存成功的提示消息
        function showResult(msg) {
            $("#save_result_info").html(msg);
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
        function save() {
            var d = JSON.stringify($("form").serializeObject());
            console.log(d);
                $.ajax({
                        type: "post",
                        url: "/ssm/role/modifyPost",
                        // 前端向后台发送json数据时要声明
                        contentType: "application/json",
                        data: d,
                        success: function (data) {
                            if (data.success=="1"){
                                showResult("保存成功")
                            } else {
                                showResult(data.errorMsg)
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
        <li><a href="<%=request.getContextPath()%>/role/main" class="role_on"></a></li>
        <li><a href="admin/admin_list.html" class="admin_off"></a></li>
        <li><a href="<%=request.getContextPath()%>/cost/list.do" class="fee_off"></a></li>
        <li><a href="<%=request.getContextPath()%>/account/main" class="account_off"></a></li>
        <li><a href="<%=request.getContextPath()%>/service/main" class="service_off"></a></li>
        <li><a href="bill/bill_list.html" class="bill_off"></a></li>
        <li><a href="<%=request.getContextPath()%>/report/main" class="report_off"></a></li>
        <li><a href="user/user_info.html" class="information_off"></a></li>
        <li><a href="user/user_modi_pwd.html" class="password_off"></a></li>
    </ul>
</div>
<!--导航区域结束-->
<!--主要区域开始-->
<div id="main">
    <!--保存操作后的提示信息：成功或者失败-->
    <div id="save_result_info" class="save_success">保存成功！</div>
    <form action="" method="" class="main_form">
        <input type="hidden" name="role_id" value="${role_id}">
        <div class="text_info clearfix"><span>角色名称：</span></div>
        <div class="input_info">
            <input type="text" class="width200" name="name" value="${roleVO.name}"/>
            <span class="required">*</span>
            <div class="validate_msg_medium error_msg">不能为空，且为20长度的字母、数字和汉字的组合</div>
        </div>
        <div class="text_info clearfix"><span>设置权限：</span></div>
        <div class="input_info_high">
            <div class="input_info_scroll">
                <ul>
                    <c:forEach items="${list}" var="moduleInfo">
                        <c:if test="${moduleInfo.checked}">
                            <li><input type="checkbox"
                                       name="module_id"
                                       id="${moduleInfo.module_id}"
                                       checked="checked"
                                       value="${moduleInfo.module_id}"/>${moduleInfo.name}
                            </li>
                        </c:if>
                        <c:if test="${!moduleInfo.checked}">
                            <li><input type="checkbox"
                                       name="module_id"
                                       id="${moduleInfo.module_id}"
                                       value="${moduleInfo.module_id}"/>${moduleInfo.name}
                            </li>
                        </c:if>
                    </c:forEach>
                </ul>
                <input type="hidden" name="module_id" value="0">
            </div>
            <span class="required">*</span>
            <div class="validate_msg_tiny">至少选择一个权限</div>
        </div>
        <div class="button_info clearfix">
            <input type="button" value="保存" class="btn_save" onclick="save();"/>
            <input type="button" value="取消" class="btn_save" onclick="window.history.go(-1)"/>
        </div>
    </form>
</div>
<!--主要区域结束-->
<div id="footer">
    <span>[源自北美的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</span>
    <br/>
    <span>版权所有(C)云科技有限公司 </span>
</div>
</body>
</html>
