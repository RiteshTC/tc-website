package com.topcoder.web.tc.model;

import com.topcoder.web.common.model.CustomPriceComponent;
import com.topcoder.web.common.model.DefaultPriceComponent;
import com.topcoder.web.common.model.SoftwareComponent;

/**
 * @author dok
 * Date: Feb 11, 2004
 */
public class ReviewBoardApplication {

    private long userId = 0;
    private String handle = "";
    private boolean primary = false;
    private boolean specReviewer = false;

    private long projectId = 0;
    private String reviewerType = "";
    private int reviewerTypeId = 0;

    private int phaseId = 0;

    private SoftwareComponent component = null;

    protected ReviewBoardApplication() {
    }

    @Deprecated
    public ReviewBoardApplication(int phaseId, int level, int submissionCount, int submissionsPassedScreening) {
        this.component = new DefaultPriceComponent(level, submissionCount, submissionsPassedScreening, phaseId);
        this.phaseId = phaseId;
    }

    public ReviewBoardApplication(int phaseId, int level, int submissionCount, int submissionsPassedScreening, float prize, float drPoints) {
        this.component = new DefaultPriceComponent(level, submissionCount, submissionsPassedScreening, phaseId, prize, drPoints);
        this.phaseId = phaseId;
    }

    public ReviewBoardApplication(int phaseId, float primaryReviewerPrice, float reviewerPrice, float specReviewerPrice) {
        this.component = new CustomPriceComponent(primaryReviewerPrice, reviewerPrice, specReviewerPrice, phaseId);
        this.phaseId = phaseId;
    }


    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getHandle() {
        return handle;
    }

    public void setHandle(String handle) {
        this.handle = handle;
    }

    public boolean isPrimary() {
        return primary;
    }

    public void setPrimary(boolean primary) {
        this.primary = primary;
    }

    public boolean isSpecificationReviewer() {
        return specReviewer;
    }

    public void setSpecificationReviewer(boolean specReviewer) {
        this.specReviewer = specReviewer;
    }

    public long getProjectId() {
        return projectId;
    }

    public void setProjectId(long projectId) {
        this.projectId = projectId;
    }

    public String getReviewerType() {
        return reviewerType;
    }

    public void setReviewerType(String reviewerType) {
        this.reviewerType = reviewerType;
    }

    public int getReviewerTypeId() {
        return reviewerTypeId;
    }

    public void setReviewerTypeId(int reviewerTypeId) {
        this.reviewerTypeId = reviewerTypeId;
    }

    public int getPhaseId() {
        return phaseId;
    }


    public boolean isSpotFilled() {
        return userId != 0;
    }

    public float getReviewCost() {
        if (specReviewer) {
            return component.getSpecReviewCost();
        } else if (primary) {
            return component.getPrimaryReviewCost();
        } else {
            return component.getReviewCost();
        }
    }

    public float getPrice() {
        return component.getPrice();
    }

    public SoftwareComponent getComponent() {
        return (SoftwareComponent) component.clone();
    }

}