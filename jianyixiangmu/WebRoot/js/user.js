function show_Obj(id,type){
	$("#show_user").val(id);//给ID为show_user的input赋值id
	$("#show_type").val(type);//给ID为show_type的input赋值type
	$("#show_Obj").submit();//提交show_Obj方法
}

function update_Obj(){
	 var re = /^[0-9]+.?[0-9]*$/; //正则表达式
	 var age = $("#update_age").val();//取ID为update-age的input的值，赋值给age
	 var address = $("#update_address").val();//取ID为update_address的input的值，赋值给address
	if(re.test(age)){//判断age的取值是否符合正则表达式形式
		if(address.length<=20){	//如果地址长度超过20提示地址过长
			if(address != null & address!=''){//如果地址不为空与地址不等于空字符。提交更新后的地址
				$("#update_Obj").submit();//提交
				alert("添加成功");//提示语
			}else{
				alert("添加地址");//如果没有输入地址，提示
				$("#update_address").val('');
				return false;	
			}		
		}else{
			alert("地址过长");
			// 使输入框置空
			$("#update_address").val('');
			return false;		
		}	
	}else{
		alert("请输入数字");
		$("#update_age").val('');
		return false;		
	}
}



