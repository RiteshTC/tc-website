package com.topcoder.web.common.tag;

import com.topcoder.web.common.BaseProcessor;

import javax.servlet.jsp.JspException;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public class ErrorIteratorTag extends IteratorTag {

    private String name = null;

    public void setName(String name) {
        this.name = name;
    }

    public int doStartTag() throws JspException {
        HashMap errors = (HashMap) pageContext.getRequest().getAttribute(BaseProcessor.ERRORS_KEY);
        setCollection((List)errors.get(name));

        return super.doStartTag();
    }
}
