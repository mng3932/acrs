package com.becom.acrs.service.ext.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.jdbc.core.RowMapper;

import com.becom.acrs.dto.ZTreeNode;
import com.becom.acrs.service.ext.IMenuManagerExt;

public class MenuManagerExt extends JdbcRootManager implements IMenuManagerExt {
	/**
	 * Logger for this class
	 */
	private static final Log logger = LogFactory
			.getLog(MenuManagerExt.class);
	/**
	 * 根据用户Id 获取菜单
	 * @param loginId
	 * @return
	 */
	public List<ZTreeNode> getMenuByLoginId(Integer loginId) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("loginId", loginId);	
		try
		{
			return findList("MenuManagerExt.getMenuByLoginId.query", params, new RowMapper(){
				public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
                    ZTreeNode znode = new ZTreeNode();
                    znode.setId(rs.getString("id"));
                    znode.setpId(rs.getString("pId"));
                    znode.setName(rs.getString("name"));
                    znode.setUrl(rs.getString("url"));
					return znode;
				}
			});
		}
		catch (Exception ex)
		{
			logger.error(ex.getMessage() + ";" + ex.fillInStackTrace());
			return null;
		}
	}
}
