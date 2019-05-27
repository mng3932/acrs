/**
 * 导出数据到Excel文件
 */
package ${hss_base_package}.webapp.action;

import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.nestframework.addons.spring.Spring;

import org.nestframework.exporter.dto.AssignedCell;
import org.nestframework.exporter.dto.ExportExcelParameter;
import org.nestframework.exporter.exception.ManagerException;
import org.nestframework.exporter.service.IExportSupport;

/**
 * @author wanghai
 * 
 */
public class ExportAction extends BaseAction {
	@Spring("excelExportSupport")
	protected IExportSupport exportSupport;

	/**
	 * 根据模板导出文件
	 */
	protected Object exportExcelByTemplate(ExportExcelParameter para,String filename, HttpServletResponse res,
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
			throw new ManagerException("导出出错。", e);
		}

	}

	/**
	 * 根据模板导出文件,支持多个sheet的导出文件
	 */
	protected Object exportExcelByTemplate(ExportExcelParameter para,String filename, HttpServletResponse res,
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
			throw new ManagerException("导出出错。", e);
		}

	}

}
