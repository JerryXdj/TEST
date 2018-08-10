<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
		<td height="38" align="right" >
		共<font color="red">${pc.totalitem}</font>条数据&nbsp;&nbsp;
		<a style="cursor:pointer;" onclick="PageControl('1')">首页</a>&nbsp;&nbsp;
		<a style="cursor:pointer;" onclick="PageControl('${pc.previouspage }')">上一页</a>&nbsp;&nbsp;
		<font color="red">${pc.cpage}/<c:if test="${pc.totalpage==0}">1</c:if><c:if test="${pc.totalpage!=0}">${pc.totalpage}</c:if></font> &nbsp;&nbsp;
		<a style="cursor:pointer;" onclick="PageControl('${pc.nextpage }')">下一页</a>&nbsp;&nbsp;
		<a style="cursor:pointer;" onclick="PageControl('${pc.totalpage}')">尾页</a>&nbsp;&nbsp;跳转到
		</td>
		<td width="40" align="center"><input name="textfield8" type="text" class="inp_w4" id="pageno" /></td>
		<td width="42" align="left">
		<img src="<%=basePath%>/images/bt_go.gif" width="26" height="24" onclick="gotoPage('${pc.totalpage}')"></td>
