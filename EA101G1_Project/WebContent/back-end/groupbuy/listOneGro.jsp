<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.groupBuy.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
	GroupBuyVO groupBuyVO = (GroupBuyVO) request.getAttribute("groVO"); //EmpServlet.java(Concroller), �s�Jreq��empVO����
%>

<html>
<head>
<title>���u��� - listOneGro.jsp</title>

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
				<h3>���u��� - ListOneGro.jsp</h3>
				<h4>
					<a href="<%=request.getContextPath()%>/back-end/groupbuy/select_page.jsp"><img src="images/back1.gif"
						width="100" height="32" border="0">�^����</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>���ʮ�ID</th>
			<th>�ӫ~�s��</th>
			<th>�}�l�ɶ�</th>
			<th>�����ɶ�</th>
			<th>���ʴ���</th>
			<th>�馩�@</th>
			<th>�馩�G</th>
			<th>�馩�T</th>
			<th>���ʮת��A</th>
			<th>�H��</th>
			<th>���B</th>
		</tr>
		<tr>
		<td><%=groupBuyVO.getGro_Id()%></td>
		<td><%=groupBuyVO.getP_Id()%></td>
		<td><%=groupBuyVO.getReb1_No()%></td>
		<td><%=groupBuyVO.getReb2_No()%></td>
		<td><%=groupBuyVO.getReb3_No()%></td>
		<td><%=groupBuyVO.getStart_Date()%></td>
		<td><%=groupBuyVO.getEnd_Date()%></td>
		<td><%=groupBuyVO.getGrotime_Date()%></td>
		<td><%=groupBuyVO.getStatus()%></td>
		<td><%=groupBuyVO.getPeople()%></td>
		<td><%=groupBuyVO.getMoney()%></td>
		</tr>
	</table>

</body>
</html>