package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.UserDTO;
import com.service.UserService;
import com.tool.PageControl;

/**
 * 用户登录
 * 
 */
@Controller
@RequestMapping("/login")
public class LoginController {
	@Resource
	private UserService userService;

	private int len = 10;
	private int pageNum = 1;

	/**
	 * 登录页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/userlogin")
	public String userlogin(HttpServletRequest request) {
		return "/login";
	}

	@RequestMapping("/query_Page")
	public String query_Page(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			String page = request.getParameter("page") == null ? "0" : request
					.getParameter("page");
			String user_name = request.getParameter("user_name") == null ? ""
					: request.getParameter("user_name").trim();
			if (page != null && !"".equals(page)) {
				pageNum = Integer.parseInt(page);
			} else {
				pageNum = 1;
			}

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("pageNum", pageNum);
			map.put("len", len);
			map.put("user_name", user_name);
			PageControl pcList = this.userService.query_Page(map);
			request.setAttribute("pc", pcList);
			request.setAttribute("map", map);
		} catch (Exception ex) {
			ex.printStackTrace();
			return "error";
		}
		return "/user/index";
	}

	/**
	 * 登录
	 * 
	 * @param request
	 */
	@RequestMapping(value = "/login")
	@ResponseBody
	public void login(HttpServletRequest request, HttpServletResponse response) {
		JSONObject json = new JSONObject();		
		String account = request.getParameter("username");// 账号
		String pwd = request.getParameter("password");
		if (account != null && !"".equals(account)) {
			account = account.trim();
		}	
		if (pwd != null && !"".equals(pwd)) {
			try {
				pwd = URLDecoder.decode(pwd, "UTF-8");
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}			
			Map<String,Object> usermap = new HashMap<String, Object>();
			usermap.put("id", account);
			usermap.put("password",pwd);
			UserDTO vipUser = userService.queryByMap(usermap);
				if (vipUser != null) {// 用户存在
						try {
							json.put("result", "success");
						} catch (UnknownAccountException e) {
							json.put("result", "error");
						} catch (IncorrectCredentialsException e) {
							json.put("result", "error");
						} 
				}else {
					json.put("result", "error");
				}


			PrintWriter out = null;
			try {
				out = response.getWriter();
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
	}

	/**
	 * 登录成功后跳转页面
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/index")
	public String index(HttpServletRequest request) {
		UserDTO user = (UserDTO) request.getSession().getAttribute("user");
		if (user != null) {
			Map qymap = new HashMap();
			qymap.put("user_id", user.getId());
			return "/user";
		} else {
			return "/login";
		}
	}

}