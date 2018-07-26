<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>云科技</title>
    <link type="text/css" rel="stylesheet" media="all" href="../styles/global.css"/>
    <link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css"/>
    <script src="../js/jquery-3.2.1.js"></script>
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
        <li><a href="role/role_list.html" class="role_off"></a></li>
        <li><a href="admin/admin_list.html" class="admin_off"></a></li>
        <li><a href="<%=request.getContextPath()%>/cost/list.do" class="fee_off"></a></li>
        <li><a href="<%=request.getContextPath()%>/account/main" class="account_on"></a></li>
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
    <form action="" method="" class="main_form">
        <!--必填项-->
        <div class="text_info clearfix"><span>账务账号ID：</span></div>
        <div class="input_info"><input type="text" value="${account.account_id}" readonly class="readonly"/></div>
        <div class="text_info clearfix"><span>姓名：</span></div>
        <div class="input_info"><input type="text" value="${account.real_name}" readonly class="readonly"/></div>
        <div class="text_info clearfix"><span>身份证：</span></div>
        <div class="input_info">
            <input type="text" value="${account.idcard_no}" readonly class="readonly"/>
        </div>
        <div class="text_info clearfix"><span>登录账号：</span></div>
        <div class="input_info">
            <input type="text" value="${account.login_name}" readonly class="readonly"/>
        </div>
        <div class="text_info clearfix"><span>电话：</span></div>
        <div class="input_info">
            <input type="text" class="width200 readonly" readonly value="${account.telephone}"/>
        </div>
        <div class="text_info clearfix"><span>推荐人账务账号ID：</span></div>
        <div class="input_info"><input type="text" readonly class="readonly" value="${account.recommender_id}"/></div>
        <div class="text_info clearfix"><span>推荐人身份证号码：</span></div>
        <div class="input_info"><input type="text" readonly class="readonly" value=""/></div>
        <div class="text_info clearfix"><span>状态：</span></div>
        <div class="input_info">
            <select disabled>
                <c:choose>
                    <c:when test="${account.status == '1'}">
                        <option>开通</option>
                    </c:when>
                    <c:when test="${account.status == '2'}">
                        <option>暂停</option>
                    </c:when>
                    <c:when test="${account.status == '3'}">
                        <option>删除</option>
                    </c:when>
                </c:choose>
            </select>
        </div>
        <div class="text_info clearfix"><span>开通/暂停/删除时间：</span></div>
        <div class="input_info"><input type="text" readonly class="readonly" value="2013/01/21 12:00:00"/></div>

        <div class="text_info clearfix"><span>上次登录时间：</span></div>
        <div class="input_info"><input type="text" readonly class="readonly" value="2013/02/21 12:00:00"/></div>
        <div class="text_info clearfix"><span>上次登录IP：</span></div>
        <div class="input_info"><input type="text" readonly class="readonly" value="192.168.0.100"/></div>
        <!--可选项数据-->
        <div class="text_info clearfix"><span>生日：</span></div>
        <div class="input_info">
            <input type="text" readonly class="readonly" value="1980/01/21，由身份证计算而来"/>
        </div>
        <div class="text_info clearfix"><span>Email：</span></div>
        <div class="input_info">
            <input type="text" class="width350 readonly" readonly value="aa@aa.com"/>
        </div>
        <div class="text_info clearfix"><span>职业：</span></div>
        <div class="input_info">
            <select disabled>
                <option>干部</option>
                <option>学生</option>
                <option>技术人员</option>
                <option>其他</option>
            </select>
        </div>
        <div class="text_info clearfix"><span>性别：</span></div>
        <div class="input_info fee_type">
            <input type="radio" name="radSex" checked="checked" id="female" disabled/>
            <label for="female">女</label>
            <input type="radio" name="radSex" id="male" disabled/>
            <label for="male">男</label>
        </div>
        <div class="text_info clearfix"><span>通信地址：</span></div>
        <div class="input_info"><input type="text" class="width350 readonly" readonly value="北京市海淀区北三环中路甲18号中鼎大厦"/>
        </div>
        <div class="text_info clearfix"><span>邮编：</span></div>
        <div class="input_info"><input type="text" class="readonly" readonly value="100098"/></div>
        <div class="text_info clearfix"><span>QQ：</span></div>
        <div class="input_info"><input type="text" class="readonly" readonly value="12345678"/></div>
        <!--操作按钮-->
        <div class="button_info clearfix">
            <input type="button" value="返回" class="btn_save" onclick="window.history.go(-1)"/>
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
