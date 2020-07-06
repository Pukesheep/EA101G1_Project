<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.BounsOrder.model.*" %>

<%
	BOVO boVO = (BOVO) request.getAttribute("boVO");
%>

<jsp:useBean id="memSvc" scope="page" class="com.member.model.MemberService" />
<jsp:useBean id="bmSvc" scope="page" class="com.BounsMall.model.BMService" />

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>�s�W���Q�q��</title>

	<title>�����q��d��</title>
	<style>
		table#table-1 {
			width: 450px;
			background-color: #CCCCFF;
			margin-top: 5px;
			margin-bottom: 10px;
			border: 3px ridge Gray;
			height: 80px;
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
			width: 800px;
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
	<table id="table-1">
		<tr>
			<td>
				<h3>�����q��d�� - /back-end/ListAll.jsp</h3>
				<h4>
					<a href="<%=request.getContextPath()%>/back-end/BounsOrder/select_page.jsp">
						<img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
				</h4>
			</td>
		</tr>
	</table>
	
<!-- 	���~�C�� -->
	<c:if test="">
		<font style="color:red">�Эץ��H�U���~�G</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	
	<form method="post" action="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do" name="form1" >
		<table>
			<tr>
				<td>��ܷ|���G</td>
				<td>
					<select size="1" name="mem_id">
						<c:forEach var="memVO" items="${memSvc.all}" >
							<option value="${memVO.mem_id}"
								${(boVO.mem_id==memVO.mem_id)? 'select':'' } >${memVO.mem_name}
						</c:forEach>
					</select>
				</td>
			</tr>
			
			<tr>
				<td>��ܰӫ~�G</td>
				<td>
					<select size="1" name="bon_id">
						<c:forEach var="bmVO" items="${bmSvc.all}">
							<option value="${bmVO.bon_id}"
								${(boVO.bon_id==bmVO.bon_id)? 'select':''} >${bmVO.bon_name}
						</c:forEach>
					</select>
				</td>
			</tr>
			
		</table>
		<br>
		<input type="hidden" name="action" value="insert">
		<input type="submit" value="�e�X�s�W" >
	</form>
	
</body>
</html>