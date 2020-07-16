<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.BounsMall.model.*"%>

<%
	BMService bmSvc = new BMService();
	List<BMVO> list = bmSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>�������Q�ӫ~�T��</title>
<%@ include file="/back-end/css/BackHeaderCssLink"%>
<style>
	img#display {
		width: 200px;
		height: 200px;
	}
</style>

</head>
<body bgcolor='white'>
	
	<!-- header -->
	<%@ include file="/back-end/css/header.jsp"%>
	<!-- header -->
	<div class="content d-md-flex">
	<!-- aside -->
	<%@ include file="/back-end/css/aside.jsp"%>
	<!-- aside -->
		
	<%-- ���~�C�� --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~�G</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	
	<table>
		<tr>
			<th>���Q�ӫ~�s��</th>
			<th>�ӫ~�����s��</th>
			<th>���Q�ӫ~�W��</th>
			<th>�һݬ��Q�I��</th>
			<th>���Q�ӫ~�Ϥ�</th>
			<th>���Q�ӫ~�y�z</th>
			<th>�w�I���ƶq</th>
			<th>�{���`�w�s</th>
			<th>�W�[���</th>
			<th>���Q�ӫ~�W�[���A</th>
			<th colspan="2">�����椧�ʧ@</th>
		</tr>
		<%@ include file="../../files/page1.file"%>
		<c:forEach var="bmVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>" >
			<tr>
				<td>${bmVO.bon_id}</td>
				<td>${bmVO.pt_id}</td>
				<td>${bmVO.bon_name}</td>
				<td>${bmVO.bon_price}</td>
				<td><img
					src="<%=request.getContextPath()%>/BounsMall/ImageServlet.do?bon_id=${bmVO.bon_id}"
					id="display"></td>
				<td><pre>${bmVO.bon_info}</pre></td>
				<td>${bmVO.bon_exchange}</td>
				<td>${bmVO.bon_stock}</td>
				<td>${bmVO.bon_addDate}</td>
				<td>${(bmVO.bon_status==0)? "�W�[":"�U�["}</td>
				<td>
					<form method="post"
						action="<%=request.getContextPath()%>/BounsMall/BounsMall.do"
						style="margin-bottom: 0px;">
						<input type="hidden" name="bon_id" value="${bmVO.bon_id}">
						<input type="hidden" name="action" value="getOne_For_Update">
						<input type="submit" value="�ק�">
					</form>
				</td>
				<td>
					<form method="post"
						action="<%=request.getContextPath()%>/BounsMall/BounsMall.do"
						style="margin-bottom: 0px;">
						<input type="hidden" name="bon_id" value="${bmVO.bon_id}">
						<input type="hidden" name="action" value="delete"> <input
							type="submit" value="�R��">
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="../../files/page2.file"%>
</body>
</html>