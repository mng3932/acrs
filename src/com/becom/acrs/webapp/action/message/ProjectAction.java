package com.becom.acrs.webapp.action.message;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.nestframework.action.DownloadItem;
import org.nestframework.action.FileItem;
import org.nestframework.addons.spring.Spring;
import org.nestframework.annotation.DefaultAction;

import com.becom.acrs.model.ProjectManager;
import com.becom.acrs.service.IProjectManagerManager;
import com.becom.acrs.service.ext.IProjectManagerExt;

public class ProjectAction {
	
	@Spring
	private IProjectManagerExt projectManagerExt;
	
	@Spring
	private IProjectManagerManager projectManagerManager;
	
	public List<ProjectManager> list=new ArrayList<ProjectManager>();
	
	private List<String> attachFilesFileName = new ArrayList<String>();
	
	private static final String ATTACH_FILE_PATH = "d:/attachFiles/";
	
	public Integer[] id;//id
	public String projectname;//��Ŀ����
	public String modulename;//ģ������
	public String modifycontent;//�޸�����
	public Date modifytime;//�޸�ʱ��
	public String modifyperson;//�޸���
	public String remarks;//��ע
	public Integer proId;
	public FileItem attachFiles;
	
	
	
	/**
	 * ���
	 * @param request
	 * @return
	 */
	public Object doSave(HttpServletRequest request ){
		
		ProjectManager pm=new ProjectManager();
		
		if (null!=proId) {
			pm.setId(proId);
		}
		
		//==========================�ϴ�����������Ŀ�ʼ=====================================

		if (attachFiles != null && attachFiles.isUploaded()){
			try {
				attachFiles.save(new File(ATTACH_FILE_PATH, attachFiles.getFileName()));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		pm.setEnclosure(attachFiles.getFileName());
		pm.setEnclosureurl(ATTACH_FILE_PATH+attachFiles.getFileName());
		//==========================�ϴ�����������Ľ���=====================================
	
		pm.setProjectname(projectname);
		pm.setModulename(modulename);
		pm.setModifytime(new Date());
		pm.setModifycontent(modifycontent);
		pm.setModifyperson(modifyperson);
		pm.setRemarks(remarks);
	
		try {
			projectManagerManager.save(pm);
		} catch (RuntimeException e) {
			e.printStackTrace();
		}
		System.out.println("----------"+ ATTACH_FILE_PATH+attachFiles.getFileName()+"----------"); 
//		}
		return method(request);
	
	}
	/**
	 * ��ѯ
	 * @param request
	 * @return
	 */
	@DefaultAction
	public Object method(HttpServletRequest request){
		
		ProjectManager pm=new ProjectManager();
		
		//��ѯ
		list = projectManagerExt.findAllProjectManager(projectname, modulename, modifyperson,modifytime);
		
		if( "1".equals(pm.getAjaxFlag())){
			return "/message/TestListPage.jsp";
		}else{
			return "/message/TestList.jsp";
		}
    	
	}
	
	/**
	 * ɾ��
	 * @param response
	 * @param request
	 * @return
	 */
	public Object delete(HttpServletResponse response,HttpServletRequest request){
		
		for (int i = 0; i < id.length; i++) {
			
			projectManagerManager.removeById(id[i]);
			
		}
		
		return method(request);

	}
	
	/**x
	 * ��ѯһ������
	 * @param request
	 * @return
	 */
	public Object flinListById(HttpServletRequest request){
		
		list = projectManagerExt.flinListById(id[0]);
		
		return "/message/updateTest.jsp";
		
	}
	
	/**
	 * ��������
	 * @param session
	 * @return
	 */
	public Object dl(HttpSession session){
		list = projectManagerExt.flinListById(id[0]);
		ProjectManager prj = list.get(0);
		String filePath = prj.getEnclosureurl();//�����ݿ��ȡ�ļ�·��(D:/data/uploadfile)
		return new DownloadItem(new File(filePath));
	}


	public List<ProjectManager> getList() {
		return list;
	}

	public void setList(List<ProjectManager> list) {
		this.list = list;
	}
	public List<String> getAttachFilesFileName() {
		return attachFilesFileName;
	}
	public void setAttachFilesFileName(List<String> attachFilesFileName) {
		this.attachFilesFileName = attachFilesFileName;
	}
}
