<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.immed.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
	ImmedVO immedVO = (ImmedVO) request.getAttribute("immedVO"); //ImmedServlet.java(Concroller), 存入req的immedVO物件
%>

<html>
<head>
<title>直購商品資料 - listOneImmed.jsp</title>
<style>
table {
	border-collapse: collapse;
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

table#table-1 {
	width: 100%;
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

table#table-2 {
	width: 100%
}

table#table-2 img.immed_pic {
	width: 100px;
}

table#table-2 p.immed_name {
	width: 130px;
}

table#table-2 p.immed_desc {
	width: 250px;
	height: 200px;
	overflow: auto;
	text-align: justify;
}

table#table-2 p.rcpt_add {
	width: 100px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

</head>
<body bgcolor='white'>

	<h4>此頁暫練習採用 Script 的寫法取值:</h4>
	<table id="table-1">
		<tr>
			<td>
				<h3>直購商品資料 - ListOneImmed.jsp</h3>
				<h4>
					<a href="select_page.jsp"><img src="images/back1.gif"
						width="100" height="32" border="0">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<table id="table-2">
		<tr>
			<th>商品編號</th>
			<th>賣家編號</th>
			<th>買家編號</th>
			<th>商品種類編號</th>
			<th>商品名稱</th>
			<th>商品上架時間</th>
			<th>商品價格</th>
			<th>商品圖片</th>
			<th>商品描述</th>
			<th>商品售出狀態</th>
			<th>商品下架狀態</th>
			<th>訂單時間</th>
			<th>訂單狀態編號</th>
			<th>收件人姓名</th>
			<th>收件人電話</th>
			<th>收件人地址</th>

		</tr>
		<tr>
			<td>${immedVO.immed_id}</td>
			<td>${immedVO.sale_id}</td>
			<td>${immedVO.buy_id}</td>
			<td>${immedVO.pt_id}</td>
			<td><p class="immed_name">${immedVO.immed_name}</p></td>
			<td><fmt:formatDate value="${immedVO.immed_start}"
					pattern="yyyy-MM-dd HH:mm:ss" /></td>
			<td>$${immedVO.immed_prc}</td>
			<td><img class="immed_pic"
				src="ImmedPicRead?ID=${immedVO.immed_id}"></td>
			<td><p class="immed_desc">${immedVO.immed_desc}</p></td>
			<td>${(immedVO.immed_sold eq 1) ? '已售出' : '未售出'}</td>
			<td>${(immedVO.immed_down eq 1) ? "已下架" : "未下架"}</td>
			<td><fmt:formatDate value="${immedVO.ord_time}"
					pattern="yyyy-MM-dd HH:mm:ss" /></td>
			<td>${immedVO.ordstat_id}</td>
			<td>${immedVO.rcpt_name}</td>
			<td>${immedVO.rcpt_cell}</td>
			<td><p class="rcpt_add">${immedVO.rcpt_add}</p></td>
			<%-- 		<td><%=immedVO.getEname()%></td> --%>
			<%-- 		<td><%=immedVO.getJob()%></td> --%>
			<%-- 		<td><%=immedVO.getHiredate()%></td> --%>
			<%-- 		<td><%=immedVO.getSal()%></td> --%>
			<%-- 		<td><%=immedVO.getComm()%></td> --%>
			<%-- 		<td><%=immedVO.getDeptno()%></td> --%>
		</tr>
	</table>

</body>
</html>