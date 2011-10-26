/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.projecttracker.UserProjectInfo;

/**
 * Retrieval class used by the Model classes to return an array of user project infos that are opened for a specified
 * user.
 *
 * @author adic
 * @version 1.0
 */
public class OpenProjectRetrieval extends SuccessResult {

    /**
     * The array of user project infos.
     */
    private UserProjectInfo[] projects = null;

    /**
     * Constructor.
     *
     * @param projects the array of user project infos
     */
    OpenProjectRetrieval(UserProjectInfo[] projects) {
        this.projects = projects;
    }

    /**
     * Get the contained array of user project infos.
     *
     * @return the contained array of user project infos
     */
    public UserProjectInfo[] getUserProjects() {
        return projects;
    }

}

