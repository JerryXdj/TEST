<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'index.jsp' starting page</title>
	<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.easyui.min.js"></script> --%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/public.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/user.js"></script>
<script type="text/javascript">
var domainurl = '<%=request.getContextPath()%>';   
                              /*获取当前项目的路径  */ 
function delete_Obj(id)
{
	url = domainurl+"/user/delete_Obj?id="+id;
	$.post(url,
			function(data){
				window.location.href= domainurl+"/user/user";
			});
}

</script>
 </head>
  
  <body>                                                      <!--  获取当前项目的路径  --> 
 <form id="dosearch" method="post" action="<%=basePath%>user/user">
		<input id="page" name="page" type="hidden" value="" />
		名称：<input type="text" id="search_name" name="search_name" value="${name}"><br /><!-- 搜索框显示 -->		
				 <input type="button" value="搜索" onclick="dosearch();"><!-- 添加搜索框 -->
</form>
<input type="button" value="新增" onclick="show_Obj('${t.ID}','1')">
    <table border="1" align="center">
    <tr>
	    <td>ID</td>
	    <td>NAME</td>
	    <td>SEX</td>
	    <td>AGE</td>
	    <td>ADDRESS</td>
	    <td>ADULT</td>
	    <td>PASSWORD</td>
    </tr>
	     <c:forEach var="t" items="${pc.list}" varStatus="index"><!-- 循环遍历 -->
     <tr>
		     <td id="bb">${t.ID}</td>
		     <td>${t.NAME}</td>
		     <td>
		     <c:if test="${t.SEX eq '0'}">男</c:if>
		     <c:if test="${t.SEX eq '1'}">女</c:if><!-- 将性别以男女两种方式显示 -->
		   <%--   <c:if test="${t.SEX ne '1' and t.SEX ne '0'}">尚未修改</c:if> --%>
		     </td>
		     <td>${t.AGE}</td>
		     <td>${t.ADDRESS}</td>
		     <td>
		       <c:if test="${t.ADULT eq '0'}">成年</c:if>
		       <c:if test="${t.ADULT eq '1'}">未成年</c:if><!-- 是否成年勾选 -->
			 </td>
			 <td>${t.PASSWORD}</td>
		     
		     <td><input type="button" value="删除" onclick="delete_Obj('${t.ID}')"></td>
		     <td><input type="button" value="修改" onclick="show_Obj('${t.ID}','2')"></td>
     </tr>
	     </c:forEach>
    </table>    
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="fy">
			<tr>
				<jsp:include page="./page.jsp"></jsp:include>
			</tr>
		</table>
<form action="<%=basePath%>user/show_Obj" id="show_Obj" method="post">
	<input id="show_user" name="show_user" type="hidden">
	<input id="show_type" name="show_type" type="hidden">
</form>
</body>
</html>
