<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template name="tccc03_links">

            <table border="0" cellspacing="0" cellpadding="0" width="100%" id="tccc_bkgd">
                <tr valign="top">
                    <td width="1"><a href="/?&amp;t=tournaments&amp;c=tccc03_sched"><img src="/i/tournament/tccc03/tccc03_home.gif" alt="" width="110" height="90" border="0" /></a></td>
                    <td valign="middle" class="statText" width="99%">
                        <p><img src="/i/clear.gif" alt="" width="1" height="5" border="0" /><br />
                        Welcome to our third annual programming tournament for college students, now open to any collegiate coder in the world, regardless of their country of 
                        residence. Invitations will be given to the top 200 coders in each of five regions. Online elimination rounds begin on February 18th. The final field of 
                        16 coders will be brought to the University Hotel @ MIT in Cambridge, MA where they will compete head-to-head on April 4th and 5th. The total prize 
                        purse for this tournament is $100,000 and the winner will receive $50,000.</p>
                        
                        <p>
                        <xsl:choose>
                            <xsl:when test="/TC/LoggedIn='true'">
                                <strong>Sign up</strong> by clicking on the sign-up link on your <a href="/?&amp;t=home&amp;c=home" class="statText">member home page.</a>  
                            </xsl:when>
                        
                            <xsl:otherwise>
                                <strong>Sign up</strong> by clicking on the sign-up link on your <a href="/?&amp;t=authentication&amp;c=login" class="statText">member home page.</a>  
                            </xsl:otherwise>
                        </xsl:choose><br />
                        <img src="/i/clear.gif" alt="" width="1" height="5" border="0" /></p>
                    </td>
                    <td width="1"><a href="/?&amp;t=tournaments&amp;c=tccc03_sched"><img src="/i/tournament/tccc03/sun03_home.gif" alt="Sun Microsystems" width="135" height="90" border="0" /></a></td>
                </tr>
                <tr><td width="100%" colspan="3"><img src="/i/clear.gif" alt="" width="10" height="10" border="0" /></td></tr>
                <tr>
                    <td width="100%" colspan="3">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="statTextBig" width="49%"><img src="/i/clear.gif" alt="" width="10" height="21" border="0" /></td>
                                <td class="statTextBig" width="1"><a href="/index?t=tournaments&amp;c=tccc03_sched" class="statTextBig"><img src="/i/tournament/tabScheduleOff.gif" alt="Schedule" width="85" height="21" border="0" /></a></td>
                                <td class="statTextBig" width="1"><a href="/index?t=tournaments&amp;c=tccc03_competitors" class="statTextBig"><img src="/i/tournament/tabCompetitorsOff.gif" alt="Competitors" width="104" height="21" border="0" /></a></td>
                                <td class="statTextBig" width="1"><a href="/index?t=tournaments&amp;c=tccc03_regions" class="statTextBig"><img src="/i/tournament/tabRegionsOff.gif" alt="Regions" width="77" height="21" border="0" /></a></td>
                                <td class="statTextBig" width="1"><a href="/index?t=tournaments&amp;c=tccc03_schools" class="statTextBig"><img src="/i/tournament/tabSchoolsOff.gif" alt="Schools Represented" width="158" height="21" border="0" /></a></td>
                                <td class="statTextBig" width="1"><a href="/index?t=tournaments&amp;c=tccc03_rules_overview" class="statTextBig"><img src="/i/tournament/tabRulesOff.gif" alt="Rules" width="63" height="21" border="0" /></a></td>
                                <td class="statTextBig" width="49%"><img src="/i/clear.gif" alt="" width="10" height="21" border="0" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            
<!--                <tr>
		<td width="25%" align="center" valign="middle" height="16" class="statTextBig" background="/i/steel_bluebv_bg.gif">
			<xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='tccc03_regions'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='tccc03_regions_ne'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='tccc03_regions_se'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='tccc03_regions_w'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='tccc03_regions_mw'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='tccc03_regions_ne32'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='tccc03_regions_se32'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='tccc03_regions_w32'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='tccc03_regions_mw32'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='tccc03_regions_ne128'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='tccc03_regions_se128'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='tccc03_regions_w128'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='tccc03_regions_mw128'">orangebv_bg</xsl:when>

			<xsl:otherwise>steel_bluebv_bg</xsl:otherwise></xsl:choose>.gif</xsl:attribute>		
		<a href="/index?t=tournaments&amp;c=tccc03_regions" class="statTextBig">Regions</a></td>
		<td width="25%" align="center" valign="middle" height="16" class="statTextBig" background="/i/steel_bluebv_bg.gif">

			<xsl:attribute name="BACKGROUND">/i/<xsl:choose><xsl:when test="/TC/Command='tccc03_sched'">orangebv_bg</xsl:when><xsl:otherwise>steel_bluebv_bg</xsl:otherwise></xsl:choose>.gif</xsl:attribute>		
		<a href="/index?t=tournaments&amp;c=tccc03_sched" class="statTextBig">Schedule</a></td>
		<td width="25%" align="center" valign="middle" height="16" class="statTextBig">
			<xsl:attribute name="BACKGROUND">/i/<xsl:choose><xsl:when test="/TC/Command='tccc03_rules_overview'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='tccc03_rules_about'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='tccc03_rules_scoring'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='tccc03_rules_conditions'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='tccc03_rules_prizes'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='tccc03_rules_onsite'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='tccc03_rules_structure'">orangebv_bg</xsl:when>
			<xsl:otherwise>steel_bluebv_bg</xsl:otherwise></xsl:choose>.gif</xsl:attribute>	
                        <a href="/index?t=tournaments&amp;c=tccc03_rules_overview" class="statTextBig">Rules</a>
                    </td>
                </tr>
            </table> -->

</xsl:template>
</xsl:stylesheet>
