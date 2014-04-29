<%@ page import="com.jivesoftware.forum.Announcement,
                com.jivesoftware.forum.Forum,
                com.jivesoftware.forum.ForumCategory,
                com.topcoder.web.common.BaseProcessor,
                com.topcoder.web.forums.ForumConstants,
                com.topcoder.web.forums.controller.ForumsUtil,
                java.util.HashMap"
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="user" name="user" type="com.jivesoftware.base.User" toScope="request"/>
<tc-webtag:useBean id="postMode" name="postMode" type="java.lang.String" toScope="request"/>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<%  Announcement announcement = (Announcement)request.getAttribute("announcement");
    ForumCategory forumCategory = (ForumCategory)request.getAttribute("category");
    Forum forum = (Forum)request.getAttribute("forum");
    HashMap errors = (HashMap)request.getAttribute(BaseProcessor.ERRORS_KEY); 
    
    String level2val = "";
    if (forumCategory != null) {
        level2val = forumCategory.getProperty(ForumConstants.PROPERTY_LEFT_NAV_NAME);
    }   %>

<script type="text/javascript">
function noenter(e)
{
    var k = (window.event)? event.keyCode: e.which;
    return !(k == 13);
}

function toggle(targetId)
{
    target = document.getElementById(targetId);
    if (target.style.display == "none") {
        target.style.display="";
    } else {
        target.style.display="none";
    }
}

// IE only
function AllowTabCharacter() {
    if (event != null) {
        if (event.srcElement) {
            if (event.srcElement.value) {
                if (event.keyCode == 9) {  // tab character
                    if (document.selection != null) {
                        document.selection.createRange().text = '\t';
                        event.returnValue = false;
                    } else {
                        event.srcElement.value += '\t';
                        return false;
                    }
                }
            }
        }
    }
}
</script>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

<title>TopCoder Forums</title>
    <jsp:include page="script.jsp" />
        <jsp:include page="/style.jsp">
          <jsp:param name="key" value="tc_forums"/>
        </jsp:include>

</head>

<body>

<jsp:include page="top.jsp" >
    <jsp:param name="level1" value="forums"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
      <td width="180">
          <jsp:include page="includes/global_left.jsp">
             <jsp:param name="node" value="forums"/>
          </jsp:include>
      </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<%  String postHeading = "";
    String postDesc = "";

   if (postMode.equals("New")) {
      postHeading = "New Announcement";
      postDesc = "Create a new announcement";
   } else if (postMode.equals("Edit")) {
      String editSubject = announcement.getSubject();
      if (!editSubject.startsWith("Edit: ")) {
           editSubject = "Edit: " + editSubject;
      }
      postHeading = editSubject;
      postDesc = "Edit announcement";
   } %>

        <td width="100%" class="rtBody">

        <jsp:include page="page_title.jsp" >
            <jsp:param name="image" value="forums"/>
            <jsp:param name="title" value="<%=postDesc%>"/>
        </jsp:include>

<table cellpadding="0" cellspacing="0" class="rtbcTable">
   <tr>
       <td class="rtbc breadcrumbs">
       <%   ForumCategory crumbCategory = forumCategory;
            if (crumbCategory == null) {
                crumbCategory = forumFactory.getRootForumCategory();
            }   %>
       <tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=ForumsUtil.getCategoryTree(crumbCategory)%>'>
            <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtbcLink"><%=category.getName()%></A> <img src="/i/interface/exp_w.gif" align="absmiddle"/>
       </tc-webtag:iterator>
       <%   if (forum != null) { %>
       <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>&mc=<%=forum.getMessageCount()%>" class="rtbcLink"><%=forum.getName()%></A>
       <%   } %>
       <img src="/i/interface/exp_w.gif" align="absmiddle"/> <%=postHeading%>
       </td>
       <!--<td align="right" class="rtbc"><a href="javascript:toggle('Options')" class="rtbcLink">Options</a></td>-->
   </tr>
