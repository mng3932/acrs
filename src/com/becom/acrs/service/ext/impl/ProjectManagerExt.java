package com.becom.acrs.service.ext.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.nestframework.commons.hibernate.IPage;
import org.nestframework.commons.hibernate.IRowHandler;
import org.nestframework.commons.hibernate.ISqlElement;
import org.springframework.jdbc.core.RowMapper;

import com.becom.acrs.model.ProjectManager;
import com.becom.acrs.service.ext.IProjectManagerExt;

public class ProjectManagerExt extends JdbcRootManager implements IProjectManagerExt {
	
	/**
	 * 查询列表以及模糊查
	 */
	@SuppressWarnings("unchecked")
	public List<ProjectManager> findAllProjectManager(String projectname,
			String modulename, String modifyperson,Date modifytime){
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("projectname", projectname);
		params.put("modulename", modulename);
		params.put("modifyperson", modifyperson);
		params.put("modifytime", modifytime);
		List<ProjectManager> list=null;
		try {
			
			ISqlElement se = this.processSql(params,
			"ProjectManagerExt.findAllProjectManager.query");
			list = this.getJdbcTemplate().query(se.getSql(), se.getParams(),
			new RowMapper() {
				public Object mapRow(ResultSet rs, int arg1)
						throws SQLException {
					ProjectManager znode = new ProjectManager();
                    znode.setId(rs.getInt("id"));
                    znode.setProjectname(rs.getString("projectname"));
                    znode.setModulename(rs.getString("modulename"));
                    znode.setModifycontent(rs.getString("modifycontent"));
                    znode.setModifytime(rs.getDate("modifytime"));
                    znode.setModifyperson(rs.getString("modifyperson"));
                    znode.setRemarks(rs.getString("remarks"));
                    znode.setEnclosure(rs.getString("enclosure"));
					return znode;
				}
			});
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	/**
	 * 查询一条数据
	 */
	@SuppressWarnings("unchecked")
	public List<ProjectManager> flinListById(Integer id) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("proId", id);
		List<ProjectManager> list=null;
		try {
			ISqlElement se = this.processSql(params,
			"ProjectManagerExt.flinListById.query");
			list = this.getJdbcTemplate().query(se.getSql(), se.getParams(),
			new RowMapper() {
				public Object mapRow(ResultSet rs, int arg1)
						throws SQLException {
					ProjectManager znode = new ProjectManager();
                    znode.setId(rs.getInt("id"));
                    znode.setProjectname(rs.getString("projectname"));
                    znode.setModulename(rs.getString("modulename"));
                    znode.setModifycontent(rs.getString("modifycontent"));
                    znode.setModifytime(rs.getDate("modifytime"));
                    znode.setModifyperson(rs.getString("modifyperson"));
                    znode.setRemarks(rs.getString("remarks"));
                    znode.setEnclosure(rs.getString("enclosure"));
                    znode.setEnclosureurl(rs.getString("enclosureurl"));
					return znode;
				}
			});
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

}
