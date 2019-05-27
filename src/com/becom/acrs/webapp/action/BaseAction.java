package com.becom.acrs.webapp.action;

import javax.servlet.http.HttpServletRequest;

import org.nestframework.annotation.Before;

import com.becom.acrs.common.Constant;
import com.becom.acrs.dto.��¼�û�;

/**
 * @author wanghai
 *
 */
public abstract class BaseAction {
	
	public String message;
	
	public String error;

	public ��¼�û� userDto;

	public String orderType;
	
	public String orderBy;

	public boolean hideOrShowSearchFlag = true;
	
	/**
	 * ��ȡ��¼�û���Session����.
	 * 
	 * @param req
	 * @return
	 */
	@Before
	public void init(HttpServletRequest req) {
		userDto=(��¼�û�) req.getSession().getAttribute(Constant.KEY_LOGIN_USER);
	}
	
	public Object toLoginPage(){
		return "/login.jsp";
	}
}
