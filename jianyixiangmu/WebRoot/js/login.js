 document.onkeydown=function(event){//获取键盘事件
     var e = event || window.event || arguments.callee.caller.arguments[0];
     if(e && e.keyCode==27){ // 按 Esc 
         //要做的事情
       }
     if(e && e.keyCode==113){ // 按 F2 
          //要做的事情
        }            
      if(e && e.keyCode==13){ // enter 键
          //要做的事情
    	  login();
     }
 }; 

function login(){
		var account =$.trim($("#username").val());//去除id为username的input的值里面的空格，并赋值给account
		var pwd = $("#password").val();	//取id为password的input的值	赋值为pwd
		if(account==''){//如果account为空
			alert("请输入用户名");//提示
	        return false;
		}
		if(pwd==''){
			alert("请输入密码");
			return false;
		}	
	 loginSubmit();//用户密码正确提交登录
	}

function loginSubmit() {	//提交登录验证
		var password = $.trim($("#password").val());//取id为password的input的值	赋值为password
		var username = $.trim($("#username").val());	
		$.post(domainurl + '/login/login', {//路径
			'username' : username,//参数
			'password' : password,	
		}, function(data) {
			var res = JSON.parse(data);//将前台传递的参数放到json里解析，并赋值给res
			if (res.result == 'success') {	//res中有个键值对，如果返回的是success
				window.location.href = domainurl + '/user/user';//网页跳转到user（自定义）页面
			} else if (res.result == 'error') {
				alert("您输入的账号或密码有误，请重新输入!");
				$("#password").val('');		
			} else if (res.result == 'jinyong') {
				alert("您输入的账号已被管理员禁用，请联系管理员!");
				$("#password").val('');	
			} else if (res.result == 'shanchu') {
				alert("您输入的账号不存在!");
				$("#password").val('');
			}
		});
}
	