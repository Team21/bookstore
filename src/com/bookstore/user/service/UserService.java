package com.bookstore.user.service;

import com.bookstore.user.dao.UserDao;
import com.bookstore.user.domain.User;


public class UserService {
	private UserDao userDao = new UserDao();
	
	/**
	 * 注册功能
	 * @param form
	 */
	public void regist(User form) throws UserException{
		
		// 校验用户名
		User user = userDao.findByUsername(form.getUsername());
		if(user != null) throw new UserException("用户名已被注册！");
		
		// 校验email
		user = userDao.findByEmail(form.getEmail());
		if(user != null) throw new UserException("Email已被注册！");
		
		// 插入用户到数据库
		userDao.add(form);
	}
	
	/**
	 * 激活功能
	 * @throws UserException 
	 */
	public void active(String code) throws UserException {
		/*
		 * 1. 使用code查询数据库，得到user
		 */
		User user = userDao.findByCode(code);
		/*
		 * 2. 如果user不存在，说明激活码错误
		 */
		if(user == null) throw new UserException("激活码无效！");
		/*
		 * 3. 校验用户的状态是否为未激活状态，如果已激活，说明是二次激活，抛出异常
		 */
		if(user.isState()) throw new UserException("您已经激活过了，不要再激活了，除非你想死！");
		
		/*
		 * 4. 修改用户的状态
		 */
		userDao.updateState(user.getUid(), true);
	}
	
	/**
	 * 登录功能
	 * @param form
	 * @return
	 * @throws UserException 
	 */
	public User login(User form) throws UserException {

		User user = userDao.findByUsername(form.getUsername());
		if(user == null) throw new UserException("用户名不存在！");
		if(!user.getPassword().equals(form.getPassword()))
			throw new UserException("密码错误！");
		if(!user.isState()) throw new UserException("尚未激活！");
		
		return user;
	}
	
	public void vaild(String inputvcode,String vcode) throws UserException{
		
		if(inputvcode == null || inputvcode.trim().isEmpty()) {
			throw new UserException("验证码不能为空！");
		} else if(inputvcode.length() != 4) {
			throw new UserException("验证码长度必须为4！");
		} else if(!inputvcode.equalsIgnoreCase(vcode)) {
			throw new UserException("验证码错误！");
		}
	}
}
