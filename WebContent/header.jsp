<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="org.faithfarm.domain.SystemUser" %>

<% SystemUser user = (SystemUser)session.getAttribute("USER_"+session.getId()); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link href="styles/style.css" rel="stylesheet" type="text/css" />
<style>
    .dotted {border: 1px dotted #456879; border-style: none none dotted; color: #fff; background-color: #fff; }
</style>
</head>
  
<body topmargin="0" leftmargin="0" bgcolor="#383838">
 
<table width="100%" cellpadding="0" cellspacing="0">
<tr>
<td width="25%"></td>
<td width="750">
		<table width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td width="100%" align="center" border="0" bgcolor="#FFFFFF">
					<div id="navigation">
                    <%
					if (user.getUserRole().equals("ADMIN")) {
					%>
                    <ul>
		            	<li><a href="index.html">Home</a></li>
		                <li><a href="navigation.html">New Ticket</a></li>
						<li><a href="navigation.html">View/Edit Ticket</a></li>
		                <li><a href="navigation.html">Ticket Levels</a></li>
                        <li><a href="navigation.html">User Accounts</a></li>
						<li><a href="<%=request.getContextPath()%>/login?action=logout">Logout</a></li>
					</ul>
                    <%
					}
					if (user.getUserRole().equals("AGENT")) {
					%>
                    <ul>
		            	<li><a href="index.html">Home</a></li>
		                <li><a href="navigation.html">New Ticket</a></li>
						<li><a href="navigation.html">View/Edit Ticket</a></li>
		                <li><a href="navigation.html">Call Log</a></li>
						<li><a href="<%=request.getContextPath()%>/login?action=logout">Logout</a></li>
					</ul>
                    <% } %>
					
				</div>    
				</td>
			</tr>
			<tr>
            	<td height="20" bgcolor="#FFFFFF"></td>
            </tr>