/*
 * Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

import java.util.Date;
import java.util.Set;

/**
 * <p>This class represents a Specification Review entity.</p>
 *
 * <p>
 *   Version 1.0 (Studio Release Assembly - Spec Review Sign up page v1.0) Change notes:
 *   <ol>
 *       This class was created to support the new Specification Review entity.
 *   </ol>
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since Studio Release Assembly - Spec Review Sign up page v1.0
 */
public class SpecReview extends Base {

    /**
     * Serial version UID for this class.
     *
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;

    /**
     * The Specification Review id.
     */
    private Long id;

    /**
     * The associated Specification Review contest id.
     */
    private Long contestId;

    /**
     * The Specification Review "is studio" flag.
     */
    private Integer isStudio;

    /**
     * The Specification Review review status.
     */
    private SpecReviewStatus reviewStatus;

    /**
     * The Specification Review "ready for review" time.
     */
    private Date readyForReviewTime;

    /**
     * The Specification Review "review done" time.
     */
    private Date reviewDoneTime;

    /** 
     * The Specification Review reviewers 
     */
    private Set<SpecReviewReviewer> specReviewers;
        
    /**
     * Default empty Constructor 
     */
    public SpecReview() {
    }

    /**
     * Gets the identifier
     *
     * @return the identifier
     */
    public Long getId() {
        return id;
    }

    /**
     * Sets the identifier
     *
     * @param id the identifier to set
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * Gets the associated Specification Review Contest Id
     *
     * @return the associated Specification Review Contest Id
     */
    public Long getContestId() {
        return contestId;
    }

    /**
     * Sets the associated Specification Review Contest Id
     *
     * @param contestId the associated Specification Review Contest Id to set
     */
    public void setContestId(Long contestId) {
        this.contestId = contestId;
    }

    /**
     * Gets the Specification Review "is_studio" flag
     *
     * @return the Specification Review "is_studio" flag
     */
    public Integer getIsStudio() {
        return isStudio;
    }

    /**
     * Sets the Specification Review "is_studio" flag
     *
     * @param isStudio the Specification Review "is_studio" flag to set
     */
    public void setIsStudio(Integer isStudio) {
        this.isStudio = isStudio;
    }

    /**
     * Gets the Specification Review Status
     *
     * @return the Specification Review Status
     */
    public SpecReviewStatus getSpecReviewStatus() {
        return reviewStatus;
    }

    /**
     * Sets the Specification Review Status
     *
     * @param reviewStatus the Specification Review Status to set
     */
    public void setSpecReviewStatus(SpecReviewStatus reviewStatus) {
        this.reviewStatus = reviewStatus;
    }

    /**
     * Gets the Specification Review "Ready For Review" Time
     *
     * @return the Specification Review "Ready For Review" Time
     */
    public Date getReadyForReviewTime() {
        return readyForReviewTime;
    }

    /**
     * Sets the Specification Review "Ready For Review" Time
     *
     * @param readyForReviewTime the Specification Review "Ready For Review" Time to set
     */
    public void setReadyForReviewTime(Date readyForReviewTime) {
        this.readyForReviewTime = readyForReviewTime;
    }

    /**
     * Gets the Specification "Review Done" Time
     *
     * @return the Specification "Review Done" Time
     */
    public Date getReviewDoneTime() {
        return reviewDoneTime;
    }

    /**
     * Sets the Specification "Review Done" Time
     *
     * @param reviewDoneTime the Specification "Review Done" Time to set
     */
    public void setReviewDoneTime(Date reviewDoneTime) {
        this.reviewDoneTime = reviewDoneTime;
    }

    /**
     * Gets the Specification Review reviewers
     *
     * @return the Specification Review reviewers
     */
    public Set<SpecReviewReviewer> getSpecReviewers() {
        return specReviewers;
    }

    /**
     * Sets the Specification Review reviewers
     *
     * @param specReviewers the Specification Review reviewers
     */
    public void setSpecReviewers(Set<SpecReviewReviewer> specReviewers) {
        this.specReviewers = specReviewers;
    }

    /**
     * Equals implementation for this class.
     *
     * @param obj the object to compare
     * @return true if the two objects are equal (identifiers are equal)
     *
     * @see java.lang.Object#equals(java.lang.Object)
     */
    public boolean equals(Object obj) {
        if (obj == null || id == null || !(obj instanceof SpecReview)) {
            return false;
        } else {
            SpecReview other = (SpecReview) obj;
            return id.equals(other.getId());
        }
    }

    /**
     * Hashcode implementation for this class.
     *
     * @return an <code>int</code> with the hashcode (identifier hashcode)
     *
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return id.hashCode();
    }
}
