<%@  page
  language="java"
  import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
          com.topcoder.common.web.data.report.Constants"
%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<html>
  <head>
    <title>TopCoder Reporting</title>
  </head>
  <body>
     <a href=<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY%>><< back to main menu</a><br/><br/>
    <center>
    <br/>
    <br/>

    <table width="100%" border="0" cellpadding="3" cellspacing="0">

        <tr><td align=center><b><font size="+2"><%=request.getAttribute(com.topcoder.web.tc.Constants.HANDLE)%></font></b></td></tr>
        <tr><td align=center><a href="/tc?module=LegacyReport&t=profile&ha=<%=request.getAttribute(com.topcoder.web.tc.Constants.HANDLE)%>">View Report Profile</a></p></td>

        <tr>
            <td>
                <form action="/tc" method=post name="noteForm">
                <input type="hidden" name="module" value="UpdateNote"/>
                <input type="hidden" name="<%=com.topcoder.web.tc.Constants.USER_ID%>" value="<%=request.getAttribute(com.topcoder.web.tc.Constants.USER_ID)%>"/>
                    <tc-webtag:textArea name="<%=com.topcoder.web.tc.Constants.NOTE_TEXT%>" rows="3" cols="40"/>
                    <input type="submit" name="submit" value="Update"/>
                </form>
            </td>
        </tr>


    </table><br/><br/>

    </center>
  </body>
</html>
