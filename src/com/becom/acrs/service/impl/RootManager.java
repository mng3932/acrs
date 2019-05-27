package com.becom.acrs.service.impl;

import java.io.Serializable;

import org.nestframework.commons.hibernate.HibernateManagerSupport;

import com.becom.acrs.service.IRootManager;

public abstract class RootManager<T, K extends Serializable> extends HibernateManagerSupport<T, K> implements IRootManager<T, K> {

}