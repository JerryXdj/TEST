function dosearch(){//做搜索函数
	$("#dosearch").submit();//提交搜索
}

//首页，上一页，下一页，尾页
function PageControl(num) {
	$("#page").val(num);
	$("#dosearch").submit();
}
// 页面跳转到指定页数
function gotoPage(tol) {//页面跳转最大数值
	var num = $('#pageno').val().replace(/[\s]/g, '');
	var str = /^[0-9]*[1-9][0-9]*$/;
	if (!str.test(num)) {//如果num的取值不符合正则表达式
		$('#pageno').val('');//如果pageno的值为空  
		alert("请输入数字");//提示
	} else if (num - tol > 0) {//如果输入的数字大于页面数的最大值
		$('#pageno').val('');//清空搜索栏
		alert("数字过大");//提示
	} else {
		$("#page").val(num);
		$("#dosearch").submit();
	}
}