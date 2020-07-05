<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.groupBuy.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
	GroupBuyVO groupBuyVO = (GroupBuyVO) request.getAttribute("groVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<head>
<title>員工資料 - listOneGro.jsp</title>

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

	<h4>此頁暫練習採用 Script 的寫法取值:</h4>
	<table id="table-1">
		<tr>
			<td>
				<h3>員工資料 - ListOneGro.jsp</h3>
				<h4>
					<a href="<%=request.getContextPath()%>/back-end/groupbuy/select_page.jsp"><img src="images/back1.gif"
						width="100" height="32" border="0">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>團購案ID</th>
			<th>商品編號</th>
			<th>開始時間</th>
			<th>結束時間</th>
			<th>團購期間</th>
			<th>折扣一</th>
			<th>折扣二</th>
			<th>折扣三</th>
			<th>團購案狀態</th>
			<th>人數</th>
			<th>金額</th>
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