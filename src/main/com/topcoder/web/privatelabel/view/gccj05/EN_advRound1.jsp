﻿<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/style.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/gccj05.css"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Google Code Jam China, Powered by TopCoder</title>
</head>

<body>

<table border="0" width=100% cellpadding=0 cellspacing=0>
<tr>
    <td width="49%">&#160;</td>
    <td align="center">
        <table border="0" width=100% cellpadding=0 cellspacing=0>
            <tr>
                <td width="49%"></td>
                <td valign="bottom" align="center"><img border="0" src="/i/events/gccj05/gcjc_logo.gif"
                                                        alt="Google Coder Jam China logo"></td>
                <td width="49%"></td>
            </tr>
        </table>
    </td>
    <td width="49%"></td>
</tr>
<tr>
<td width="49%">&#160;</td>
<td>
<div class=greenBigBox>

<!-- Tab bar links-->
<div align="center">
    <jsp:include page="EN_links.jsp">
        <jsp:param name="selectedTab" value="advancers"/>
    </jsp:include>
</div>

<br><br>

<span class="bigTitle">Advancers</span>
<span valign=top>
         <jsp:include page="EN_right.jsp"/>
         </span>

<br><br>
<table class=tableFrame cellpadding=5 cellspacing=2 border="0" width="400">
<tr>
    <td class=advancersTitle colspan=3>Round 1</td>
</tr>
<tr>
    <td class=advancersRound width="30%">Handle</td>
    <td class=advancersRound width="40%">Score</td>
    <td class=advancersRound width="30%" align="center">Advanced</td>
</tr>


</table>

<br><br>
To find out more detailed information about the Google&#153; Code Jam China, including a list of the prizes, please read the
<a href="/pl/?module=Static&d1=gccj05&d2=EN_rules">Terms and Conditions</a>.
</div>
</td>
<td width="49%">&#160;</td>
<tr>
</table>
<jsp:include page="EN_foot.jsp"/>
</body>
</html>
