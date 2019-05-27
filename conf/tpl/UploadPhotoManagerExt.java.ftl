package ${hss_base_package}.service.ext.impl;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.log4j.Logger;
import org.nestframework.action.FileItem;

import ${hss_base_package}.exception.LoadUpPhotoException;
import ${hss_base_package}.service.ISysParameterManager;
import ${hss_base_package}.service.ext.IUploadPhotoManagerExt;

public class UploadPhotoManagerExt implements IUploadPhotoManagerExt {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger
			.getLogger(UploadPhotoManagerExt.class);
	
	private ISysParameterManager sysParameterManager;
	
	/**
	 * ��֤��Ƭ������.
	 * 
	 * @return Map<String, String>.
	 */
	public Map<String, String> checkPhoto(FileItem fileItem, String minphotosize,
			String photosize,String photopattern) {
		Map<String, String> ret = new HashMap<String, String>();
		String isValid = "true";
		String msg = "";
		if (fileItem != null && fileItem.getFileName() != null) {
			long filesize = fileItem.getSize();
			if (minphotosize!=null && (filesize / 1024) < new Long(minphotosize)) {
				isValid = "false";
				msg = "�Բ������ṩ����Ƭ�ߴ�С��" + minphotosize + "KB���޷��ϴ��������ṩ�ߴ���"+minphotosize+"��"+photosize+"KB֮�����Ƭ��";
			}
			else if (photosize!=null && (filesize / 1024) > new Long(photosize)) {
				isValid = "false";
				msg = "�Բ������ṩ����Ƭ�ߴ����" + photosize + "KB���޷��ϴ��������ṩ�ߴ���"+minphotosize+"��"+photosize+"KB֮�����Ƭ��";
			}
		}
		if (fileItem != null && fileItem.getFileName() != null) {
			String fileName = fileItem.getFileName();
			// ��Ƭ�ļ�����չ��
			if (photopattern.indexOf(getExtName(fileName)) < 0) {
				isValid = "false";
				msg = "�Բ������ṩ����Ƭ��ʽ���ԣ��޷��ϴ��������ṩ"+ photopattern +"��ʽ����Ƭ�ļ���";
			}
		}
		ret.put("isValid", isValid);
		ret.put("msg", msg);
		return ret;
	}
	/**
	 * ��ȡ�ļ���չ��
	 * @param filename
	 * @return
	 */
	private String getExtName(String filename)
	{
		String extName = "";
		if(filename != null)
		{
			extName = filename.substring(filename.lastIndexOf(".")+1);
		}
		return extName;
	}
	
	public String savePhoto(File photoFile, String oldPhotoPath,
			String photoDirInPar,String generatePath) {
		try {
			String filePath = "";
			// ��ȡͼƬ�洢Ŀ¼.
			String photoDir = sysParameterManager.getParamValue(photoDirInPar);
			if (logger.isDebugEnabled())
			{
				logger.info("����Ƭ��·��photoDir="+photoDir);
			}
			if (photoFile != null && photoFile.getName() != null) {
				String absolutePath = "";
				// ɾ����ǰ����Ƭ
				if (null != oldPhotoPath && !"".equals(oldPhotoPath)) {
					absolutePath = photoDir + oldPhotoPath;

					try {
						File tempFile = new File(absolutePath);
						if (tempFile.exists()) {
							tempFile.delete();
						}
					} catch (Exception e) {
						throw new LoadUpPhotoException(e);
					}
				}

				filePath = photoDir + File.separator + generatePath;
				File file = new File(filePath);
				File parent = file.getParentFile();
				
				if (!parent.exists())
				{
					parent.mkdirs();
				}
				
				BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(file));
		        BufferedInputStream   in = new BufferedInputStream(new FileInputStream(photoFile));

		        int b;
		        while ((b = in.read()) != -1) {
		            out.write(b);
		        }

		        in.close();
		        out.close();
		        
				filePath = generatePath;
				if (logger.isDebugEnabled())
				{
					logger.info(filePath);
				}
			}
			return filePath;

		} catch (FileNotFoundException e) {

			logger.error(e.getMessage() + e.fillInStackTrace());

		} catch (IOException ioe) {
			logger.error(ioe.getMessage() + ioe.fillInStackTrace());
		} catch(Exception ep)
		{
			logger.error("������Ƭ�쳣", ep);
		}
		return null;
	}
	
	/**
	 * ������Ƭ���ļ�ϵͳ
	 * 
	 * @param photo
	 *            ��Ƭ����.
	 * @param oldPhotoPath
	 *            ԭ����Ƭ��·��.
	 * @return String ��Ƭ�����·��.
	 */
	public String savePhoto(FileItem photo, String oldPhotoPath,
			String photoDirInPar, String generatePath) throws LoadUpPhotoException {

		try {
			String filePath = "";
			// ��ȡͼƬ�洢Ŀ¼.
			String photoDir = sysParameterManager.getParamValue(photoDirInPar);
			if (logger.isDebugEnabled())
			{
				logger.info("����Ƭ��·��photoDir="+photoDir);
			}
			if (photo != null && photo.getFileName() != null) {
				String absolutePath = "";
				// ɾ����ǰ����Ƭ
				if (null != oldPhotoPath && !"".equals(oldPhotoPath)) {
					absolutePath = photoDir + oldPhotoPath;

					try {
						File tempFile = new File(absolutePath);
						if (tempFile.exists()) {
							tempFile.delete();
						}
					} catch (Exception e) {
						throw new LoadUpPhotoException(e);
					}
				}

				filePath = photoDir + File.separator + generatePath;
				File file = new File(filePath);
				
				photo.save(file);
				
				filePath = generatePath;
				if (logger.isDebugEnabled()) {
					logger.info(filePath);
				}
			}
			return filePath;

		} catch (FileNotFoundException e) {

			logger.error(e.getMessage() + e.fillInStackTrace());

		} catch (IOException ioe) {
			logger.error(ioe.getMessage() + ioe.fillInStackTrace());
		} catch(Exception ep)
		{
			logger.error("������Ƭ�쳣", ep);
		}
		return null;
	}
	
	public String loadPhotoRootPath(String photo_url_prefix,String PhotoPath) {
		if(null==PhotoPath || PhotoPath.equals(""))
		{
			return "";
		}		
		// ��ȡ����ͼƬ�洢Ŀ¼.
		String mapUrlPrefix = sysParameterManager.getParamValue(photo_url_prefix);	
		if(!mapUrlPrefix.endsWith("/"))
		{
			mapUrlPrefix = mapUrlPrefix + "/";
		}
		// ������ϴ���
		return mapUrlPrefix+PhotoPath;		
	}
}
