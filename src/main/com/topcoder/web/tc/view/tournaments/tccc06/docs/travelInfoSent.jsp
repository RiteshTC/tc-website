<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2006 TopCoder Collegiate Challenge- Computer Programming Tournament</title>
    <link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
</head>

<body>

<!-- Tab barlinks-->
<jsp:include page="../links.jsp">
    <jsp:param name="tabLev1" value="overview"/>
    <jsp:param name="tabLev2" value="details"/>
    <jsp:param name="tabLev3" value=""/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
    <!-- Body-->
    <tr valign=top>
        <td valign=top align=center>
            <div class=bodySpacer>

                <p class=bigTitle>Your information has been sent.</p>


            </div>
        </td>


        <!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../right.jsp">
                <jsp:param name="level1" value="all"/>
            </jsp:include>
        </td>

    </tr>

</table>


<jsp:include page="../../../foot.jsp"/>

</body>

</html>
