package com.becom.acrs.service.impl;
// Generated 2016-11-8 16:58:38 by Hibernate Tools 3.2.0.CR1 with nest-tools


import java.io.Serializable;
import com.becom.acrs.service.IBaseManager;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.nestframework.commons.hibernate.QueryWrap;
import org.springframework.orm.hibernate3.HibernateCallback;

@SuppressWarnings("unchecked")
public abstract class BaseManager<T, K extends Serializable> extends RootManager<T, K> implements IBaseManager<T, K> {
	private Class<T> entityClass;
	
	public String currentDateSql="getCurrentDateOfDatabase";
	
	public BaseManager() {
		entityClass = getGenericClass(getClass());
	}

	public void setEntityClass(Class<T> entityClass) {
		this.entityClass = entityClass;
	}

	public void save(T instance) {
		getHibernateTemplate().saveOrUpdate(instance);
	}

	public List<T> findAll() {
		return getHibernateTemplate().loadAll(entityClass);
	}

	public T get(K id) {
		return (T) getHibernateTemplate().get(entityClass, id);
	}
	
	public void remove(T instance) {
		getHibernateTemplate().delete(instance);
	}

	public void removeById(K id) {
		getHibernateTemplate().delete(get(id));
	}

	public List<T> findByExample(T instance) {
		return getHibernateTemplate().findByExample(instance);
	}

	public List<T> findByExample(T instance, int firstResult, int maxResults) {
		return getHibernateTemplate().findByExample(instance, firstResult,
				maxResults);
	}
	
	public Date getCurrentDateOfDatabase() {
		Date currentDate = (Date)getHibernateTemplate().execute(new HibernateCallback(){
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {				
				try
				{
					Query query = session.createSQLQuery(_("getCurrentDateOfDatabase"));
					return query.uniqueResult();
				}
				catch (Exception ex)
				{
				}
				return null;
			}
		});
		return currentDate;
	}

}
