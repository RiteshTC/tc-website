package com.topcoder.web.query.bean;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.query.common.Authentication;
import com.topcoder.web.query.common.Constants;
import com.topcoder.web.query.common.LinkBean;
import com.topcoder.web.query.common.DatabaseBean;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @author Greg Paul
 * @author bigjake <kitz@mit.edu>
 *
 */

public abstract class BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(BaseTask.class);

    /* Holds the InitialContext of a request being processed by this task */
    private InitialContext ctx;

    /* Holds the next page to which the controller should forward after task processing */
    private String nextPage;

    /* Holds the path to the servlet that instantiated this task */
    private String servletPath;

    private HashMap errors;

    private List navLinks;

    private boolean internalResource;

    private Authentication authentication;

    /* Makes a new BaseTask */
    public BaseTask() {
        setInitialContext(null);
        setNextPage(null);
        setServletPath(null);
        errors = new HashMap();
        navLinks = new ArrayList();
        internalResource = true;
        authentication = null;
    }

    public abstract void process(String step) throws Exception;

    public void setInitialContext(InitialContext ctx) {
        this.ctx=ctx;
    }

    InitialContext getInitialContext() {
        return ctx;
    }

    void setNextPage(String nextPage) {
        this.nextPage=nextPage;
    }

    public String getNextPage() {
        return nextPage;
    }

    public String getServletPath() {
        return servletPath;
    }

    public void setServletPath(String servletPath) {
        this.servletPath = servletPath;
    }

    public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
         throws Exception {
        setAuthentication(Authentication.getAuthentication(request.getSession(true)));
    }

    public void servletPostAction(HttpServletRequest request, HttpServletResponse response)
        throws Exception {

    }

    public abstract void setAttributes(String paramName, String paramValues[]);

    public void addError(String key, Object error) {
        if (!hasError(key)) {
            errors.put(key, error);
        }
    }

    public String getError(String key) {
        if (errors.containsKey(key) && errors.get(key) != null) {
            return errors.get(key).toString();
        }
        return "";
    }

    public boolean hasError(String key) {
        return errors.containsKey(key);
    }

    public void removeError(String key) {
        if (hasError(key)) {
            errors.remove(key);
        }
    }

    public void clearErrors() {
        errors.clear();
    }

    public boolean hasErrors() {
        return errors.isEmpty();
    }

    public List getNavLinks() {
        return navLinks;
    }

    protected void setNavLinks(List navLinks) {
        this.navLinks = navLinks;
    }

    public List buildNavLinks(String servletPath, String db) {
        String begin = getServletPath()+"?"+Constants.TASK_PARAM+"=";
        String end = "&"+Constants.DB_PARAM+"="+db;
        ArrayList ret = new ArrayList();
        StringBuffer buf = new StringBuffer();

        buf.append(begin);
        buf.append(Constants.DB_SELECTION_TASK);
        ret.add(new LinkBean(buf.toString(), Constants.DB_SELECTION_NAME));
        buf.setLength(0);
        buf.append(begin);
        buf.append(Constants.COMMAND_LIST_TASK);
        buf.append(end);
        ret.add(new LinkBean(buf.toString(), Constants.COMMAND_LIST_NAME));
        buf.setLength(0);
        buf.append(begin);
        buf.append(Constants.MODIFY_COMMAND_TASK);
        buf.append(end);
        ret.add(new LinkBean(buf.toString(), "New Command"));
        buf.setLength(0);
        buf.append(begin);
        buf.append(Constants.MODIFY_GROUP_TASK);
        buf.append(end);
        ret.add(new LinkBean(buf.toString(), "New Command Group"));
        buf.setLength(0);
        buf.append(begin);
        buf.append(Constants.MODIFY_QUERY_TASK);
        buf.append(end);
        ret.add(new LinkBean(buf.toString(), "New Query"));
        buf.setLength(0);
        buf.append(begin);
        buf.append(Constants.MODIFY_INPUT_TASK);
        buf.append(end);
        ret.add(new LinkBean(buf.toString(), "New Input"));
        return ret;
    }

    boolean isEmpty(String s) {
        return !(s != null && s.trim().length() > 0);
    }

    public boolean isInternalResource() {
        return internalResource;
    }

    public void setInternalResource(boolean internalResource) {
        this.internalResource = internalResource;
    }

    public Authentication getAuthentication() {
        return authentication;
    }

    public void setAuthentication(Authentication authentication) {
        this.authentication = authentication;
    }

}

