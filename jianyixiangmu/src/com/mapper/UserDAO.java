package com.mapper;

import java.util.List;
import java.util.Map;

import com.model.UserDTO;

public interface UserDAO {

	void save_Obj(UserDTO object);

	void delete_Obj(Map<String, Object> map);

	void update_Obj(UserDTO object);

	int query_count(Map<String, Object> map);

	List query_Page(Map<String, Object> map);

	UserDTO queryByMap(Map<String, Object> map);

}
