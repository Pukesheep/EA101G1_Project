<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.comm.model.*" %>

<%--
	�H�d�����D��, ���X�g�d���N�|���X�g�������峹
 --%>

<%
	CommService commSvc = new CommService();
	java.util.List<CommVO> list = commSvc.getAll();
	pageContext.setAttribute("list", list);
%>
<jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService" />

<html>
<head>
<title>�Ҧ��d����� - listAllComm.jsp</title>

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
	tr.tr1 {
		border: 1px solid red;
	}
	tr.tr2 {
		border: 1px solid blue;
	}
</style>

</head>
<body>

<h4>�����m�߱ĥ� EL ���g�k����</h4>
<table id="table-1">
	<tr>
		<td>
			<h3>�Ҧ��d����� - listAllComm.jsp</h3>
			<h4>
				<a href="<%=request.getContextPath()%>/front-end/comm/select_page.jsp"><img alt="" src="<%=request.getContextPath()%>/images/back1.gif">�^����</a>
			</h4>
		</td>
	</tr>
</table>

<%-- ���~�C�� --%>
<c:if test="${not empty errorMsgs}">
	<font>�Эץ��H�U���~</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li id="errormsg">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>�d���s��</th>
		<th>�峹�s��</th>
		<th>�d���|���s��</th>
		<th>�d���|���W��</th>
		<th>�d�����A</th>
		<th>�d�����e</th>
		<th>�d���̫�ק�ɶ�</th>
		<th>�d���ɶ�</th>
	</tr>
<%@ include file="../../files/page1.file" %>
	<c:forEach var="commVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>" >
		<tr>
		
			<td>
				${commVO.comm_id}
			</td>
			<td>
				${commVO.post_id}
			</td>
			<td>
				${commVO.mem_id}
			</td>
			<td>
				<c:forEach var="memberVO" items="${memberSvc.all}">
					<c:if test="${commVO.mem_id == memberVO.mem_id}">
						${memberVO.mem_name}
					</c:if>
				</c:forEach>
			</td>
			<td>
				${commVO.c_status}
			</td>
			<td>
				${commVO.c_text}
			</td>
			<td>
				${commVO.last_edit}
			</td>
			<td>
				${commVO.post_time}
			</td>
			<td>
				<form action="<%=request.getContextPath()%>/comm/comm.do" method="post">
					<input type="submit" value="�ק�">
					<input type="hidden" name="comm_id" value="${commVO.comm_id}">
					<input type="hidden" name="action" value="getOne_For_Update">
				</form>
			</td>
			<td>
				<form action="<%=request.getContextPath()%>/comm/comm.do" method="post">
					<input type="submit" value="�R��">
					<input type="hidden" name="comm_id" value="${commVO.comm_id}">
					<input type="hidden" name="action" value="delete">
				</form>
			</td>
			
		</tr>
	
	</c:forEach>

</table>

<%@ include file="../../files/page2.file" %>

</body>
</html>