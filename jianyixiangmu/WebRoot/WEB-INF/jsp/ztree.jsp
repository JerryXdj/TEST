<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ztree.jsp' starting page</title>
    	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
    	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript">
  //  <!--
    var setting = { };
 
    var zNodes =[
      { name:"父节点1 - 展开", open:true,
        children: [
          { name:"父节点11 - 折叠",
            children: [
              { name:"叶子节点111"},
              { name:"叶子节点112"},
              { name:"叶子节点113"},
              { name:"叶子节点114"}
            ]},
          { name:"父节点12 - 折叠",
            children: [
              { name:"叶子节点121"},
              { name:"叶子节点122"},
              { name:"叶子节点123"},
              { name:"叶子节点124"}
            ]},
          { name:"父节点13 - 没有子节点", isParent:true}
        ]},
      { name:"父节点2 - 折叠",
        children: [
          { name:"父节点21 - 展开", open:true,
            children: [
              { name:"叶子节点211"},
              { name:"叶子节点212"},
              { name:"叶子节点213"},
              { name:"叶子节点214"}
            ]},
          { name:"父节点22 - 折叠",
            children: [
              { name:"叶子节点221"},
              { name:"叶子节点222"},
              { name:"叶子节点223"},
              { name:"叶子节点224"}
            ]},
          { name:"父节点23 - 折叠",
            children: [
              { name:"叶子节点231"},
              { name:"叶子节点232"},
              { name:"叶子节点233"},
              { name:"叶子节点234"}
            ]}
        ]},
      { name:"父节点3 - 没有子节点", isParent:true}
 
    ];
 
    $(document).ready(function(){
      $.fn.zTree.init($("#treeDemo"), setting, zNodes);
    });
    //-->
    
    var setting = {
  //可勾选
  check: {
      enable: true
    },
  data : {
    simpleData : {
      enable : true
    }
  }
};
 
  function initTree(){
    var payFreq = $("#payFreq").val();
    var fyType = $('#fyType').val();
    var setHzType = $('#setHzType').val();
 
    $.ajax({
      url : "/demo/initTree",
      data : {payFreq:payFreq,
          fyType:fyType,
          setHzType:setHzType
      },
      success: function(object){
        var nodes = "";
        //拼接simple格式的json字符串
        $.each(object.data, function(i,item) {
         nodes+="{id:'"+item.id+"', pId:'"+item.pid+"', name:'"+item.name+"', isParent:'"+item.isParent+"'},";
        });
        var zNodes = "["+nodes+"]";
        var json = eval('(' + zNodes + ')'); 
        //console.log(json);
        zTreeInit(json);
      }
    });
 
  }
  /* 初始化树 */
  function zTreeInit(json) {
    $.fn.zTree.init($("#treeDemo"), setting, json);
    var zTree = $.fn.zTree.getZTreeObj("treeDemo");
    //全部展开
    zTree.expandAll(true);
    //Y代表勾选时,N代表取消勾选 p代表父节点,s代表字节点
    setting.check.chkboxType = { "Y" : "ps", "N" : "ps" };
 
  }

    
  </script>

  </head>
  
<div>
 <ul id="treeDemo" class="ztree"></ul>
</div>

</html>
