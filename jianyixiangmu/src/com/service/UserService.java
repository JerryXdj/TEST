package com.service;

import java.util.Map;

import com.model.UserDTO;
import com.tool.PageControl;


public interface UserService {

	public void save_Obj(UserDTO object);

	public void update_Obj(UserDTO object);

	public PageControl query_Page(Map<String, Object> map);

	public void delete_Obj(Map<String, Object> map);

	public UserDTO queryByMap(Map<String, Object> map);

}
