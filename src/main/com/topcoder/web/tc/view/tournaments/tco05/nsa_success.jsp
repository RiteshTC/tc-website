<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/tcStyles.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="eventPatrons"/>
<jsp:param name="tabLev3" value="nsa"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign="top">
		<td valign="top" align="center">
		<div class="bodySpacer">
            
<div align="center"><img src="/i/tournament/tco05/nsa_logo.gif" alt="NSA" border="0" /></div>
<br><br>
Your application has been received.
<br><br>
If you would like to be contacted by NSA, please go to <A href="http://www.nsa.gov/careers/">NSA's Careers Homepage</A> and apply online to register as an applicant.
<br><br>
        </div>
		</td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../public_right.jsp">
            <jsp:param name="level1" value="tco05"/>
            </jsp:include>
         </td>
		
	</tr>
	
</table>
	
	


<jsp:include page="../../foot.jsp" />

</body>

</html>
