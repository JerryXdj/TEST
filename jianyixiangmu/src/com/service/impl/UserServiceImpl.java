package com.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.UserDAO;
import com.model.UserDTO;
import com.service.UserService;
import com.tool.PageControl;

@Service

//@Transactional
public class UserServiceImpl implements UserService {

	@Resource
	private UserDAO userDAO;
	
	@Override
	public void save_Obj(UserDTO object) {
		try {
			this.userDAO.save_Obj(object);
		} catch (Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException("error��������");
}	
	}

	@Override
	public void delete_Obj(Map<String, Object> map) {
		   try {
			this.userDAO.delete_Obj(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("error��������");
		}		
	}

	@Override
	public void update_Obj(UserDTO object) {
		   try {
			this.userDAO.update_Obj(object);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("error��������");
		}		
	}

	@Override
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public PageControl query_Page(Map<String, Object> map) {
		PageControl pc = new PageControl();
		System.out.println(map.get("cpage").toString());
		int cpage = Integer.parseInt(map.get("cpage").toString());//將String類型强转成int类型
		int len = Integer.parseInt(map.get("pagesize").toString());
		if (cpage <= 0) {
			cpage = 1;
		}
		int beg = (cpage - 1) * len;
		int end = beg + len;
		map.put("beg", beg);
		map.put("end", end);

		pc.setCpage(cpage);
		pc.setPagesize(len);
		pc.setList(this.userDAO.query_Page(map));
		pc.setTotalitem(this.userDAO.query_count(map));
		return pc;
	}

	@Override
	public UserDTO queryByMap(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.userDAO.queryByMap(map);
	}     
}
