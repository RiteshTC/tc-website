package com.topcoder.web.common;

import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.security.User;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.web.ejb.requestservices.RequestServices;

import javax.naming.InitialContext;
import java.util.*;
import java.sql.Timestamp;

/**
 * User: dok
 * Date: Nov 19, 2004
 * Time: 11:12:26 AM
 */
public class RequestTracker {

    private static final User GUEST = SimpleUser.createGuest();
    private static final int BATCH_PERIOD = 60 * 1000;

    private static Queue q = new Queue();

    private static Logger log = Logger.getLogger(RequestTracker.class);
    private static Thread t = null;

    static {
        log.info("starting request tracker thread");
        t = new RequestTrackerThread();
        t.start();
    }

    public static void trackRequest(TCRequest request) {
        log.debug("add request");
        q.add(new UserRequest(GUEST, request));
        log.debug("added request");
    }

    public static void trackRequest(User u, TCRequest request) {
        q.add(new UserRequest(u, request));
    }

    private static class RequestTrackerThread extends Thread {
        public void run() {
            while (true) {
                try {
                    Thread.sleep(BATCH_PERIOD);
                    loadRequests();
                } catch (InterruptedException e) {
                    log.error("Interrupted while waiting for the next batch", e);
                }
            }
        }
    }

    private static void loadRequests() {
        ArrayList a = new ArrayList(q.size());
        synchronized (q) {
            log.debug("beginning move from queue to temp storage");
            while (!q.isEmpty())
                a.add(q.pop());
            log.debug("move from queue to temp storage complete");
        }
        InitialContext ctx = null;
        try {
            ctx = TCContext.getInitial();
            RequestServices rs = (RequestServices) BaseProcessor.createEJB(ctx, RequestServices.class);
            for (Iterator it = a.iterator(); it.hasNext();) {
                UserRequest r = (UserRequest) it.next();
                if (r.u.isAnonymous()) {
                    rs.createRequest(r.url, new Timestamp(r.time), DBMS.COMMON_OLTP_DATASOURCE_NAME);
                } else {
                    rs.createRequest(r.u.getId(), r.url, new Timestamp(r.time), DBMS.COMMON_OLTP_DATASOURCE_NAME);
                }
            }

        } catch (Exception e) {
            log.error("Problem inserting request" + e);
        } finally {
            BaseProcessor.close(ctx);
        }

    }



    private static class UserRequest {
        private User u;
        private String  url;
        private long time;

        private UserRequest(User u, TCRequest r) {
            this.u = u;
            StringBuffer buf = new StringBuffer(254);
            buf.append("http://");
            buf.append(r.getServerName());
            buf.append(r.getContextPath());
            buf.append(r.getServletPath());
            String query = r.getQueryString();
            buf.append((query == null) ? ("") : ("?" + query));
            this.url = buf.toString();
            this.time = System.currentTimeMillis();
        }
    }

    private static class Queue {
        private final LinkedList q = new LinkedList();
        private synchronized boolean add(Object o) {
            return q.add(o);
        }
        private synchronized int size() {
            return q.size();
        }
        private synchronized boolean isEmpty() {
            return q.isEmpty();
        }
        private synchronized Object pop() {
            return q.removeLast();
        }


    }
}
