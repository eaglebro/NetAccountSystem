﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script language="JavaScript" type="text/javascript"
            src="<%=request.getContextPath()%>/js/jquery-3.2.1.js"></script>
    <link type="text/css" rel="stylesheet" media="all" href="../styles/global.css"/>
    <link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css"/>
    <script language="javascript" type="text/javascript">
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
        //保存结果的提示
        function showResult() {
            var cost = JSON.stringify($("form").serializeObject());
            console.log(cost);
            $.post("../cost/add.do", {
                        "cost": cost
                    }, function (data) {
                        if (data == "") {
                            alert("添加成功");
                            location.href = "../cost/list.do";
                        } else {
                            alert(data);
                        }
                    }
            )
            ;
        }
        function showResultDiv(flag) {
            var divResult = document.getElementById("save_result_info");
            if (flag)
                divResult.style.display = "block";
            else
                divResult.style.display = "none";
        }

        //切换资费类型
        function feeTypeChange(type) {
            var inputArray = document.getElementById("main").getElementsByTagName("input");
            if (type == 1) {
                inputArray[4].readOnly = true;
                inputArray[4].value = "0";
                inputArray[4].className += " readonly";
                inputArray[5].readOnly = false;
                inputArray[5].className = "width100";
                inputArray[6].readOnly = true;
                inputArray[6].className += " readonly";
                inputArray[6].value = "0";
            }
            else if (type == 2) {
                inputArray[4].readOnly = false;
                inputArray[4].className = "width100";
                inputArray[5].readOnly = false;
                inputArray[5].className = "width100";
                inputArray[6].readOnly = false;
                inputArray[6].className = "width100";
            }
            else if (type == 3) {
                inputArray[4].readOnly = true;
                inputArray[4].value = "0";
                inputArray[4].className += " readonly";
                inputArray[5].readOnly = true;
                inputArray[5].value = "0";
                inputArray[5].className += " readonly";
                inputArray[6].readOnly = false;
                inputArray[6].className = "width100";
            }
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
        <li><a href="<%=request.getContextPath()%>/cost/list.do" class="fee_on"></a></li>
        <li><a href="<%=request.getContextPath()%>/account/main" class="account_off"></a></li>
        <li><a href="<%=request.getContextPath()%>/service/main" class="service_off"></a></li>
        <li><a href="../bill/bill_list.html" class="bill_off"></a></li>
        <li><a href="<%=request.getContextPath()%>/report/main" class="report_off"></a></li>
        <li><a href="../user/user_info.html" class="information_off"></a></li>
        <li><a href="../user/user_modi_pwd.html" class="password_off"></a></li>
    </ul>
</div>
<!--导航区域结束-->
<!--主要区域开始-->
<div id="main">
    <div id="save_result_info" class="save_fail">保存失败，资费名称重复！</div>
    <form action="" method="" class="main_form">
        <div class="text_info clearfix"><span>资费名称：</span></div>
        <div class="input_info">
            <input type="text" class="width300" value="" name="name"/>
            <span class="required">*</span>
            <div class="validate_msg_short">50长度的字母、数字、汉字和下划线的组合</div>
        </div>
        <div class="text_info clearfix"><span>资费类型：</span></div>
        <div class="input_info fee_type">
            <input type="radio" name="cost_type" class="cost_type" value="1" id="monthly" onclick="feeTypeChange(1);"/>
            <label for="monthly">包月</label>
            <input type="radio" name="cost_type" class="cost_type" value="2" checked="checked" id="package"
                   onclick="feeTypeChange(2);"/>
            <label for="package">套餐</label>
            <input type="radio" name="cost_type" class="cost_type" value="3" id="timeBased"
                   onclick="feeTypeChange(3);"/>
            <label for="timeBased">计时</label>
        </div>
        <div class="text_info clearfix"><span>基本时长：</span></div>
        <div class="input_info">
            <input type="text" value="" name="base_duration" class="width100"/>
            <span class="info">小时</span>
            <span class="required">*</span>
            <div class="validate_msg_long">1-600之间的整数</div>
        </div>
        <div class="text_info clearfix"><span>基本费用：</span></div>
        <div class="input_info">
            <input type="text" value="" name="base_cost" class="width100"/>
            <span class="info">元</span>
            <span class="required">*</span>
            <div class="validate_msg_long error_msg">0-99999.99之间的数值</div>
        </div>
        <div class="text_info clearfix"><span>单位费用：</span></div>
        <div class="input_info">
            <input type="text" value="" name="unit_cost" class="width100"/>
            <span class="info">元/小时</span>
            <span class="required">*</span>
            <div class="validate_msg_long error_msg">0-99999.99之间的数值</div>
        </div>
        <div class="text_info clearfix"><span>资费说明：</span></div>
        <div class="input_info_high">
            <textarea name="descr" class="width300 height70"></textarea>
            <div class="validate_msg_short error_msg">100长度的字母、数字、汉字和下划线的组合</div>
        </div>
        <div class="button_info clearfix">
            <input type="button" value="保存" class="btn_save" onclick="showResult();"/>
            <input type="button" value="取消" class="btn_save" onclick="location.href='../cost/list.do'"/>
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
