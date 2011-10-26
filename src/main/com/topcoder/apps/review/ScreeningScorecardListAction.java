/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.util.log.Level;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForwards;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * <p>
 * Extends from <strong>ReviewAction</strong> that reads and renders the list
 * of screening scorecards for this project.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public final class ScreeningScorecardListAction extends ReviewAction {

    /**
     * <p>
     * Call the business logic layer and set session if possible.
     * </p>
     *
     * @return the result data.
     *
     * @param mapping The ActionMapping used to select this instance
     * @param form The optional ActionForm bean for this request (if any)
     * @param request The HTTP request we are processing
     * @param response The HTTP response we are creating
     * @param errors The action errors in calling the logic layer.
     * @param forwards The action forwards from calling the logic layer.
     * @param orpd The OnlineReviewProjectData to create the action data.
     */
    public ResultData executeLogic(ActionMapping mapping,
                                   ActionForm form,
                                   HttpServletRequest request,
                                   HttpServletResponse response,
                                   ActionErrors errors,
                                   ActionForwards forwards,
                                   OnlineReviewProjectData orpd) {
        log(Level.INFO, "ScreeningScorecardListAction: User '"
                + orpd.getUser().getHandle() + "' in session "
                + request.getSession().getId());

        // Call the business logic
        BusinessDelegate businessDelegate = new BusinessDelegate();
        ScreeningScorecardsData data = new ScreeningScorecardsData(orpd);
        ResultData result = businessDelegate.getScreeningList(data);

        if (result instanceof ScreeningScorecardsRetrieval) {
            ScreeningScorecardsRetrieval ssr = (ScreeningScorecardsRetrieval) result;

            // Populate the session
            request.setAttribute(Constants.SCORECARD_LIST_KEY,
                    ssr.getScorecards());
        }

        return result;
    }
}
