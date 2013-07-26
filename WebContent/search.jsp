<%@ page import="org.faithfarm.dispatch.DispatchServlet" %>
<%@ page import="org.faithfarm.domain.Donation" %>
<%@ page import="org.faithfarm.domain.Donor" %>
<%@ page import="org.faithfarm.domain.Address" %>
<%@ page import="java.util.ArrayList" %>

<%

	String required = "<img src='images/required.png'/>"; 
    String f1Err = (String)request.getAttribute("field1Err");
	String f2Err = (String)request.getAttribute("field2Err");
	if (f1Err==null) f1Err="";
	if (f2Err==null) f2Err="";
	
	ArrayList results = (ArrayList)session.getAttribute("RESULTS_"+session.getId());
	if (results==null) results=new ArrayList();
	
%>
<jsp:include page="header.jsp" flush="true"/>

<style type="text/css">

.tcalInput {
  background: #c3ccd0 url('images/cal.gif') 100% 50% no-repeat;
  border:1px solid #7e93b0;
	border-radius:2px;
	height: 10px;
	background-color:#e0e9f6;
	font: italic 10px Arial;
	color: #7e93b0;
}

</style>

<form method="POST" action="<%=request.getContextPath()%>/ticket"> 
<tr>
 			<td bgcolor="#ffffff" align="center"><br /><br />
            <table width="800" cellpadding="0" cellspacing="0" border="0">
			 <tr>
            	<td align="center" bgcolor="#FFFFFF" >
                       <table width="800" cellpadding="0" cellspacing="0" border="0" class="grid">
                        	 <tr>
                            	<td colspan="9" height="25" bgcolor="#6699cc">&nbsp;&nbsp;Donations</td>
                            </tr>   
                            <tr>
                            	<td width="440" height="23" valign="center" background="images/searchGroupBk.png" class="searchMenuHeader">
                                		<input type="text" name="lastname" size="25" maxlength="20" value="lastname" class="textboxSearch" onfocus="javascript:this.value='';"/>
                                        <input type="text" name="firstname" size="20" maxlength="20" value="firstname" class="textboxSearch" onfocus="javascript:this.value='';"/>
                                        <input type="text" name="confirmation" size="15" maxlength="15" value="confirmation#" class="textboxSearch" onfocus="javascript:this.value='';"/> 
                                        <input type="text" name="dispatchDate" size="30" maxlength="10" value="date" class="tcal" onfocus="javascript:this.value='';"/>
                                         </td>
                                <td colspan="7" align="left" valign="center" background="images/searchGroupBk.png" class="searchMenuHeader">
                                	<input type="submit" name="action" value="SearchTickets" class="imageButtonSearch" title="Search Tickets" />
                                </td>
                                <!--
                                <td valign="top" width="65" background="images/searchGroupBk.png" class="searchMenuHeader">
                                	<input type="submit" name="action" value="PrintTicket" class="imageButtonSearchPrint" title="Print Tickets" /> 
                                </td>
                                <td width="3" valign="top" background="images/searchGroupBk.png" style="padding-top:4px;"><img src="images/searchSpacer.png"/>&nbsp;</td>
                                <td valign="top" width="65" background="images/searchGroupBk.png" class="searchMenuHeader" >
                                	<input type="submit" name="action" value="ExportTicket" class="imageButtonSearchExport" title="Export Tickets" /> 
                                </td>
                                <td width="3" valign="top" background="images/searchGroupBk.png" style="padding-top:2px;"><img src="images/searchSpacer.png"/>&nbsp;</td>
                                <td height="23" background="images/searchGroupBk.png" colspan="3">&nbsp;</td>
                                <td width="1" height="25" background="images/searchGroupSeparator.png"></td>
                                <td width="120" height="25" background="images/searchGroupBk.png"></td>
                                <td width="1" height="25" background="images/searchGroupSeparator.png"></td>
                                <td width="120" height="25" background="images/searchGroupBk.png"></td>
                                <td width="1" height="25" background="images/searchGroupSeparator.png"></td>
                                <td width="120" height="25" background="images/searchGroupBk.png"></td>
                                <td width="1" height="25" background="images/searchGroupSeparator.png"></td>
                                <td width="120" height="25" background="images/searchGroupBk.png"></td>
                                -->
                            </tr>
                  			<tr>
                            	<td colspan="9">
                                    <table width="800" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="90" height="18" background="images/searchHeaderBk.png" class="searchFieldHeader">CONFIRMATION</td>
                                            <td width="3" height="18" background="images/searchHeaderSpacer.png"></td>
                                            <td width="150" height="18" background="images/searchHeaderBk.png" class="searchFieldHeader">DONOR</td>
                                            <td width="3" height="18" background="images/searchHeaderSpacer.png"></td>
                                            <td width="120" height="18" background="images/searchHeaderBk.png" class="searchFieldHeader">PICKUP DATE</td>
                                            <td width="3" height="18" background="images/searchHeaderSpacer.png"></td>
                                            <td width="100" height="18" background="images/searchHeaderBk.png" class="searchFieldHeader">ZIPCODE</td>
                                            <td width="3" height="18" background="images/searchHeaderSpacer.png"></td>
                                            <td width="70" height="18" background="images/searchHeaderBk.png" class="searchFieldHeader">SPECIAL</td>
                                            <td width="3" height="18" background="images/searchHeaderSpacer.png"></td>
                                            <td width="70" height="18" background="images/searchHeaderBk.png" class="searchFieldHeader">STATUS</td>
                                            <td width="3" height="18" background="images/searchHeaderSpacer.png"></td>
                                            <td height="18" background="images/searchHeaderBk.png" class="searchFieldHeader">AGENT</td>
                                        </tr>
                                        <%
										for (int i=0;i<results.size();i++) {
											Donation d = (Donation)results.get(i);
											Donor donor = d.getDonor();
											Address addy = d.getAddress();
										%>
                                         <tr>
                                            <td colspan="2" class="searchFieldResult"><img src="images/pending.png"/><a href=""><%=d.getConfirmation() %></a></td>
                                            <td colspan="2" class="searchFieldResult"><%=donor.getLastname() %>,&nbsp;<%=donor.getFirstname() %></td>
                                            <td colspan="2" class="searchFieldResult"><%=d.getDispatchDate() %></td>
                                            <td colspan="2" class="searchFieldResult"><%=addy.getZipcode() %></td>
                                            <td colspan="2" class="searchFieldResult"><%=d.getSpecialFlag() %></td>
                                            <td colspan="2" class="searchFieldResult"><%=d.getStatus() %></td>
                                            <td class="searchFieldResult"><%=d.getCreatedBy() %></td>
                                        </tr>
                                        <% } %>
                                        <!--<tr>
                                            <td colspan="2" class="searchFieldResult"><img src="images/cancelled.png"/>539098</td>
                                            <td colspan="2" class="searchFieldResult">sfddsf</td>
                                            <td colspan="2" class="searchFieldResult">06/12/1973</td>
                                            <td colspan="2" class="searchFieldResult">ZIPCO32347DE</td>
                                            <td colspan="2" class="searchFieldResult">No</td>
                                            <td colspan="2" class="searchFieldResult">Cancelled</td>
                                            <td class="searchFieldResult">Agent1</td>
                                        </tr>-->
                                       
                                    </table>
                                 </td>
                             </tr>
                             
                        </table>
                  </td>
            </tr>
            </table>
            </td> 
           </form> 
</tr>     
<jsp:include page="footer.jsp" flush="true"/>
