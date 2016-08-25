<%@ taglib uri="http://pcc-logins" prefix="pcc" %>
<%@ page import="edu.pima.cascade.loginReport.LoginReportHelper" %>

<%
	int days = LoginReportHelper.parseDays(request.getParameter("days"));
%>

<html>
	<head>
		<title>Cascade Login Report</title>
		<link rel="stylesheet" type="text/css" href="report.css" />
	</head>
	<body>
		<h1>Cascade Login Report</h1>
								
		<p>Showing login information for the last <strong><%= days %></strong> days.</p>
		<form method="POST" action="index.jsp">
			<label>Change number of days: <input type="text" name="days" size="3" value="<%= days%>"</label>
			<br />
			<input type="submit" />
		</form>
		<hr />
		<%-- ********************************************************************************************************** --%>
		
			<h2>Failed Logins</h2>
			<pcc:drawLogins days="<%= days %>" wantFailed="true" />
		
		<%-- ****************************************************************************************************** --%>
		
			<h2>Successful Logins</h2>			
			<pcc:drawLogins days="<%= days %>" wantFailed="false" />
		
		<%-- *********************************************************************************************************** --%>
		<hr />
			<h2>FAQ</h2>
			<p>
				What does it mean if one of the usernames is "<em><%= LoginReportHelper.BLOCKED_USERNAME %></em>"?
			</p>						
			<p>
				One or more usernames contained special characters that might not be safe to display to you on this page.
				The total number attempts with strange characters is listed with <%= LoginReportHelper.BLOCKED_USERNAME %>.
				These weird usernames could be innocent typos, or somebody purposely trying to put garbage into the system.
				If you really need to know the suspicious value(s), 
				contact <a href="mailto:webmaster@pima.edu">DO Web Systems</a>.
			</p>
	</body>
</html>
