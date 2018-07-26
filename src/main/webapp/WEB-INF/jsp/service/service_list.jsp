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
        //显示角色详细信息
        function showDetail(flag, a) {
            var detailDiv = a.parentNode.getElementsByTagName("div")[0];
            if (flag) {
                detailDiv.style.display = "block";
            }
            else
                detailDiv.style.display = "none";
        }
        //删除

        //开通或暂停

        function switchPage(page) {
          //  document.getElementById("pageNum").setAttribute("value", page);
           // document.getElementById("os_username").setAttribute("value", "${condition.os_username}");
           // document.getElementById("unix_host").setAttribute("value", "${condition.unix_host}");
           // document.getElementById("status").setAttribute("value", "${condition.status}");
            $("#pageNum").val(page);
            $("#os_username").val("${condition.os_username}");
            $("#unix_host").val("${condition.unix_host}");
            $("#status").val("${condition.status}");
            $("#searchBar").submit();
        }

        function submit() {
            $("#searchBar").submit();
        }
        //开通或暂停
        function sendState(account_id, status) {
            $.ajax({
                type: "post",
                url: "../service/changeStatus",
                // 后台向前端发数据 声明
                dataType: "json",
                data: {
                    "service_id": account_id,
                    "status": status
                }
            })

        }
        function setState(service_id, status) {
            if (status == "1") {
                var r = window.confirm("确定要开通此账务账号吗？");
                if (r) {
                    sendState(service_id, status);
                    document.getElementById("operate_result_text").innerText = "开通成功";
                    document.getElementById("operate_result_info").style.display = "block";
                }
            } else if (status == "2") {
                var r = window.confirm("确定要暂停此账务账号吗? ");
                if (r) {
                    sendState(service_id, status);
                    document.getElementById("operate_result_text").innerText = "暂停成功";
                    document.getElementById("operate_result_info").style.display = "block";
                }
            } else if (status == "0") {
                var r = window.confirm("确定要删除此账务账号吗? ");
                if (r) {
                    sendState(service_id, status);
                    document.getElementById("operate_result_text").innerText = "删除成功";
                    document.getElementById("operate_result_info").style.display = "block";
                }
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
    <form action="<%=request.getContextPath()%>/service/search" method="post" id="searchBar">
        <input type="hidden" name="pageNum" id="pageNum" value="1">
        <!--查询-->
        <div class="search_add">
            <div>OS 账号：<input type="text" value="${condition.os_username}" class="width100 text_search"
                              name="os_username" id="os_username"/></div>
            <div>服务器 IP：<input type="text" value="${condition.unix_host}" class="width100 text_search"
                               name="unix_host" id="unix_host"/></div>
            <div>身份证：<input type="text" value="${condition.idcard_no}" class="text_search" name="idcard_no" id="idcard_no"></div>
            <div>状态：
                <select class="select_search" name="status" id="status">
                    <option value="">全部</option>
                    <option value="1">开通</option>
                    <option value="2">暂停</option>
                    <option value="0">删除</option>
                </select>
            </div>
            <div><input type="button" value="搜索" class="btn_search" onclick="submit()"/></div>
            <input type="button" value="增加" class="btn_add"
                   onclick="location.href='<%=request.getContextPath()%>/service/add';"/>
        </div>

    <!--删除的操作提示-->
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
                <th class="width50">业务ID</th>
                <th class="width70">账务账号ID</th>
                <th class="width150">身份证</th>
                <th class="width70">姓名</th>
                <th>OS 账号</th>
                <th class="width50">状态</th>
                <th class="width100">服务器 IP</th>
                <th class="width100">资费</th>
                <th class="width200"></th>
            </tr>
            <c:forEach items="${pageInfo.list}" var="serviceVO">
                <tr>
                    <td><a href="service_detail.jsp" title="查看明细">${serviceVO.service_id}</a></td>
                    <td>${serviceVO.account_id}</td>
                    <td>${serviceVO.idcard_no}</td>
                    <td>${serviceVO.real_name}</td>
                    <td>${serviceVO.os_username}</td>

                    <td>
                        <c:if test="${serviceVO.status=='1'}">
                            开通
                        </c:if>
                        <c:if test="${serviceVO.status=='2'}">
                            暂停
                        </c:if>
                        <c:if test="${serviceVO.status=='0'}">
                            删除
                        </c:if>
                    </td>


                    <td>${serviceVO.unix_host}</td>
                    <td>
                        <a class="summary" onmouseover="showDetail(true,this);"
                           onmouseout="showDetail(false,this);">${serviceVO.name}</a>
                        <!--浮动的详细信息-->
                        <div class="detail_info">
                                ${serviceVO.descr}
                        </div>
                    </td>
                    <%--<td class="td_modi">--%>
                        <%--<input type="button" value="暂停" class="btn_pause" onclick="setState();"/>--%>
                        <%--<input type="button" value="修改" class="btn_modify"--%>
                               <%--onclick="location.href='service_modi.jsp';"/>--%>
                        <%--<input type="button" value="删除" class="btn_delete" onclick="deleteAccount();"/>--%>
                    <%--</td>--%>
                    <td class="td_modi" id="td_modi_${serviceVO.service_id}">
                        <c:if test="${serviceVO.status!='0'}">
                            <c:if test="${serviceVO.status=='1'}">
                                <input type="button" value="暂停" class="btn_pause"
                                       onclick="setState(${serviceVO.service_id},'2');"/>
                            </c:if>
                            <c:if test="${serviceVO.status=='2'}">
                                <input type="button" value="开通" class="btn_start"
                                       onclick="setState(${serviceVO.service_id},'1')"/>
                            </c:if>
                            <c:if test="${serviceVO.status!='1'}">
                                <input type="button" value="修改" class="btn_modify"
                                       onclick="location.href='<%=request.getContextPath()%>/service/modify?service_id=${serviceVO.service_id}';"/>
                                <input type="button" value="删除" class="btn_delete"
                                       onclick="setState(${serviceVO.service_id},'0');"/>
                            </c:if>
                        </c:if>
                    </td>
                </tr>

            </c:forEach>
        </table>
        <p>业务说明：<br/>
            1、创建即开通，记载创建时间；<br/>
            2、暂停后，记载暂停时间；<br/>
            3、重新开通后，删除暂停时间；<br/>
            4、删除后，记载删除时间，标示为删除，不能再开通、修改、删除；<br/>
            5、业务账号不设计修改密码功能，由用户自服务功能实现；<br/>
            6、暂停和删除状态的账务账号下属的业务账号不能被开通。</p>
    </div>
    <!--分页-->
    <div id="pages">
        <a href="#" onclick="switchPage(1)">首页</a>
        <a href="#" onclick="switchPage(${pageInfo.prePage})">上一页</a>
        <c:forEach items="${pageInfo.navigatepageNums}" var="num">
            <c:if test="${num==pageInfo.pageNum}">
                <a href="#" class="current_page" onclick="switchPage(${num})">${num}</a>
            </c:if>
            <c:if test="${num!=pageInfo.pageNum}">
                <a href="#" onclick="switchPage(${num})">${num}</a>
            </c:if>
        </c:forEach>
        <a href="#" onclick="switchPage(${pageInfo.nextPage})">下一页</a>
        <a href="#" onclick="switchPage(${pageInfo.pages})">末页</a>
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
