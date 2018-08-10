<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <!-- 引入 -->
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>"> 
    <title>My JSP 'addUser.jsp' starting page</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/user.js"></script>
  </head>
  
  <body>
  <form action="<%=basePath%>user/update_Obj" id="update_Obj" method="post">
  <input id="type" type="hidden" name="type" value="${type}">
  <input id="yc" type="hidden" name="yc" value="${id}"><!-- 隐藏ID -->
  <table>
		<tr>
			<td>NAME:</td>
			<td><input id="update_name" name="update_name" type="text" value="${user.name}"></td>
		</tr> 
		<tr>
			<td>AGE:</td>
			<td><input id="update_age" name="update_age" type="text" value="${user.age}"></td>
		</tr>
		<tr>
			<td>SEX:</td>
			<td>                                                                                                                           <!--默认选择为男 -->
					<input type="radio" name="update_sex"  value="0" <c:if test="${user.sex eq '0' or user.sex == null}">checked</c:if> />男
                    <input type="radio" name="update_sex"  value="1" <c:if test="${user.sex eq '1' }">checked</c:if>/>女
                    </td>
		</tr>
		<tr>
			<td>ADDRESS:</td>
			<td><input id="update_address" name="update_address" type="text" value="${user.address}"></td>
		</tr>
		<tr>
			<td>ADULT:</td>
			<td>                                                                                                                                 <!-- 默认选择为成年  -->
					<input type="radio" name="update_adult"  value="0" <c:if test="${user.adult eq '0' or user.adult == null}">checked</c:if> />成年
                    <input type="radio" name="update_adult"  value="1" <c:if test="${user.adult eq '1' }">checked</c:if>/>未成年
           </td>
		</tr>
		<tr>
			<td>PASSWORD:</td>
			<td><input id="update_password" name="update_password" type="text" value="${user.password}"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="提交" onclick="update_Obj()">
            </td>
		</tr>
  </table>
  </form>  
  </body>
</html>
