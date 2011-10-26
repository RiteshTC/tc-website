<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/tcStyles.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/style.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/google06.css"/>
    <title>Google Code Jam 2006, Powered by TopCoder</title>

    <jsp:include page="../script.jsp"/>
</head>

<body>


<table border="0" width="100%" cellpadding="0" cellspacing="0">
    <tr>
        <td align="center">
            <table border="0" width="100%" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="49%"></td>
                    <td valign="bottom" align="center">
                        <img border=0 src="/i/events/google2006/codejamLogo.gif" alt="Google Code Jam logo"></td>
                    <td width="49%"></td>
                </tr>
            </table>
        </td>
    </tr>

    <!-- Tab bar links-->
    <tr>
        <td>
            <div align="center">
                <jsp:include page="links.jsp">
                    <jsp:param name="selectedTab" value="faq"/>
                </jsp:include>
                <br/>
            </div>
        </td>
    </tr>

    <tr>

        <!-- content -->
        <td>
        <div align="center">
        <div class="pageLayout" align="left">
         <span valign="top">
         <jsp:include page="right.jsp"/>
         </span>

                <span class="bigBluetitle">FAQ</span>

                <br><br>

                <b>Is there a way to practice before the elimination rounds?</b><br>
                You may use your handle and password to login to the competition arena. Within the arena there is a
                practice area that mimics the functionality of the real competition. Nothing that you do in the practice
                room will count against you in the competition.
                <br><br>
                <b>What resources can I use to help me during the competition?</b><br>
                You may utilize any reference materials, including those found on the Internet. You may not collaborate
                with any other person.
                <br><br>
                <b>Can I use code that has already been written as a part of my solution?</b><br>
                Only code that has been authored by you may be used in a code submission. No third-party source code may
                be used as a part of any code submission.
                <br><br>
                <b>What software is used?</b><br>
                Java 5.0 (build 1.5.0_03)<br>
                .NET Framework version 2.0.50727<br>
                GCC 4.0.2<br>
                Python 2.3.4
                <br><br>
                <b>I've submitted a solution for a problem, but the time has not run out. Can I submit again?</b><br>
                Yes. However, if you've already submitted a problem and you choose to submit again, your score for that
                submission will be adjusted to account for the additional lapsed time since your last submission, as
                well as an additional penalty of 10% of the maximum point value for the problem.
                <br><br>
                <b>What is the Challenge Phase?</b><br>
                The Challenge phase only takes place during Rounds 1 and 2. It does not take place during the
                Qualification Round.
                <br><br>
                During the Challenge Phase, you have the opportunity to view the source code submissions of the other
                competitors in your room. If you believe that any of the submissions are flawed, you may challenge the
                submission with a specific test case that you feel will result in that submission returning the wrong
                result. If your challenge is successful, and the submission returns the wrong result, you will be
                awarded 50 points and the competitor will lose the points for the challenged submission. However, if
                your challenge is unsuccessful, and the submission returns the correct result for the test case, you
                will lose 25 points from your score.
                <br><br>
                Be sure to read the <A href="/pl/?&module=Static&d1=google06&d2=instructions">Instructions</A> page for
                a complete explanation.
                <br><br>
                <b>How will I know if I have advanced the next round of the Google Code Jam?</b><br>
                As soon as the Testing Phase has been completed, the advancers to the next round will be posted
                <A href="/pl/?&module=Static&d1=google06&d2=overview">here</A>. In addition, an email will be sent to
                all participants indicating whether or not each has advanced.
                <br><br>
                Questions not addressed here should be directed to
                <A href="mailto:gcj@topcoder.com?subject=Question regarding Google Code Jam">gcj@topcoder.com</A>.
                <br><br>
                Good luck!
                <br><br>
                To find out more detailed information about the Google&#153; Code Jam 2006, please read the
                <a href="/pl/?&module=Static&d1=google06&d2=rules">Terms and Conditions</a>.
                <br><br>
            </div>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <div align="center">
                <jsp:include page="foot.jsp"/>
            </div>
        </td>
    </tr>

</table>
</body>
</html>