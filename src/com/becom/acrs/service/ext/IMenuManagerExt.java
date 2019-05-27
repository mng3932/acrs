package com.becom.acrs.service.ext;

import java.util.List;

import com.becom.acrs.dto.ZTreeNode;
 
public interface IMenuManagerExt {

	/**
	 * �����û�Id ��ȡ�˵�
	 * @param userId
	 * @return List<ZTreeNode>
	 */
	public List<ZTreeNode> getMenuByLoginId(Integer loginId);

}
