package com.becom.acrs.webapp.tag;

import javax.servlet.jsp.JspException;

import org.apache.log4j.Logger;
import org.nestframework.commons.utils.StringUtil;

/**
 * 根据数据字典类型得到数据字典名称复选框列表.
 * @author
 * @version 1.0.0
 */
@SuppressWarnings("serial")
public class DictCheckbox extends AbstractTagSupport {

	/*
	 * (non-Javadoc)
	 * 
	 * @see javax.servlet.jsp.tagext.TagSupport#doEndTag()
	 */
/*	@Override
	public int doEndTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			boolean matched = false;
			StringBuffer sb = new StringBuffer();
			if (StringUtil.isNotEmpty(dictType)) {
				InitDictionUtil initDictionUtil = (InitDictionUtil) WebApplicationContextUtils
						.getWebApplicationContext(
								this.pageContext.getServletContext()).getBean(
								"initDictionUtil");
				List<SysDict> dicts = initDictionUtil
						.getDictByDictType(new Integer(dictType));
				String[] values=new String[] {};
				
				if (StringUtil.isNotEmpty(selectValue)){
					values=selectValue.split(";");
				}
				if (null != dicts && !dicts.isEmpty()) {
					int i=1;
					for (SysDict bd : dicts) {
						String sdata = bd.getDictId().toString();

						String dictname = bd.getDictName();
					    matched = false;
					    for(String value:values) {
					    	if(sdata.equals(value)) {
					    		matched=true;
					    		break;
					    	}
					    }
						addCheckbox(sb,i++, sdata, dictname, matched);
					}

				}
			}
			out.println(sb.toString());
		} catch (IOException e) {
			LOG.error("DictSelect--显示字典值复选框出错！", e);
		}
		return SKIP_BODY;
	}*/
	
	protected void addCheckbox(StringBuffer sb,int i,String value,String text,boolean matched)
    {
        sb.append("<input type=\"checkbox\"");
        if(StringUtil.isNotEmpty(id)) {
        	sb.append(" id=\"");
            sb.append(id+""+i);
            sb.append("\"");
        }
        if(StringUtil.isNotEmpty(name)) {
        	sb.append(" name=\"");
            sb.append(name);
            sb.append("\"");
        }
        sb.append(" value=\"");
        sb.append(value);
        sb.append("\"");
        if (matched)
        {
            sb.append(" checked ");
        }
        sb.append("/>");
        sb.append(text);
        if(i%rowcount==0)
        	sb.append("<br/>");
        else
        	sb.append("&nbsp;&nbsp;");
    }
	/*
	 * (non-Javadoc)
	 * 
	 * @see javax.servlet.jsp.tagext.TagSupport#doStartTag()
	 */
	@Override
	public int doStartTag() throws JspException {
		return SKIP_BODY;
	}

	/**
	 * Logger.
	 */
	private final static Logger LOG = Logger.getLogger(DictSelect.class);

	private String name;
	
	private String id;
	/**
	 * 数据字典类型.
	 */
	private String dictType;
    /**
	 * 默认值
	 */
	private String selectValue = "";
	
	private int rowcount=99;
	
	/**
	 * @return the selectValue
	 */
	public String getSelectValue() {
		return selectValue;
	}

	/**
	 * @param selectValue
	 *            the selectValue to set
	 */
	public void setSelectValue(String selectValue) {
		this.selectValue = selectValue;
	}

	/**
	 * @return the dictType
	 */
	public String getDictType() {
		return dictType;
	}
	
	/**
	 * @param dictType
	 *            the dictType to set
	 */
	public void setDictType(String dictType) {
		this.dictType = dictType;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getRowcount() {
		return rowcount;
	}

	public void setRowcount(int rowcount) {
		this.rowcount = rowcount;
	}
}
