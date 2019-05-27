package com.becom.acrs.service;
// Generated 2016-11-8 16:58:38 by Hibernate Tools 3.2.0.CR1 with nest-tools


import java.io.Serializable;
import java.util.Date;
import java.util.List;

public interface IBaseManager<T, K extends Serializable> extends IRootManager<T, K> {
	public T get(K id);
	
	//Ìí¼Ó
	public void save(T instance);
	
	public void remove(T instance);
	//É¾³ý
	public void removeById(K id);
	public List<T> findAll();
	public List<T> findByExample(T instance);
	public List<T> findByExample(T instance, int firstResult, int maxResults);
	
	public Date getCurrentDateOfDatabase(); 
}
