package com.becom.acrs.webapp.action;

import javax.servlet.http.HttpServletRequest;

import org.nestframework.annotation.Before;

import com.becom.acrs.common.Constant;
import com.becom.acrs.dto.登录用户;

/**
 * @author wanghai
 *
 */
public abstract class BaseAction {
	
	public String message;
	
	public String error;

	public 登录用户 userDto;

	public String orderType;
	
	public String orderBy;

	public boolean hideOrShowSearchFlag = true;
	
	/**
	 * 获取登录用户的Session对象.
	 * 
	 * @param req
	 * @return
	 */
	@Before
	public void init(HttpServletRequest req) {
		userDto=(登录用户) req.getSession().getAttribute(Constant.KEY_LOGIN_USER);
	}
	
	public Object toLoginPage(){
		return "/login.jsp";
	}
}
