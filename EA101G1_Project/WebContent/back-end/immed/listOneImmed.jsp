<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.immed.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
	ImmedVO immedVO = (ImmedVO) request.getAttribute("immedVO"); //ImmedServlet.java(Concroller), �s�Jreq��immedVO����
%>

<html>
<head>
<title>���ʰӫ~��� - listOneImmed.jsp</title>
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

	<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4>
	<table id="table-1">
		<tr>
			<td>
				<h3>���ʰӫ~��� - ListOneImmed.jsp</h3>
				<h4>
					<a href="select_page.jsp"><img src="images/back1.gif"
						width="100" height="32" border="0">�^����</a>
				</h4>
			</td>
		</tr>
	</table>

	<table id="table-2">
		<tr>
			<th>�ӫ~�s��</th>
			<th>��a�s��</th>
			<th>�R�a�s��</th>
			<th>�ӫ~�����s��</th>
			<th>�ӫ~�W��</th>
			<th>�ӫ~�W�[�ɶ�</th>
			<th>�ӫ~����</th>
			<th>�ӫ~�Ϥ�</th>
			<th>�ӫ~�y�z</th>
			<th>�ӫ~��X���A</th>
			<th>�ӫ~�U�[���A</th>
			<th>�q��ɶ�</th>
			<th>�q�檬�A�s��</th>
			<th>����H�m�W</th>
			<th>����H�q��</th>
			<th>����H�a�}</th>

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
			<td>${(immedVO.immed_sold eq 1) ? '�w��X' : '����X'}</td>
			<td>${(immedVO.immed_down eq 1) ? "�w�U�[" : "���U�["}</td>
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