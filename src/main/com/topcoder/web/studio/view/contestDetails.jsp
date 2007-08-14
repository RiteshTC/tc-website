<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.studio.model.PrizeType" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<c:set var="clientPrize" value="<%=PrizeType.BONUS%>"/>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
    <script type="text/javascript" src="/js/arena.js"></script>
</head>

<body>

<div align="center">
<div id="contentOut" class="contentOut">

<jsp:include page="top.jsp"/>
<jsp:include page="topNav.jsp">
    <jsp:param name="node" value="contests"/>
</jsp:include>

<div id="contentIn" class="contentIn">

<img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

<div class="contentSpacer">


<div class="linkBox">
    <studio:forumLink forumID="${contest.forumId}"/>
</div>

<div class="breadcrumb">
    <c:choose>
        <c:when test="${currentTime>contest.endTime}">
            <A href="${sessionInfo.servletPath}?module=ViewPastContests">Past Contests</A> &gt;
        </c:when>
        <c:otherwise>
            <A href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Contests</A> &gt;
        </c:otherwise>
    </c:choose>
    ${contest.name}
</div>

<h1>Contest Details</h1>

<div align="center">
<div style="width:510px;" align="left">

<c:if test="${currentTime<=contest.endTime && currentTime>=contest.startTime}">
    <div align="center">
        <table class="bodyText" style="margin-top: 20px; margin-bottom: 20px; width: 320px;" cellpadding="0" cellspacing="0">
            <tbody>
                <tr>
                    <td width="100%">
                        <div class="bigRed" style="border-top: 1px solid #999999; border-bottom: 1px solid #999999;">
                            <c:choose>
                                <c:when test="${fn:length(contest.prizes)==1}">
                                    <c:forEach items="${contest.prizes}" var="prize">
                                        <div style="float: right; text-align: right;">
                                            <fmt:formatNumber value="${prize.amount}" pattern="$###,###.00"/>
                                            <br>
                                            <tc-webtag:format object="${contest.endTime}" format="MM.dd.yyyy" timeZone="${sessionInfo.timezone}"/>
                                        </div>
                                        <strong>
                                            Winner:<br>
                                            Due date:
                                        </strong>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${contest.prizes}" var="prize">
                                        <c:choose>
                                            <c:when test="${clientPrize==prize.type.id}">
                                                <div style="float: right; clear: right; text-align: right;">
                                                    <fmt:formatNumber value="${prize.amount}" pattern="$###,###.00"/>
                                                    <br>
                                                </div>
                                                <strong>${prize.type.description}:</strong><br>
                                            </c:when>
                                            <c:otherwise>
                                                <div style="float: right; clear: right; text-align: right;">
                                                    <fmt:formatNumber value="${prize.amount}" pattern="$###,###.00"/>
                                                    <br>
                                                </div>
                                                <strong>Prize ${prize.place}:</strong><br>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                    <div style="float: right; clear: right; text-align: right;">
                                        <tc-webtag:format object="${contest.endTime}" format="MM.dd.yyyy" timeZone="${sessionInfo.timezone}"/>
                                    </div>
                                    <strong>Due date:</strong>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </td>
                    <c:choose>
                    <c:when test="${registered}">
                    <td style="padding: 10px 5px 10px 20px;" align="right">
                        <img src="/i/layout/btnRegisterNA.png" alt="Register" />
                    </td>
                    <td style="padding: 10px 0px 10px 5px;" align="right">
                        <A href="${sessionInfo.servletPath}?module=ViewSubmission&amp;<%=Constants.CONTEST_ID%>=${contest.id}"><img src="/i/layout/btnSubmit.png" alt="Submit" onmouseover="this.src='/i/layout/btnSubmitOn.png'" onmouseout="this.src='/i/layout/btnSubmit.png'" /></A>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="padding-top: 10px;" align="center">
                        You are registered for this project.<br>
                    </td>
                    </c:when>
                    <c:otherwise>
                    <td style="padding: 10px 5px 10px 20px;" align="right">
                        <a href="${sessionInfo.servletPath}?module=ViewRegistration&amp;<%=Constants.CONTEST_ID%>=${contest.id}"><img src="/i/layout/btnRegister.png" alt="Register" onmouseover="this.src = '/i/layout/btnRegisterOn.png';" onmouseout="this.src = '/i/layout/btnRegister.png';" /></a>
                    </td>
                    <td style="padding: 10px 0px 10px 5px;" align="right">
                        <img src="/i/layout/btnSubmitNA.png" alt="Submit" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="padding-top: 10px;" align="center">
                        Register to get info necessary to submit your design.<br>
                    </td>
                    </c:otherwise>
                    </c:choose>
                </tr>
            </tbody>
        </table>
    </div>
