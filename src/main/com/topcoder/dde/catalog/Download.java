/*
 * Download.java
 * September 20, 2002
 * 1.0
 *
 * Copyright (c) 2002, TopCoder, Inc.
 * All rights reserved.
 */


package com.topcoder.dde.catalog;

import java.io.Serializable;


/**
 * An object that represents a download location for a component. Instances of
 * this class can either be created by the component catalog to return
 * information to the client, or by the client to pass information to the
 * component catalog. In the former case, the instance will contain information
 * about the example's primary key in the database. In the latter case, the
 * instance will have a dummy id of -1.
 *
 * @version 1.0, 20 September 2002
 * @author  Albert Mao
 * @see     ComponentManager
 */
public class Download implements Serializable {


    private long id;
    private String description;
    private String url;


    Download(long id, String description, String url) {
        this(description, url);
        this.id = id;
    }

    /**
     * Constructs a new <code>Download</code> object.
     *
     * @param description a description of the download location
     * @param url the URL the component can be downloaded from
     * @throws IllegalArgumentException if <code>description</code> or
     * <code>url</code> are <code>null</code>
     */
    public Download(String description, String url) {
        if (description == null) {
            throw new IllegalArgumentException(
                    "Null specified for download description");
        }
        if (url == null) {
            throw new IllegalArgumentException(
                    "Null specified for download URL");
        }
        this.description = description;
        this.url = url;
        this.id = -1;
    }

    /**
     * Returns the primary key of this download location.
     *
     * @return the primary key of this download location, or -1 if this download
     * location was constructed by the client (instead of returned by the
     * component catalog)
     */
    public long getId() {
        return id;
    }

    /**
     * Returns a description of this download location.
     *
     * @return a description of this download location
     */
    public String getDescription() {
        return description;
    }

    /**
     * Sets the description of this download location.
     *
     * @param description the new description
     * @throws IllegalArgumentException if <code>description</code> is
     * <code>null</code>
     */
    public void setDescription(String description) {
        if (description == null) {
            throw new IllegalArgumentException(
                    "Null specified for download description");
        }
        this.description = description;
    }

    /**
     * Returns the URL the component can be downloaded from.
     *
     * @return the URL the component can be downloaded from
     */
    public String getURL() {
        return url;
    }

    /**
     * Sets the URL the component can be downloaded from.
     *
     * @param url the new URL
     * @throws IllegalArgumentException if <code>url</code> is
     * <code>null</code>
     */
    public void setURL(String url) {
        if (url == null) {
            throw new IllegalArgumentException(
                    "Null specified for download URL");
        }
        this.url = url;
    }

    /**
     * Compares the specified object with this download for equality. Two
     * downloads are considered equal if they have the same description and URL.
     * The primary key is <em>not</em> tested for equality.
     *
     * @param object the object to be tested for equality
     * @return <code>true</code> if the specified object is equal to this
     * download; <code>false</code> otherwise
     */
    public boolean equals(Object object) {
        if (object == null || object.getClass() != getClass()) {
            return false;
        }
        Download other = (Download) object;
        return getDescription().equals(other.getDescription())
                && getURL().equals(other.getURL());
    }

    /**
     * Returns the hash code value for this download. The hash code is
     * generated by performing a bitwise exclusive-or operation on the hash
     * codes of the <code>String</code> object containing the description and
     * the <code>URL</code> object containing this download's URL.
     *
     * @return the hash code value for this example
     */
    public int hashCode() {
        return getDescription().hashCode() ^ getURL().hashCode();
    }

    public String toString() {
        return "Download " + getId() + " - " + getDescription()
                + " (" + getURL() + ")";
    }


}