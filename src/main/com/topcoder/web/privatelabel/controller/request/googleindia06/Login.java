package com.topcoder.web.privatelabel.controller.request.googleindia06;

import com.topcoder.web.privatelabel.controller.request.FullLogin;

import java.util.Calendar;
import java.util.Date;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Oct 31, 2005
 */
public class Login extends FullLogin {

    protected void setNextPage() {
        Calendar end = Calendar.getInstance();
        end.set(2006, Calendar.FEBRUARY, 14, 22, 30);
        Calendar beginning = Calendar.getInstance();
        //beginning.set(2005, Calendar.JULY, 25, 9, 0);
        beginning.set(2006, Calendar.MARCH, 19, 22, 30);

        Calendar now = Calendar.getInstance();
        now.setTime(new Date());

        if (now.before(beginning) || now.after(end)) {
            setNextPage(getBundle().getProperty("google_india_06_reg_closed_page"));
            setIsNextPageInContext(true);
        } else {
            if (hasErrors()) {
                setNextPage(getBundle().getProperty("google_india_06_login_page"));
                setIsNextPageInContext(true);
            } else {
                setNextPage(getBundle().getProperty("google_india_06_reg_page"));
                setIsNextPageInContext(true);
            }
        }
    }





}
