package com.becom.acrs.webapp.action;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.nestframework.action.Redirect;
import org.nestframework.addons.spring.Spring;
import org.nestframework.annotation.DefaultAction;
import org.nestframework.commons.utils.EncodeUtil;
import org.nestframework.commons.utils.StringUtil;
import org.nestframework.core.BeanContext;

/**
 * 修改密码
 * @author wanghai
 *
 */
public class ChangePasswordAction  extends BaseAction{

	public String oldPassword;
	public String newPassword;
	public String confirmPassword;
	public Integer isClick;
	
	@Spring
//	private ILoginInfoManager loginInfoManager;
	
	@DefaultAction
	public Object show(HttpServletRequest req,HttpServletResponse response){
		if(userDto==null)
			return toLoginPage();
		return "change_password.jsp";
	}
	
	/**
	 * 保存密码
	 * @return
	 */
	public Object doSave(HttpServletRequest req,HttpServletResponse response,BeanContext bc){
		if(userDto==null)
		{
			return toLoginPage();
		}
		//判断旧密码是否为空
		if(StringUtil.isEmpty(oldPassword))
		{
			error = bc.getLocaleMessage("no_input_oldpassword");
			return "change_password.jsp";
		}
		//判断新密码是否为空
		if(StringUtil.isEmpty(newPassword))
		{
			error = bc.getLocaleMessage("no_input_newpassword");
			return "change_password.jsp";
		}
		if(StringUtil.isEmpty(confirmPassword))
		{
			error = bc.getLocaleMessage("no_input_confirmpassword");
			return "change_password.jsp";
		}
		//比较旧密码是否正确
		String pwd=userDto.getLoginPwd();
		String tmpPassword = EncodeUtil.md5(oldPassword);
		if(tmpPassword.equals(pwd))
		{
			if(!EncodeUtil.md5(newPassword).equals(EncodeUtil.md5("123456"))){
				if(newPassword.equals(confirmPassword))
				{
					//修改密码
				/*	LoginInfo loginInfo = loginInfoManager.get(userDto.getLoginId());
					try{
						loginInfo.setLoginPwd(EncodeUtil.md5(newPassword));
						loginInfoManager.save(loginInfo);
						userDto.setLoginPwd(loginInfo.getLoginPwd());
						req.getSession().setAttribute(Constant.KEY_LOGIN_USER, userDto);
						message=bc.getLocaleMessage("change_password_success");
					}catch(Exception e){
						error=bc.getLocaleMessage("change_password_failure");
					}*/
				}
				else
				{
					error = bc.getLocaleMessage("newPassword_not_equal_confirmPassword");
				}
			}else{
				error = "密码不能设置为初始密码，请重新输入";
			}
		}
		else
		{
			error = bc.getLocaleMessage("oldPassword_invalid");
		}
		
		if(isClick != null){
			return "change_password.jsp";
		}else{
			return new Redirect("index.jsp");
		}
	}
}
