package ${hss_base_package}.webapp.tag;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;

import org.apache.log4j.Logger;
import org.nestframework.commons.utils.StringUtil;
import org.springframework.web.context.support.WebApplicationContextUtils;

import ${hss_base_package}.model.SysDict;
import ${hss_base_package}.webapp.util.InitDictionUtil;



/**
 * 根据数据字典类型得到数据字典名称下拉列表.
 * 
 * @author
 * @version 1.0.0
 */
@SuppressWarnings("serial")
public class DictSelect extends AbstractTagSupport {

	/*
	 * (non-Javadoc)
	 * 
	 * @see javax.servlet.jsp.tagext.TagSupport#doEndTag()
	 */
	@Override
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
				if (null != dicts && !dicts.isEmpty()) {
					for (SysDict bd : dicts) {
						String sdata = bd.getDictId().toString();
						if(StringUtil.isNotEmpty(removeOfIds)
								&& removeOfIds.indexOf(sdata) >= 0){
							continue;
						}
						String name = bd.getDictName();
					     if (StringUtil.isNotEmpty(selectValue)
									&& sdata.equals(selectValue)) {
								matched = true;
							} else {
								matched = false;
							}
					        if(ifDisplayDictCode)
					        {
					        	addOption(sb, sdata, bd.getDictCode()+" "+name, matched);
					        }
					        else
					        {
					        	addOption(sb, sdata, name, matched);
					        }
					}

				}
			}
			out.println(sb.toString());
		} catch (IOException e) {
			LOG.error("DictSelect--显示字典值下拉列表出错！", e);
		}
		return SKIP_BODY;
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

	/**
	 * 数据字典类型.
	 */
	private String dictType;
    /**
     * 是否显示简称。
     */
	private boolean blnShort;
	/**
	 * 下拉框默认的选中值
	 */
	private String selectValue = "";
	/**
	 * 是否显示字典代码
	 */
	private boolean ifDisplayDictCode;

	/**
	 * @return the selectValue
	 */
	public String getSelectValue() {
		return selectValue;
	}
	/**
	 * 不在列表中的
	 */
	private String removeOfIds;

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

	public boolean getIfDisplayDictCode() {
		return ifDisplayDictCode;
	}

	public void setIfDisplayDictCode(boolean ifDisplayDictCode) {
		this.ifDisplayDictCode = ifDisplayDictCode;
	}

	public boolean isBlnShort() {
		return blnShort;
	}

	public void setBlnShort(boolean blnShort) {
		this.blnShort = blnShort;
	}

	public String getRemoveOfIds() {
		return removeOfIds;
	}

	public void setRemoveOfIds(String removeOfIds) {
		this.removeOfIds = removeOfIds;
	}	
}
