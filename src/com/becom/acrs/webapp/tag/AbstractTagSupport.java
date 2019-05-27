/**
 * 
 */
package com.becom.acrs.webapp.tag;
 
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.log4j.Logger;

/**
 * Tag������.
 * @author spoon
 *
 */
@SuppressWarnings("serial")
public abstract class AbstractTagSupport extends TagSupport
{
    /**
     * Logger.
     */
    protected final static Logger LOG = Logger.getLogger(AbstractTagSupport.class);
    
    /**
     * 
     * ҳ�����������б��ű�.
     * @param sb
     * @param value ������ֵ.
     * @param text ��������ʾ�ı�.
     * @param matched �Ƿ�ѡ��.
     */
    protected void addOption(StringBuffer sb,String value,String text,boolean matched)
    {
        sb.append("<option value=\"");
        sb.append(value);
        sb.append("\"");
        if (matched)
        {
            sb.append(" selected=\"selected\"");
        }
        sb.append("title=\"");
        sb.append(text);
        sb.append("\"");
        sb.append(">");
        if(text.length()>20)
        {
        	sb.append(text.substring(0, 20));
        }
        else
        {
        	sb.append(text);
        }
        sb.append("</option>\r\n");
    }
}
