<%@ page contentType="text/html; charset=ISO-8859-1"
         isErrorPage="true"
         buffer="64kb"
         import="com.topcoder.security.login.AuthenticationException"
%>
<% out.clear(); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<TITLE>TopCoder Corporate</TITLE>
<script language="JavaScript" src="/js/script.js"></script>
</HEAD>
<BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
<jsp:include page="../includes/top.jsp"/>
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
   <TR>
    <!-- Left Column Begins -->
      <TD WIDTH="170" VALIGN="top">
        <!-- Left Column Include Begins -->
        <!-- Global Seconday Nav Begins -->
        <jsp:include page="../includes/left.jsp"/>
        <!-- Global Seconday Nav Ends -->
        <!-- Left Column Include Ends -->
      </TD>
      <!-- Left Column Ends -->

      <!-- Gutter Begins -->
      <TD VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1"></TD>
      <!-- Gutter Ends -->

<!-- Body Area -->
<% Exception exc = (Exception)request.getAttribute("caught-exception");
   boolean authencityExc =  (exc instanceof AuthenticationException);
%>

 <TD valign="top" bgcolor="#FFFFFF" width="100%" class="bodyText">
   <IMG BORDER="0" VSPACE="5" HEIGHT="1" width="400" src="/i/clear.gif"><BR>
   <table width="100%" border="0">
   <tr><td class="bodyText">

     <!-- Error message content pane -->
<% if( authencityExc ) { %>

   Username/password combination is wrong<br>
<% }
   else { %>
     Your request could not be processed because you do not have permission.
     If you feel you have reached this page in error and
     would like to report this to TopCoder click <A CLASS="bodyText" HREF="mailto:service@topcoder.com">here</A>.

   </td></tr>
   <tr><td class="bodyText">&nbsp;
<% }
%>
   </td></tr>
   <tr><td class="bodyText"><a href="Javascript:history.back()">&lt; back</a></td></tr>
   </table>
<%--
   <!-- web-app debug time stack trace  BEGIN -->

   <br><hr><b><i>Trace information is provided for web application debug time only</i></b><br>
   <pre>
   <% Exception excCaught = (Exception)request.getAttribute("caught-exception");
      if( excCaught != null ) {
         excCaught.printStackTrace(new java.io.PrintWriter(out));
      }
   %>
   </pre><hr>
   <!-- web-app debug time stack trace END -->
--%>
 </TD>

<!-- Body Area Ends -->

      <!-- Gutter -->
      <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
   </TR>
</TABLE>
  <!-- Body Ends -->

  <jsp:include page="../includes/foot.jsp"/>

</BODY>
</HTML>
