package ${hss_base_package}.service.ext;

import java.util.List;

import ${hss_base_package}.dto.ZTreeNode;
 
public interface IMenuManagerExt {

	/**
	 * 根据用户Id 获取菜单
	 * @param userId
	 * @return List<ZTreeNode>
	 */
	public List<ZTreeNode> getMenuByLoginId(Integer loginId);

}
