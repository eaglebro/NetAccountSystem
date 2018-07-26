<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>云科技</title>
    <link type="text/css" rel="stylesheet" media="all" href="../styles/global.css"/>
    <link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css"/>
    <script language="JavaScript" type="text/javascript"
            src="<%=request.getContextPath()%>/js/jquery-3.2.1.js"></script>
    <script language="javascript" type="text/javascript">
        var data = "";
        // 信息
        var msg = "${msg}";
        function showMsg() {
            if (msg != null) {
                if (msg != "") {
                    alert(msg);
                }
            }
        }
        showMsg();
        //删除
        function deleteAccount() {
            var r = window.confirm("确定要删除此账务账号吗？\r\n删除后将不能恢复，且会删除其下属的所有业务账号。");
            document.getElementById("operate_result_info").style.display = "block";
        }
        //开通或暂停
        function sendState(account_id, state) {
            $.ajax({
                type: "post",
                url: "../account/changeState",
                // 后台向前端发数据 声明
                dataType: "json",
                data: {
                    "account_id": account_id,
                    "status": state
                }
            })

        }
        function setState(account_id, state) {
            if (state == "1") {
                var r = window.confirm("确定要开通此账务账号吗？");
                if (r) {
                    sendState(account_id, state);
                    document.getElementById("operate_result_text").innerText = "开通成功";
                    document.getElementById("operate_result_info").style.display = "block";
                }
            } else if (state == "2") {
                var r = window.confirm("确定要暂停此账务账号吗? ");
                if (r) {
                    sendState(account_id, state);
                    document.getElementById("operate_result_text").innerText = "暂停成功";
                    document.getElementById("operate_result_info").style.display = "block";
                }
            } else if (state == "0") {
                var r = window.confirm("确定要删除此账务账号吗? ");
                if (r) {
                    sendState(account_id, state);
                    document.getElementById("operate_result_text").innerText = "删除成功";
                    document.getElementById("operate_result_info").style.display = "block";
                }
            }
        }

        function switchPage(page) {
            document.getElementById("pageNum").setAttribute("value", page);
            document.getElementById("idcard_no").setAttribute("value", "${condition.idcard_no}");
            document.getElementById("real_name").setAttribute("value", "${condition.real_name}");
            document.getElementById("login_name").setAttribute("value", "${condition.login_name}");
            document.getElementById("form").submit();
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
    <form action="<%=request.getContextPath()%>/account/search" method="post" id="form">
        <!--查询-->
        <div class="search_add">
            <div>身份证：<input type="text" value="${condition.idcard_no}" class="text_search" name="idcard_no" id="idcard_no"/></div>
            <div>姓名：<input type="text" class="width70 text_search" value="${condition.real_name}" name="real_name" id="real_name"/>
            </div>
            <div>登录名：<input type="text" value="${condition.login_name}" class="text_search" name="login_name" id="login_name"/></div>
            <div>
                状态：
                <select class="select_search" name="status">
                    <option value="">全部</option>
                    <option value="1">开通</option>
                    <option value="2">暂停</option>
                    <option value="0">删除</option>
                </select>
            </div>
            <div><input type="submit" value="搜索" class="btn_search"/></div>
            <input type="button" value="增加" class="btn_add"
                   onclick="location.href='<%=request.getContextPath()%>/account/add';"/>
        </div>
        <!--删除等的操作提示-->
        <div id="operate_result_info" class="operate_success">
            <img src="../images/close.png" onclick="
            this.parentNode.style.display='none';
            window.location.reload()"/>
            <div id="operate_result_text">
                删除成功，且已删除其下属的业务账号！
            </div>
        </div>
        <!--数据区域：用表格展示数据-->
        <div id="data">
            <table id="datalist">
                <tr>
                    <th>账号ID</th>
                    <th>姓名</th>
                    <th class="width150">身份证</th>
                    <th>登录名</th>
                    <th>状态</th>
                    <th class="width100">创建日期</th>
                    <th class="width150">上次登录时间</th>
                    <th class="width200"></th>
                </tr>
                <c:forEach items="${page.list}" var="account">
                    <tr>
                        <td>${account.account_id}</td>
                        <td><a href="<%=request.getContextPath()%>/account/detail?account_id=${account.account_id}">${account.real_name}</a></td>
                        <td>${account.idcard_no}</td>
                        <td>${account.login_name}</td>
                        <td id="status_${account.account_id}">
                            <c:if test="${account.status=='0'}">
                                删除
                            </c:if>
                            <c:if test="${account.status=='1'}">
                                开通
                            </c:if>
                            <c:if test="${account.status=='2'}">
                                暂停
                            </c:if>
                        </td>
                        <td>${account.create_date}</td>
                        <td>${account.last_login_time}</td>
                        <td class="td_modi" id="td_modi_${account.account_id}">
                            <c:if test="${account.status!='0'}">
                                <c:if test="${account.status=='1'}">
                                    <input type="button" value="暂停" class="btn_pause"
                                           onclick="setState(${account.account_id},'2');"/>
                                </c:if>
                                <c:if test="${account.status=='2'}">
                                    <input type="button" value="开通" class="btn_start"
                                           onclick="setState(${account.account_id},'1')"/>
                                </c:if>
                                <c:if test="${account.status!='1'}">
                                    <input type="button" value="修改" class="btn_modify"
                                           onclick="location.href='account_modi.jsp';"/>
                                    <input type="button" value="删除" class="btn_delete"
                                           onclick="setState(${account.account_id},'0');"/>
                                </c:if>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                <%--<tr>--%>
                <%--<td>2</td>--%>
                <%--<td><a href="account_detail.jsp">贾强</a></td>--%>
                <%--<td>230102197902137862</td>--%>
                <%--<td>jiaqiang</td>--%>
                <%--<td>暂停</td>--%>
                <%--<td>2013-01-23</td>--%>
                <%--<td>2013-02-23 00:00:00</td>                            --%>
                <%--<td class="td_modi">--%>
                <%--<input type="button" value="开通" class="btn_start" onclick="setState();" />--%>
                <%--<input type="button" value="修改" class="btn_modify" onclick="location.href='account_modi.jsp';" />--%>
                <%--<input type="button" value="删除" class="btn_delete" onclick="deleteAccount();" />--%>
                <%--</td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                <%--<td>3</td>--%>
                <%--<td><a href="account_detail.jsp">贾强</a></td>--%>
                <%--<td>230102197902137862</td>--%>
                <%--<td>jiaqiang</td>--%>
                <%--<td>删除</td>--%>
                <%--<td>2013-01-23</td>--%>
                <%--<td>2013-02-23 00:00:00</td>                            --%>
                <%--<td class="td_modi">--%>
                <%--</td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                <%--<td>4</td>--%>
                <%--<td><a href="account_detail.jsp">贾强</a></td>--%>
                <%--<td>230102197902137862</td>--%>
                <%--<td>jiaqiang</td>--%>
                <%--<td>开通</td>--%>
                <%--<td>2013-01-23</td>--%>
                <%--<td>2013-02-23 00:00:00</td>                            --%>
                <%--<td class="td_modi">--%>
                <%--<input type="button" value="暂停" class="btn_pause" onclick="setState();" />--%>
                <%--<input type="button" value="修改" class="btn_modify" onclick="location.href='account_modi.jsp';" />--%>
                <%--<input type="button" value="删除" class="btn_delete" onclick="deleteAccount();" />--%>
                <%--</td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                <%--<td>5</td>--%>
                <%--<td><a href="account_detail.jsp">贾强</a></td>--%>
                <%--<td>230102197902137862</td>--%>
                <%--<td>jiaqiang</td>--%>
                <%--<td>暂停</td>--%>
                <%--<td>2013-01-23</td>--%>
                <%--<td>2013-02-23 00:00:00</td>                            --%>
                <%--<td class="td_modi">--%>
                <%--<input type="button" value="开通" class="btn_start" onclick="setState();" />--%>
                <%--<input type="button" value="修改" class="btn_modify" onclick="location.href='account_modi.jsp';" />--%>
                <%--<input type="button" value="删除" class="btn_delete" onclick="deleteAccount();" />--%>
                <%--</td>--%>
                <%--</tr>                    --%>
                <input type="hidden" name="pageNum" id="pageNum" value="1">
            </table>
            <p>业务说明：<br/>
                1、创建则开通，记载创建时间；<br/>
                2、暂停后，记载暂停时间；<br/>
                3、重新开通后，删除暂停时间；<br/>
                4、删除后，记载删除时间，标示为删除，不能再开通、修改、删除；<br/>
                5、暂停账务账号，同时暂停下属的所有业务账号；<br/>
                6、暂停后重新开通账务账号，并不同时开启下属的所有业务账号，需要在业务账号管理中单独开启；<br/>
                7、删除账务账号，同时删除下属的所有业务账号。</p>
        </div>
        <!--分页-->
        <div id="pages">
            <a href="#" onclick="switchPage(1)">首页</a>
            <c:if test="${!page.izFirstPage}">
                <a href="#" onclick="switchPage(${page.prePage})">上一页</a>
            </c:if>
            <c:forEach items="${page.navigatepageNums}" var="num">
                <c:if test="${num==page.pageNum}">
                    <a href="#" class="current_page" onclick="switchPage(${num})">${num}</a>
                </c:if>
                <c:if test="${num!=page.pageNum}">
                    <a href="#" onclick="switchPage(${num})">${num}</a>
                </c:if>
            </c:forEach>
            <%--<a href="#" class="current_page">1</a>--%>
            <%--<a href="#">2</a>--%>
            <%--<a href="#">3</a>--%>
            <%--<a href="#">4</a>--%>
            <%--<a href="#">5</a>--%>
            <c:if test="${!page.izLastPage}">
                <a href="#" onclick="switchPage(${page.nextPage})">下一页</a>
            </c:if>
            <a href="#" onclick="switchPage(${page.pages})">末页</a>
        </div>
    </form>
</div>
<!--主要区域结束-->
<div id="footer">
    <p>[源自北美的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</p>
    <p>版权所有(C)云科技有限公司 </p>
</div>
</body>
</html>
