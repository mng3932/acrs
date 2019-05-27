package ${hss_base_package}.service.ext;

import java.io.File;
import java.util.Map;

import org.nestframework.action.FileItem;

public interface IUploadPhotoManagerExt {
	/**
	 * ��֤��Ƭ������.
	 * 
	 * @return Map<String, String>.
	 */
	public Map<String, String> checkPhoto(FileItem fileItem, String minphotosize,
			String photosize,String photopattern);

	/**
	 * ������Ƭ���ļ�ϵͳ
	 * 
	 * @param photo
	 *            ��Ƭ�ļ�.
	 * @param oldPhotoPath
	 *            ԭ����Ƭ��·��.
	 * @return String ��Ƭ�����·��.
	 */
	public String savePhoto(File photoFile, String oldPhotoPath,
			String photoDirInPar,String generatePath);
	
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
			String photoDirInPar,String generatePath);
	
	/**
	 * ������Ƭurl
	 * @param sc
	 * @param photo_url_prefix
	 * @param PhotoPath
	 * @return
	 */
	public String loadPhotoRootPath(String photo_url_prefix,String PhotoPath);
}
