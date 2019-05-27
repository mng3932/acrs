package ${hss_base_package}.webapp.action;

import javax.servlet.http.HttpServletRequest;

import org.nestframework.annotation.Before;

import ${hss_base_package}.common.Constant;
import ${hss_base_package}.dto.��¼�û�;

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
