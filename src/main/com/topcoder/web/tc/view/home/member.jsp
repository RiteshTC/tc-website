<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Programming Contests, Software Development, and Employment Services at TopCoder</title>

<jsp:include page="../script.jsp" />

<script>
function openWin(url, name, w, h) {
    win = window.open(url, 'biowin', "scrollbars=no,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
    win.location.href = url;
    win.focus();
}
</script>

</head>

<body>

<jsp:include page="../top.jsp" >
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

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td> 
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="center" valign="top"><img src="/i/clear.gif" alt="" width="1" height="10" border="0" />
        <jsp:include page="big_promo.jsp" /><img src="/i/clear.gif" alt="" width="1" height="10" border="0" />
        <jsp:include page="small_promos.jsp" /><img src="/i/clear.gif" alt="" width="1" height="10" border="0" />
        <jsp:include page="corp_promos.jsp" /><img src="/i/clear.gif" alt="" width="1" height="10" border="0" />
        <jsp:include page="my_stats.jsp" /><img src="/i/clear.gif" alt="" width="1" height="10" border="0" />
        <jsp:include page="arena.jsp" /><img src="/i/clear.gif" alt="" width="1" height="10" border="0" />
        <jsp:include page="coder_pov.jsp" /><img src="/i/clear.gif" alt="" width="1" height="10" border="0" />
        <jsp:include page="feature_home.jsp" /><img src="/i/clear.gif" alt="" width="1" height="10" border="0" />
        <jsp:include page="press_room_highlights.jsp" /><img src="/i/clear.gif" alt="" width="1" height="10" border="0" />
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="244">
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
               <tr><td><img src="/i/clear.gif" width="180" height="10" border="0"></td></tr>
               <tr><td><jsp:include page="srm_sponsor.jsp" /></td></tr>
               <tr><td><jsp:include page="coder_of_month.jsp" /></td></tr>
               <tr><td><jsp:include page="member_surveys.jsp" /></td></tr>
               <tr><td><img src="/i/clear.gif" width="1" height="5" border="0" /></td></tr>
               <tr><td><img src="/i/module_labels_comp_leaders.gif" alt="Competition Leaders" width="244" height="20" border="0" /><br/></td></tr>
               <tr><td><img src="/i/clear.gif" width="1" height="1" border="0" /></td></tr>
               <tr><td><jsp:include page="top_scorers.jsp" /></td></tr>
               <tr><td><img src="/i/clear.gif" width="1" height="1" border="0" /></td></tr>
               <tr><td><jsp:include page="top_coders.jsp" /></td></tr>
               <tr><td><img src="/i/clear.gif" width="1" height="1" border="0" /></td></tr>
               <tr><td><jsp:include page="top_schools.jsp" /></td></tr>
               <tr><td><img src="/i/clear.gif" width="1" height="1" border="0" /></td></tr>
               <tr><td><jsp:include page="top_countries.jsp" /></td></tr>
               <tr><td><img src="/i/clear.gif" width="1" height="10" border="0" /></td></tr>
                <tr><td bgcolor="#838383"><img src="/i/label_quick_stats_home.gif" alt="Statistics" width="244" height="20" border="0" /></td></tr>
                <tr>
                    <td bgcolor="#EEEEEE"><img src="/i/clear.gif" alt="" width="1" height="3" border="0" /><br/>
                        <table border="0" cellspacing="5" cellpadding="0" width="100%">
                            <tr><td class="bodyText">Select a Statistic from the menu below.</td></tr>
                           <jsp:include page="quick_stats_pulldown.jsp" />
                        </table></td>
                </tr>
            </table>
            <img src="/i/home_right_bottom.gif" width="244" height="20" border="0" />
            <p><br/></p>
         </td>
<!-- Right Column Ends -->

    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
