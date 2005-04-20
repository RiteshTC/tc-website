<%@ page import="com.topcoder.web.codinginterface.techassess.Constants,java.util.List,
                 com.topcoder.shared.netCommon.screening.response.data.ScreeningProblemSet,
                 com.topcoder.shared.netCommon.screening.response.data.ScreeningProblemLabel,
                 java.util.ArrayList,
                 java.util.TimeZone,
                 java.util.Date"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<html>
  <head>
    <title></title>
    <META HTTP-EQUIV=Refresh CONTENT="600; URL=<jsp:getProperty name="sessionInfo" property="absoluteServletPath"/>?module=Static&d1=clockFrame">
    <script language="JavaScript" type="text/javascript" src="/js/techassess.js"></script>
  </head>
  <body>
    <script language="javascript">

        //perform clock sync, time below is in milliseconds after epoch
        var serverTime = new Date(<%=request.getAttribute(Constants.CURRENT_TIME)%>);
        var localTime = new Date();

        var serverOffset = <%=TimeZone.getDefault().getOffset(new Date().getTime())/(60*60*1000)%>
        var offset = localTime.getTimezoneOffset();
        offset = offset / 60;
        offset = offset * -1

        serverTime = new Date(serverTime.getTime() - ((serverOffset - offset) * 60 * 60 * 1000));
        var syncedOffset = localTime.getTime() - serverTime.getTime();

        function update() {
            var d = new Date();
            d = new Date(d.getTime() - syncedOffset);
            var offset = d.getTimezoneOffset();
            offset = offset / 60;
            offset = offset * -1

            <%--var leadingIdent = d.getHours() >= 12 ? "PM" : "AM" ;--%>

            <%--var text = padWithZeroes(d.getHours() % 12) + ":" + padWithZeroes(d.getMinutes()) + ":" + padWithZeroes(d.getSeconds()) + " " + leadingIdent + " GMT" + offset;--%>
            var text = padWithZeroes(d.getHours()) + ":" + padWithZeroes(d.getMinutes()) + ":" + padWithZeroes(d.getSeconds()) + " GMT" + offset;

            if (top.mainFrame) {
                updateDivOrSpan(top.mainFrame.document, "currentTime", text);
            }

            setTimeout("update()", 1000);
        }

        setTimeout("update()", 1000);
    </script>
  </body>
</html>