</table>
<br><div id="Options">Allowed tags: <%=ForumsUtil.getAllowedTagsDisplay()%>. Allowed attributes: <%=ForumsUtil.getAllowedAttributesDisplay()%>. Syntax highlighting is applied to text within [code][/code], [cpp][/cpp], [java][/java], [c#][/c#], [vb][/vb], and [py][/py] blocks. Usernames within [handle][/handle] and [h][/h] blocks are converted into color-coded links.</div><br>

<table cellpadding="0" cellspacing="0" class="rtTable rtTablePost">
<form name="form1" method="post" action="<%=sessionInfo.getServletPath()%>">
    <tc-webtag:hiddenInput name="module"/>
    <tc-webtag:hiddenInput name="<%=ForumConstants.CATEGORY_ID%>"/>
    <tc-webtag:hiddenInput name="<%=ForumConstants.FORUM_ID%>"/>
    <tc-webtag:hiddenInput name="<%=ForumConstants.ANNOUNCEMENT_ID%>"/>
    <tc-webtag:hiddenInput name="<%=ForumConstants.POST_MODE%>"/>

    <tr>
        <td class="rtHeader" colspan="2"><%=postHeading%></td>
    </tr>
    <tr>
        <td class="rtPosterCell" rowspan="2"><div class="rtPosterSpacer">
            <%  if (ForumsUtil.displayMemberPhoto(user, user)) { %>
               <img src="<%=user.getProperty("imagePath")%>" width="61" height="61" border="0" class="rtPhoto" /><br/>
            <%  } %>
            <span class="bodyText"><tc-webtag:handle coderId="<%=user.getID()%>"/></span><br/><A href="?module=History&<%=ForumConstants.USER_ID%>=<%=user.getID()%>"><%=ForumsUtil.display(forumFactory.getUserMessageCount(user), "post")%></A></div>
        </td>
        <td class="rtTextCell100">
            <%  if (errors.get(ForumConstants.ANNOUNCEMENT_SUBJECT) != null) { %><span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.ANNOUNCEMENT_SUBJECT%>"><%=err%><br/></tc-webtag:errorIterator></span><% } %>
            <b>Subject:</b><br/><tc-webtag:textInput size="60" name="<%=ForumConstants.ANNOUNCEMENT_SUBJECT%>" escapeHtml="false" onKeyPress="return noenter(event)"/><br/><br/>
            <%  if (errors.get(ForumConstants.ANNOUNCEMENT_BODY) != null) { %><span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.ANNOUNCEMENT_BODY%>"><%=err%><br/></tc-webtag:errorIterator></span><% } %>
            <b>Body:</b><font color="red"><span align="left" id="Warning" style="display: none"><br/>Warning: one or more &lt;pre&gt; tags is not closed.</span></font>
            <br/><tc-webtag:textArea id="tcPostArea" rows="15" cols="72" name="<%=ForumConstants.ANNOUNCEMENT_BODY%>" onKeyDown="AllowTabCharacter()"/>


            <c:if test="${isNewStyle}">
                <div class="rtFooter">
                    <a onclick="form1.module.value='PostAnnouncement';form1.submit();" class="btn" href="javascript:;" alt="Post">Post</a>

                    <a onclick="form1.module.value='PreviewAnnouncement';form1.submit();" class="btn btnBlue" href="javascript:;" alt="Preview">Preview</a>

                    <%    String cancelLink = "?module=Main";
                        if (forum != null) {
                            cancelLink = "?module=ThreadList&"+ForumConstants.FORUM_ID+"="+forum.getID();
                        } else if (forumCategory != null) {
                            cancelLink = "?module=Category&"+ForumConstants.CATEGORY_ID+"="+forumCategory.getID();
                        } %>
                    <a href="<%=cancelLink%>" class="btn btnBlue">Cancel</a>
                </div>
            </c:if>


        </td>
    </tr>

    <c:if test="${!isNewStyle}">
        <tr>
            <td class="rtFooter">
                <input type="image" src="/i/roundTables/post.gif" class="rtButton" alt="Post" onclick="form1.module.value='PostAnnouncement'"/>
                <input type="image" src="/i/roundTables/preview.gif" class="rtButton" alt="Preview" onclick="form1.module.value='PreviewAnnouncement'"/>
                <%    String cancelLink = "?module=Main";
                if (forum != null) {
                    cancelLink = "?module=ThreadList&"+ForumConstants.FORUM_ID+"="+forum.getID();
                } else if (forumCategory != null) {
                    cancelLink = "?module=Category&"+ForumConstants.CATEGORY_ID+"="+forumCategory.getID();
                } %>
                <a href="<%=cancelLink%>"><img src="/i/interface/btn_cancel.gif" alt="Cancel"/></a>
            </td>
        </tr>
    </c:if>
</form>
</table>

<%  if (postMode.equals("Edit")) { %>
        <span class="bodySubtitle">Original Announcement</span><br/>
        <table cellpadding="0" cellspacing="0" class="rtTable">
            <tr>
                <td class="rtHeader" colspan="2">
                    <a name=<%=announcement.getID()%>><tc-webtag:format object="${announcement.startDate}" format="MMM d, yyyy 'at' h:mm a z" timeZone="${sessionInfo.timezone}"/> | <%=announcement.getSubject()%></a>
                </td>
            </tr>
            <tr>
                <td class="rtPosterCell" rowspan="2"><div class="rtPosterSpacer">
                <%  if (ForumsUtil.displayMemberPhoto(user, announcement.getUser())) { %>
                    <img src="<%=announcement.getUser().getProperty("imagePath")%>" width="61" height="61" border="0" class="rtPhoto" /><br/>
                <%  } %>
                <span class="bodyText"><tc-webtag:handle coderId="<%=announcement.getUser().getID()%>"/></span><br/><A href="?module=History&<%=ForumConstants.USER_ID%>=<%=announcement.getUser().getID()%>"><%=ForumsUtil.display(forumFactory.getUserMessageCount(announcement.getUser()), "post")%></A></div></td>
                <td class="rtTextCell100"><%=announcement.getBody()%></td>
            </tr>
        </table>
<%  } %>
<font color="red"><div align="left" id="Warning" style="display: none">Warning: one or more &lt;pre&gt; tags is not closed.</div></font>

<div style="clear:both;">&nbsp;</div>

        </td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>
