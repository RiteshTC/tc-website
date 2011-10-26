/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.handshake;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.topcoder.shared.security.ClassResource;

import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.security.TCSubject;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.ejb.user.UserTermsOfUseLocator;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.security.LoginException;
import com.topcoder.shared.util.dwload.CacheClearer;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.common.RequestProcessor;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.development.Base;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;

import com.topcoder.web.common.HttpObjectFactory;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.dao.EventDAO;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.Notification;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Set;

/**
 */
public class HandShake extends ShortHibernateProcessor {




    /**
     * <p>
     * developmentProcessing
     * </p>
     * @throws TCWebException if error
     */
    protected void dbProcessing() throws Exception  {
        try {

            if (!getUser().isAnonymous())
            {
           
                // check logged in user
                    System.out.println("Enter the method HandShakeServelt::doPost");

                    String handle = getUser().getUserName();

                    String eventId = "2396";

                    if (getRequest().getParameter("event_id") != null && !getRequest().getParameter("event_id").equals(""))
                    {
                        eventId = getRequest().getParameter("event_id");
                    }

                    System.out.println("Make an HTTP request to the mocking servlet providing"
                        + " the user's TopCoder handle and get a random string.");
                    String getkey = sendURL("http://165.204.52.97/opencl/misc/sign_on_getkey.jsp?userid="+handle+"&dsrefkey=opencl_demo", "");
                    //String getkey = sendURL("http://" + request.getServerName()+ "/mock?userid=" + handle+"&dsrefkey=opencl_demo", "");
                    
                    System.out.println("The getkey String : " +  getkey);

                    if (getkey != null && getkey.startsWith("error="))
                    {
                        getResponse().getOutputStream().println(getkey);
                        return;
                    }

                    String key = getkey.substring(getkey.lastIndexOf("genkey=")+7);
                    System.out.println("Forward the user to the mocking (another URL) with a predinfed contest"
                        + " id and the random string.");

                   // getResponse().sendRedirect(getResponse().encodeRedirectURL("http://" + request.getServerName() + "/anotherMock?userid=" + handle + "&skey=" + key+"&eventid=50"));
                   getResponse().sendRedirect(getResponse().encodeRedirectURL("http://165.204.52.97/opencl/misc/sign_on_validate.jsp?dsrefkey=opencl_demo&skey=" + key+"&eventid="+eventId));
                
                System.out.println("Exit the method HandShakeServelt::doPost");      
            
            } else {
                
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            }
        } 
        catch (PermissionException pe) {
            throw pe;
        }catch (Exception e) {
            System.out.println("Exception : " + e.getMessage());
                        throw new RuntimeException(e);

       }

        
    }





    private String sendURL(String urlStr, String data) throws Exception  {
        HttpURLConnection httpURLConnection = null;
        InputStream is = null;
        OutputStream os = null;
        BufferedReader br = null;
        try {
            URL url = new URL(urlStr);
            httpURLConnection = (HttpURLConnection) url
                .openConnection();
            httpURLConnection.setRequestMethod("POST");
            httpURLConnection.setDoOutput(true);
      
            try {
                os = httpURLConnection.getOutputStream();
                os.write(data.getBytes());
                os.flush();
            } finally {
                if (os != null) {
                    os.close();
                }
            }
            is = httpURLConnection.getInputStream();
            br = new BufferedReader(new InputStreamReader(is));
            StringBuilder sb = new StringBuilder();
            while (br.read() != -1) {
                sb.append(br.readLine());
            }
            return sb.toString();
        } catch (Exception e)
        {
            System.out.println("Exception : " + e.getMessage());
                        throw e;
        }
        
        finally {
            if (br != null) {
                try{

                br.close();
                } catch (Exception e) {System.out.println("Exception : " + e.getMessage());}
            }
        }
    }
}
