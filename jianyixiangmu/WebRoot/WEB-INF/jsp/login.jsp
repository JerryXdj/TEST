<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
<meta charset="utf-8"></meta>
<title>个人项目</title>
<link href="<%=request.getContextPath() %>/images/login.css" rel="stylesheet" type="text/css"></link>

<script type="text/javascript"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
<script language="javascript" type="text/javascript">
 	var domainurl='<%=request.getContextPath()%>';
 	function isIE8() {
 		return navigator.userAgent.split(";")[1].toLowerCase().indexOf("msie 8.0") == "-1" ? false
 				: true;
 	}
 	function isIE9() {
 		return navigator.userAgent.split(";")[1].toLowerCase().indexOf("msie 9.0") == "-1" ? false
 				: true;
 	}
 	function isIE10() {
 		return navigator.userAgent.split(";")[1].toLowerCase().indexOf("msie 10.0") == "-1" ? false
 				: true;
 	}
 	function isIE11() {
 		return navigator.userAgent.split(";")[1].toLowerCase().indexOf("wow64") == "-1" ? false
 				: true;
 	}
 	function isFF() {
 		return navigator.userAgent.indexOf("Firefox") != -1;
 	}
 	function isChrome() {
 		return navigator.userAgent.indexOf("Chrome") > -1;
 	} 

 	function myfunction(){
 		if(!isIE8()&&!isIE9()&&!isIE10()&&!isIE11()&&!isFF()&&!isChrome()){
 			alert("当前系统仅支持IE8及以上版本，谷歌浏览器，火狐浏览器");
 			}
 	}
</script>
<script></script>
<script src="<%=request.getContextPath() %>/js/login.js"></script>
</head>

<body>
<table width="1100" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td align="right" height="100%" style=" background:url(<%=request.getContextPath() %>/images/login_bg.png) center center no-repeat"><table width="405" border="0" cellspacing="0" cellpadding="0" style="margin-top:110px">
        <tbody>
          <tr>
            <td width="58" height="32">&nbsp;</td>
            <td colspan="2" align="left"><input type="text" name="username" id="username"></td>
            </tr>
          <tr>
            <td height="21" colspan="3">&nbsp;</td>
          </tr>
          <tr>
            <td height="32">&nbsp;</td>
            <td height="32" colspan="2" align="left"><input type="password" name="password" id="password" ></td>
            </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td/> </td>
            <td>
            <a>
            	
            </a>
            <span></span>
            </td>
            </tr>
          <tr>
            <td height="22" colspan="3">&nbsp;</td>
          </tr>
          <tr>
            <td height="32" colspan="3"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tbody>
    <tr>
      <td width="122"><a  id="bta_id" href="javascript:void(0);"><img src="<%=request.getContextPath() %>/images/bt.png" width="112" height="32" alt=""  onclick="login()"/></a></td>
      <td><a href="<%=request.getContextPath() %>/register/toRegister"><img src="<%=request.getContextPath() %>/images/bt.png" width="112" height="32" alt=""/></a></td>
    </tr>
  </tbody>
</table>
</td>
          </tr>
        </tbody>
      </table></td>
    </tr>
</table>
<script type="text/javascript">
</script>
</body>
</html>
