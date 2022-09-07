package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDao;
import pojo.User;

@Service
public class UserService {
	@Autowired
	UserDao dao;
	
	public boolean getUser(String userName) {
		if(dao.check(userName)==null)
			return false;
		else
			return true;
	}
}
