<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder News Archive</title>

<jsp:include page="../../script.jsp" />

</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
		<td width="180">
			<jsp:include page="../includes/global_left.jsp">
				<jsp:param name="level1" value="home"/>
				<jsp:param name="level2" value=""/>
			</jsp:include>
		</td>
<!-- Left Column Ends -->
 
<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="myTCBody">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="news_archive"/>
            <jsp:param name="title" value="Movies"/>
        </jsp:include>

            <table border=0 cellpadding=2 cellspacing=0 width="100%">
            <tr class="bodyText"><td nowrap="nowrap">02.07.05 1:15 PM&#160;-&#160</td><td width="100%"><A href="/i/tournament/tco04/onsite_movies/reid.mov">reid, on going to an onsite event</A></td></tr>
            <tr class="bodyText"><td nowrap="nowrap">01.25.05 10:00 AM&#160;-&#160</td><td width="100%"><A href="/i/tournament/tco04/onsite_movies/Nvidia2.mov">NVIDIA Chief Software Architect, Nick Trientos</A></td></tr>
            <tr class="bodyText"><td nowrap="nowrap">01.25.05 10:00 AM&#160;-&#160</td><td width="100%"><A href="/i/tournament/tco04/onsite_movies/DaveOBrien.mov">TopCoder VP of Sales, Dave O'Brien</A></td></tr>
            </table>

        </div>
        <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
