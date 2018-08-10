package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.UserDTO;
import com.service.UserService;
import com.tool.PageControl;


@Controller
@RequestMapping("/user")
public class UserController {
	
	private int cpage = 1;// 页码
	private int pagesize = 5;// 页大小
	
	@Resource
	private UserService userService;
	/**
	 * 打开表格列表界面
	 * */
	@RequestMapping("/user")
	public String doindex(HttpServletRequest request){
		String page = request.getParameter("page") ;	
		String name = request.getParameter("search_name") ;	//根据姓名模糊查询
		if (page != null && !"".equals(page)) {
			cpage = Integer.parseInt(page);
		} else {
			cpage = 1;
		}
		String id = "";
		Map<String, Object> map = new HashMap<String, Object>();
		if (name != null && !"".equals(name)) {
			map.put("name", "'%"+name+"%'");
//			map.put("address", "'%"+name+"%'");
			request.setAttribute("name", name);
		} else {
			map.put("name", "");
//			map.put("address", "");
			request.setAttribute("name", "");
		}
//xml里将地址与姓名得人模糊查询放在一起了
//		if (address != null && !"".equals(address)) {
//			map.put("address", "'%"+address+"%'");
//			request.setAttribute("address", address);
//		} else {
//			map.put("address", "");
//			request.setAttribute("address", "");
//		}
		map.put("cpage", cpage);
		map.put("pagesize", pagesize);
		map.put("id", id);
		PageControl pc = userService.query_Page(map);
		request.setAttribute("pc", pc);
        System.out.println(pc);
		return "/index";
	}
	@RequestMapping("/delete_Obj")
	public void delete_Obj(HttpServletRequest request, HttpServletResponse response)
	{
		PrintWriter out = null;
		JSONObject json = new JSONObject();
		try {
			String id = request.getParameter("id");
			Map map =new HashMap();
			map.put("id", id);
			map.put("state", "1");
			userService.delete_Obj(map);
			out = response.getWriter();		
			json.put("result", "success");
			out.print(json);
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (null != out) {
				out.close();
			}
		}
	}
	
	@RequestMapping("/show_Obj")
	public String show_Obj(HttpServletRequest request){
		String id= request.getParameter("show_user");
		String type= request.getParameter("show_type");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		if(type.equals("2")){
			UserDTO userDTO = userService.queryByMap(map);
			request.setAttribute("user", userDTO);
		}
		request.setAttribute("id", id);
		request.setAttribute("type", type);
		return "/update_user";
	}
	 
	@RequestMapping("/update_Obj")
	public String update_Obj(HttpServletRequest request){
		String type= request.getParameter("type");	
		String user_id= request.getParameter("yc");
		String user_name= request.getParameter("update_name");
		String user_age= request.getParameter("update_age");
		String user_sex= request.getParameter("update_sex");
		String user_address= request.getParameter("update_address");
		String user_adult= request.getParameter("update_adult");
		String user_password= request.getParameter("update_password");

		UserDTO userDTO =new UserDTO();
		userDTO.setId(user_id);
		userDTO.setName(user_name);
		userDTO.setAge(user_age);
		userDTO.setSex(user_sex);
		userDTO.setAddress(user_address);
		userDTO.setState("0");
		userDTO.setAdult(user_adult);
		userDTO.setPassword(user_password);
		
		if(type.equals("1")){
			this.userService.save_Obj(userDTO);
		}else{			
			this.userService.update_Obj(userDTO);
		}
		return this.doindex(request);
	}
}
