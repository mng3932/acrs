package ${hss_base_package}.webapp.action;
 
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.nestframework.addons.spring.Spring;
import org.nestframework.annotation.DefaultAction;
import org.nestframework.commons.utils.StringUtil;
import org.nestframework.core.BeanContext;
import org.nestframework.data.Json;

import ${hss_base_package}.service.ext.IMenuManagerExt;
import ${hss_base_package}.dto.ZTreeNode;

/**
 * 处理菜单显示的Action
 */
public class MenuAction extends BaseAction{
	
	//节点id
	public String node;

	@Spring
	public IMenuManagerExt menuManagerExt;
	
	public List<ZTreeNode> rs = new ArrayList<ZTreeNode>();
		
	@DefaultAction
	@Json
	public Object showMenu(HttpServletRequest request, HttpSession session, BeanContext bc) {
		if (userDto == null)
		{
			return rs;
		}
		
		/*根据用户id获取菜单 */
		rs = menuManagerExt.getMenuByLoginId(userDto.getLoginId());
    	String ctx=request.getContextPath();
    	if(ctx.equals("/"))
    		ctx="";
    	if (rs != null && rs.size() > 0)
        {
            for (ZTreeNode znode : rs)
            {
            	if(StringUtil.isNotEmpty(znode.getUrl()))
            		znode.setUrl(ctx+znode.getUrl());
            }
        }
    	return rs;
	}
	
	
}
