<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.rebate.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
      RebateVO rebateVO = (RebateVO) request.getAttribute("rebVO"); //EmpServlet.java(Concroller), �s�Jreq��empVO����
%>

<html>
<head>
<title>���u��� - listOneReb.jsp</title>

<style>
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

<style>
table {
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 5px;
	text-align: center;
}
</style>

</head>
<body bgcolor='white'>

	<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4>
	<table id="table-1">
		<tr>
			<td>
				<h3>���u��� - ListOneGromem.jsp</h3>
				<h4>
					<a href="<%=request.getContextPath()%>/back-end/rebate/select_page.jsp"><img src="images/back1.gif"
						width="100" height="32" border="0">�^����</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>�ŶZ�s��</th>
			<th>�馩���</th>
			<th>�H��</th>
			
		</tr>
		<tr>
			<td><%=rebateVO.getReb_No()%></td>
			<td><%=rebateVO.getDiscount()%></td>
			<td><%=rebateVO.getPeople()%></td>
			
		</tr>
	</table>

</body>
</html>