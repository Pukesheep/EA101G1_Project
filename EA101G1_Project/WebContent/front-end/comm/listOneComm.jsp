<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ page import="com.comm.model.*" %>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
	CommVO commVO = (CommVO) request.getAttribute("commVO");
%>

<html>
<head>
<title>�d����� - listOneComm.jsp</title>

<style>
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
	h4 {
		color: blue;
		display: inline;
	}
	
	table {
		width: 100%;
		background-color: white;
		margin-top: 5px;
		margin-bottom: 5px;
		text-align: center;
	}
	
	td#text {
		text-align: left;
	}
	
	table, th, td {
		padding: 5px;
	}
	/*
	th, td {
		width: 100%;
		height: 100%;
	}
	*/
	body {
		background-color: white;
	}
	img {
		width: 100px;
		height: 32px;
	}
	font {
		color: red;
	}
	#errormsg {
		color: red;
	}
	img#display {
		width: 200px;
		height: 200px;
	}
</style>

</head>
<body>

<h4>�����Ƚm�߱ĥ� Script ���g�k���ȡG</h4>
<table id="table-1">
	<tr>
		<td>
			<h3>�d����� - listOneComm.jsp</h3>
			<h4><a href="<%=request.getContextPath()%>/front-end/comm/select_page.jsp"><img alt="" src="<%=request.getContextPath()%>/images/back1.gif">�^����</a></h4>
		</td>
	</tr>
</table>

<table>
	<tr>
		<th>�d���s��</th>
		<th>�峹�s��</th>
		<th>�|���s��</th>
		<th>�d�����A</th>
		<th>�d�����e</th>
		<th>�̫�ק�ɶ�</th>
		<th>�d���ɶ�</th>
	</tr>
	<tr>
		<td>
			<%=commVO.getComm_id()%>
		</td>
		<td>
			<%=commVO.getPost_id()%>
		</td>
		<td>
			<%=commVO.getMem_id()%>
		</td>
		<td>
			<%=commVO.getC_status()%>
		</td>
		<td>
			<%=commVO.getC_text()%>
		</td>
		<td>
			<%=commVO.getLast_edit()%>
		</td>
		<td>
			<%=commVO.getPost_time()%>
		</td>
		<td>
			<form action="<%=request.getContextPath()%>/comm/comm.do" method="post">
				<input type="submit" value="�ק�">
				<input type="hidden" name="comm_id" value="<%=commVO.getComm_id()%>">
				<input type="hidden" name="action" value="getOne_For_Update">
			</form>
		</td>
	</tr>
</table>

</body>
</html>