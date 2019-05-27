package com.becom.acrs.webapp.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;

public class CheckDateUtil {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(CheckDateUtil.class);
	
	public boolean checkDateFormat(String dateStr, String pattern)
	{
		boolean ret = false;
		try
		{
			//У�����ڸ�ʽ�Ƿ�Ϸ�
			SimpleDateFormat sdf = new SimpleDateFormat(pattern);
			Date d=sdf.parse(dateStr);
			return sdf.format(d).equals(dateStr);
		}
		catch (Exception ex)
		{
			logger.warn(ex.getMessage() + ex.fillInStackTrace());
			//������
		}
		return ret;
	}	
}
