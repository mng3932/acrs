/**
 * 
 */
package ${hss_base_package}.webapp.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.log4j.Logger;
import org.nestframework.commons.utils.StringUtil;
import org.springframework.web.context.support.WebApplicationContextUtils;

import ${hss_base_package}.webapp.util.InitDictionUtil;



/**
 * ¸ù¾Ý×ÖµäidÏÔÊ¾×ÖµäÖµ.
 * 
 * @author
 * 
 */
@SuppressWarnings("serial")
public class DispDictName extends TagSupport {
	/**
	 * Logger.
	 */
	private final static Logger log = Logger.getLogger(DispDictName.class);

	/**
	 * ×Öµä±àºÅ
	 */
	private String dictid;

	/**
	 * @return the dictid
	 */
	public String getDictid() {
		return dictid;
	}

	/**
	 * @param dictid
	 *            the dictid to set
	 */
	public void setDictid(String dictid) {
		this.dictid = dictid;
	}
	
	private String splits;
	

	public String getSplits() {
		return splits;
	}

	public void setSplits(String splits) {
		this.splits = splits;
	}

	/**
     * ÊÇ·ñÏÔÊ¾¼ò³Æ¡£
     */
	private boolean blnShort;
	
	public int doEndTag() throws JspException {

		if (StringUtil.isNotEmpty(dictid)) {
			try {
				JspWriter out = pageContext.getOut();
				InitDictionUtil initDictionUtil = (InitDictionUtil) WebApplicationContextUtils
				.getWebApplicationContext(
						this.pageContext.getServletContext()).getBean(
						"initDictionUtil");
				String[] ids=dictid.split(StringUtil.isEmpty(splits)?";":splits);
				String dictName="";
				for(int i=0;i<ids.length;i++) {
					String id=ids[i];
					if(StringUtil.isNotEmpty(id)) {
						if(StringUtil.isNotEmpty(dictName))
							dictName+=StringUtil.isEmpty(splits)?"&nbsp;&nbsp;":splits;
						dictName += initDictionUtil.getDictNameByDictId(id);
					}
				}
				out.print(dictName);
			} catch (IOException e) {
				log.error("DispDictName--ÏÔÊ¾×ÖµäÖµ³ö´í£¡", e);
			}
		}
		return SKIP_BODY;
	}

	public int doStartTag() throws JspException {
		return SKIP_BODY;
	}

	public boolean isBlnShort() {
		return blnShort;
	}

	public void setBlnShort(boolean blnShort) {
		this.blnShort = blnShort;
	}

}
