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
    <script type="application/javascript">
        var User = function () {

            this.init = function () {

                //模拟上传excel
                $("#uploadEventBtn").unbind("click").bind("click", function () {
                    $("#uploadEventFile").click();
                });
                $("#uploadEventFile").bind("change", function () {
                    $("#uploadEventPath").attr("value", $("#uploadEventFile").val());
                });

            };
            //点击上传按钮
            this.uploadBtn = function () {
                var uploadEventFile = $("#uploadEventFile").val();
                if (uploadEventFile == '') {
                    alert("请选择excel,再上传");
                } else if (uploadEventFile.lastIndexOf(".xls") < 0) {//可判断以.xls和.xlsx结尾的excel
                    alert("只能上传Excel文件");
                } else {
                    var url = '<%=request.getContextPath()%>/report/upload';
                    var formData = new FormData($('form')[0]);
                    user.sendAjaxRequest(url, 'POST', formData);
                }
            };

            this.sendAjaxRequest = function (url, type, data) {
                $.ajax({
                    url: url,
                    type: type,
                    data: data,
                    success: function (result) {
                        alert(result);
                    },
                    error: function () {
                        alert("excel上传失败");
                    },
                    cache: false,
                    contentType: false,
                    processData: false
                });
            };
        }
        var user;
        $(function () {
            user = new User();
            user.init();
        });
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
<div id="index_navi">
    <ul id="menu">
        <li><a href="<%=request.getContextPath()%>/main.do" class="index_on"></a></li>
        <li><a href="role/role_list.html" class="role_off"></a></li>
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
    <form enctype="multipart/form-data" id="batchUpload" action="<%=request.getContextPath()%>/report/upload" method="post" class="form-horizontal">
        <button class="btn btn-success btn-xs" id="uploadEventBtn" style="height:26px;" type="button">选择文件</button>
        <input type="file" name="file" style="width:0px;height:0px;" id="uploadEventFile">
        <input id="uploadEventPath" disabled="disabled" type="text" placeholder="请选择excel表"
               style="border: 1px solid #e6e6e6; height: 26px;width: 200px;">
    </form>
    <button type="button" class="btn btn-success btn-sm" onclick="user.uploadBtn()">上传</button>
    <button type="button" onclick="window.location='<%=request.getContextPath()%>/report/download'">下载</button>
</div>
<!--主要区域结束-->
<div id="footer">
    <span>[源自北美的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</span>
    <br/>
    <span>版权所有(C)云科技有限公司 </span>
</div>
</body>
</html>
