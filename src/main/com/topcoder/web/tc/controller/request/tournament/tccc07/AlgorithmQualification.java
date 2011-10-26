/*
* Advancers
*
* Created Aug 1, 2007
*/
package com.topcoder.web.tc.controller.request.tournament.tccc07;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.controller.request.tournament.AdvancersBase;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id: AlgorithmQualification.java 64190 2007-08-13 19:54:20Z pulky $
 */
public class AlgorithmQualification extends AdvancersBase {

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.AdvancersBase#getContestPrefix()
     */
    @Override
    protected String getContestPrefix() {
        return "tccc07";
    }

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.AdvancersBase#getCommandName()
     */
    @Override
    protected String getCommandName() {
        return "tccc07_alg_qual";
    }

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.AdvancersBase#getDataSourceName()
     */
    protected String getDataSourceName() {
        return DBMS.DW_DATASOURCE_NAME;
    }

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.AdvancersBase#getPageName()
     */
    @Override
    protected String getPageName() {
        return "/tournaments/" + getContestPrefix() + "/algorithm/qualification.jsp";
    }
    
    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.AdvancersBase#setSortInfo()
     */
    @Override
    protected void setSortInfo(ResultSetContainer rsc) {
        SortInfo s = new SortInfo();
        s.addDefault(rsc.getColumnIndex("handle_sort"), "asc");
        s.addDefault(rsc.getColumnIndex("round_name"), "asc");
        s.addDefault(rsc.getColumnIndex("rating"), "desc");
        s.addDefault(rsc.getColumnIndex("points"), "desc");
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
    }

}
