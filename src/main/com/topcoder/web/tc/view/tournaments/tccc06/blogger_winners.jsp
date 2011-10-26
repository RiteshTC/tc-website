<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="join_us"/>
<jsp:param name="tabLev3" value="pickme"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
<div style="float:right;"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=pickme_contest">What is the "Pick Me Contest"?</A><br>
<%--<A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=blogs&d4=overview">Read the blogs</A>--%>
</div>
<span class="bigTitle">Pick Me Contest Winners</span>
<br><br>
<div align="center">

<table cellpadding="6" cellspacing="0" width="300">
   <tr>
      <td class="bodyText" align="center" valign="top" width="50%"><img src="/i/m/RRLevering_big.jpg" /><br>
      <tc-webtag:handle coderId="344462" darkBG="true" /><br>
      <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=bloggerWinnerRRLevering">winning submission</A>
      </td>
      <td class="bodyText" align="center" valign="top" width="50%"><img src="/i/m/Churchillio_big.jpg" /><br>
      <tc-webtag:handle coderId="21181561" darkBG="true" /><br>
      <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=bloggerWinnerChurchillio">winning submission</A>
      </td>
   </tr>
</table>
</div>
<br><br>
Congratulations to our "pick me" winners, and thanks to everyone who entered. If you didn't make it, you can still make your voice heard - just <tc-webtag:forumLink forumID="506113" message="tell us and the bloggers"/> what you would like to see in the Collegiate Challenge blogs. 
<br><br>
        </div>
      </td>
        
         
<!-- Right Column-->
        <td width="170" align="right">
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />

</body>

</html>
