package com.becom.acrs.service;

import java.io.Serializable;

import org.nestframework.commons.hibernate.IHibernateManager;

public interface IRootManager<T, K extends Serializable> extends IHibernateManager<T, K> {

}