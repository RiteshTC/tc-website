package com.topcoder.web.csf.dao;

import com.topcoder.web.csf.model.SubmissionReview;


/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public interface SubmissionReviewDAO {
    SubmissionReview find(Long id);

    void saveOrUpdate(SubmissionReview s);
}
