/**
 * �������ݵ�Excel�ļ�
 */
package com.becom.acrs.webapp.action;


/**
 * @author wanghai
 * 
 */
public class ExportAction extends BaseAction {
//	@Spring("excelExportSupport")
//	protected IExportSupport exportSupport;

	/**
	 * ����ģ�嵼���ļ�
	 */
/*	protected Object exportExcelByTemplate(ExportExcelParameter para,String filename, HttpServletResponse res,
			HttpSession session,List<AssignedCell[]> data){
		try {
			res.setContentType("APPLICATION/ms-excel");
			res.setHeader("Content-Disposition", "attachment; filename="
					+ new String(filename.getBytes("gbk"), "iso8859-1"));
			ServletOutputStream os = res.getOutputStream();
			exportSupport.export(para,os,session, data);
			os.flush();
			os.close();
			return null;
		} catch (Exception e) {
			throw new ManagerException("��������", e);
		}

	}*/

	/**
	 * ����ģ�嵼���ļ�,֧�ֶ��sheet�ĵ����ļ�
	 */
/*	protected Object exportExcelByTemplate(ExportExcelParameter para,String filename, HttpServletResponse res,
			HttpSession session){
		try {
			res.setContentType("APPLICATION/ms-excel");
			res.setHeader("Content-Disposition", "attachment; filename="
					+ new String(filename.getBytes("gbk"), "iso8859-1"));
			ServletOutputStream os = res.getOutputStream();
			exportSupport.export(para,os,session);
			os.flush();
			os.close();
			return null;
		} catch (Exception e) {
			throw new ManagerException("��������", e);
		}

	}*/

}
