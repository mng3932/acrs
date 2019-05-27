package com.becom.acrs.model;


import java.util.Date;
public class ProjectManager  {

	 //id
     private Integer id;
     
     //项目名称
     private String projectname;
     
     //模块名称
     private String modulename;
     
     //修改内容
     private String modifycontent;
     
     //修改时间
     private Date modifytime;
     
     //修改人
     private String modifyperson;
     
     //备注
     private String remarks;
     
     //附件
     private String enclosure;
     
     //附件路径		
     private String enclosureurl;
     
     //ajax异步标示
 	 private String ajaxFlag;
     
     
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getProjectname() {
		return projectname;
	}

	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}

	public String getModulename() {
		return modulename;
	}

	public void setModulename(String modulename) {
		this.modulename = modulename;
	}

	public String getModifycontent() {
		return modifycontent;
	}

	public void setModifycontent(String modifycontent) {
		this.modifycontent = modifycontent;
	}

	public Date getModifytime() {
		return modifytime;
	}

	public void setModifytime(Date modifytime) {
		this.modifytime = modifytime;
	}

	public String getModifyperson() {
		return modifyperson;
	}

	public void setModifyperson(String modifyperson) {
		this.modifyperson = modifyperson;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getEnclosure() {
		return enclosure;
	}

	public void setEnclosure(String enclosure) {
		this.enclosure = enclosure;
	}

	public String getAjaxFlag() {
		return ajaxFlag;
	}

	public void setAjaxFlag(String ajaxFlag) {
		this.ajaxFlag = ajaxFlag;
	}

	public String getEnclosureurl() {
		return enclosureurl;
	}

	public void setEnclosureurl(String enclosureurl) {
		this.enclosureurl = enclosureurl;
	}


}


