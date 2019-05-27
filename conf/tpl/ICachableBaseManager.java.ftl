/**
 * 
 */
package ${hss_service_package};

import java.io.Serializable;

/**
 * �ɻ������ݵ�Manager����ӿ�.
 * 
 * @author audin
 * 
 */
public interface ICachableBaseManager<T, K extends Serializable> {
	/**
	 * ����ʵ�������ȡ��ʶ��.
	 * 
	 * @param instance
	 *            ʵ������.
	 * @return ��ʶ��.
	 */
	public K getKey(T instance);

	/**
	 * ɾ��ȫ������.
	 */
	public void clearCache();

	/**
	 * ɾ��ָ���Ļ���.
	 * 
	 * @param id
	 *            ��ʶ��.
	 */
	public void clearCache(K id);
}
