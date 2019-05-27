package com.becom.acrs.service.ext;

import java.util.Date;
import java.util.List;

import com.becom.acrs.model.ProjectManager;

public interface IProjectManagerExt {
	
	/**
	 * 查询以及模糊查
	 * @param projectname
	 * @param modulename
	 * @param modifyperson
	 * @param modifytime
	 * @return
	 */
	public List<ProjectManager> findAllProjectManager(String projectname,
			String modulename, String modifyperson, Date modifytime);
	
	/**
	 * 查询一条数据
	 * @param id
	 * @return
	 */
	public List<ProjectManager> flinListById(Integer id);


	
}
