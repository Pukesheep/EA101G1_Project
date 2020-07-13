<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.FavoriteBouns.model.*" %>

<%
	FBService fbSvc = new FBService();
	List<FBVO> list = fbSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<jsp:useBean id="bmSvc" scope="page" class="com.BounsMall.model.BMService"/>

<html>
<head>
	<title>�����̷R���Q�d��</title>
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
				<h3>�����̷R���Q�d�� - /back-end/ListAll.jsp</h3>
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
	
	<table>
		<tr>
			<th>�|��</th>
			<th>���Q�ӫ~</th>
			<th>������ʧ@</th>
		</tr>
		
		<%@ include file="../../files/page1.file" %>
		<c:forEach var="fbVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
			<tr>
				<td>
					<a href="<%=request.getContextPath()%>/FavoriteBouns/FBServlet.do?action=getAllByMember&mem_id=${fbVO.mem_id}"
						>${fbVO.mem_id}</a>
				</td>
				<td>${bmSvc.getByPK(fbVO.bon_id).bon_name}</td>
				<td>
					<form method="post" action="<%=request.getContextPath()%>/FavoriteBouns/FBServlet.do" style="margin-bottom: 0px;">
						<input type="hidden" name="mem_id" value="${fbVO.mem_id}">
						<input type="hidden" name="bon_id" value="${fbVO.bon_id}">
						<input type="hidden" name="action" value="delete" >
						<input type="submit" value="�R��" >
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="../../files/page2.file" %>
	
</body>
</html>