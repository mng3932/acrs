/**
 * 
 */
package ${hss_service_package}.impl;

import java.io.Serializable;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 
 * @author audin
 *
 * @param <T> ʵ������
 * @param <K> ��������
 * @param <D> �ֵ����͵���������
 */
public abstract class AbstractDictManager<T, K extends Serializable, D extends Serializable> extends CachableBaseManager<T, K> {
	
	private Map<D, List<T>> listCache = Collections.synchronizedMap(new HashMap<D, List<T>>());
	
	/**
	 * ��ȡ��ʾ�ֵ����͵�������.
	 * @return
	 */
	protected abstract String getDictTypePropertyName();

	@Override
	public void clearCache() {
		super.clearCache();
		listCache.clear();
	}
	
	/**
	 * �����ֵ����ͻ�ȡ�ֵ�����б�.
	 * 
	 * @param dictType �ֵ�����.
	 * @param useCache �Ƿ�ʹ�û���.
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<T> getDictsByType(D dictType, boolean useCache) {
		List<T> list = null;
		if (useCache) {
			list = listCache.get(dictType);
		}
		if (list == null) {
			list = getHibernateTemplate().find(
				"from " + getGenericClass(getClass()).getSimpleName() + " where "
						+ getDictTypePropertyName() + "=?", dictType);
			listCache.put(dictType, list);
		}
		
		return list;
	}
	
	/**
	 * �����ֵ����ͻ�ȡ�ֵ�����б�(��ʹ�û���).
	 * 
	 * @param dictType �ֵ�����.
	 * @return
	 */
	public List<T> getDictsByType(D dictType) {
		return getDictsByType(dictType, false);
	}
}