</c:if>

<div class="header">Project Overview</div>
${contest.overview.value}
<br><br>

<c:if test="${registered || currentTime>contest.endTime}">
    <c:if test="${fn:length(contest.documents)>0}">
        <strong>Documentation</strong><br>
        <%--
            To view this project's documentation, you must be a registered TopCoder Studio member. If you are <strong>
            already a registered TopCoder member</strong> you still need to add TopCoder Studio to your registration by
            <A href="http://<%=ApplicationServer.SERVER_NAME%>/reg/?nrg=false">updating your profile</A>.
            <br><br>
        --%>
        <c:forEach items="${contest.documents}" var="document">
            ${document.type.description}:
            <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=DownloadDocument&amp;<%=Constants.DOCUMENT_ID%>=${document.id}">
                    ${document.originalFileName}</a> <br/>
        </c:forEach>
        <br><br>
    </c:if>
</c:if>


<div class="header">Payment</div>
${contest.prizeDescription.value}
<br><br>

<c:choose>
    <c:when test="${fn:length(contest.prizes)==1}">
        <c:forEach items="${contest.prizes}" var="prize">
            <strong>Winning Designer:
                <fmt:formatNumber value="${prize.amount}" pattern="$###,###.00"/>
            </strong>
        </c:forEach>
        <br><br>
    </c:when>
    <c:otherwise>
        <c:forEach items="${contest.prizes}" var="prize">
            <c:choose>
                <c:when test="${clientPrize==prize.type.id}">
                    <strong>${prize.type.description}:
                        <fmt:formatNumber value="${prize.amount}" pattern="$###,###.00"/>
                    </strong>
                    <br>
                </c:when>
                <c:otherwise>
                    <strong>Prize ${prize.place}:
                        <fmt:formatNumber value="${prize.amount}" pattern="$###,###.00"/>
                    </strong><br>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <br><br>
    </c:otherwise>
</c:choose>


<div class="header">Eligibility</div>

<p>You must be a TopCoder Studio member, at least 18 years of age, meeting all of the membership requirements.
    In addition, you must fit into one of the following categories.
</p>

<p>If you reside in the United States, you must be either:</p>
<ul>
    <li>A US Citizen</li>
    <li>A Lawful Permanent Resident of the US</li>
    <li>A temporary resident, asylee, refugee of the U.S., or have a lawfully issued work authorization card
        permitting unrestricted employment in the U.S.
    </li>
</ul>
<c:choose>
<c:when test="${contest.id==2048}"></c:when>
<c:otherwise>
<p>If you do not reside in the United States:</p>
<ul>
    <li>You must be authorized to perform services as an independent contractor. (Note: In most cases you will
        not need to do anything to become authorized)
    </li>
    </c:otherwise>
    </c:choose>
</ul>


<br><br>

<div class="header">Timeline</div>
All submissions are required to be submitted by the End Date.
<br><br>


<div align="center">
    <table cellpadding="4" cellspacing="0" width="250">
        <tbody>
            <tr>
                <td valign="top" nowrap="nowrap"><strong>Start Date:</strong></td>
                <td>
                    <tc-webtag:format object="${contest.startTime}" format="EEEE, MMMM d, yyyy 'at' HH:mm z" timeZone="${sessionInfo.timezone}"/>
                </td>
            </tr>
            <tr>
                <td valign="top" nowrap="nowrap"><strong>End Date:</strong></td>
                <td>
                    <tc-webtag:format object="${contest.endTime}" format="EEEE, MMMM d, yyyy 'at' HH:mm z" timeZone="${sessionInfo.timezone}"/>
                </td>
            </tr>
        </tbody>
    </table>
</div>

<br><br>
<!-- 
<c:if test="${currentTime<=contest.endTime && currentTime>=contest.startTime}">
    <div class="header">Upload Your Submission</div>
    If you are ready to submit your design for this contest, click the button below.
    <br><br>

    <div align="center">
        <A href="${sessionInfo.servletPath}?module=ViewSubmission&amp;<%=Constants.CONTEST_ID%>=${contest.id}" class="btn_submit">
            &nbsp;</A>
    </div>
</c:if>
 -->
</div>
</div>

</div>
<img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
</div>

<jsp:include page="foot.jsp"/>

<img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
</div>
</div>

</body>
</html>