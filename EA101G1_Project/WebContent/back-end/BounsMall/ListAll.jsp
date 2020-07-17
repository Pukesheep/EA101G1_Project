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

	<main>
		<nav aria-label="breadcrumb">
		  <ol class="breadcrumb">
		    <li class="breadcrumb-item active" aria-current="page">���Q�ӫ~�޲z</li>
		  </ol>
		</nav>
	
			<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-12">
					<div class="card alert alert-info">
						<div class="card-header">
				<div class="alert alert-success" role="alert">
							<h1>�������Q�ӫ~�d��</h1>
							
						</div>
						<div class="card-body">
							<div class="row">
							
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
			<th>���Q�ӫ~���A</th>
			<th colspan="2"></th>
		</tr>
		<%@ include file="../../files/page1.file"%>
		<c:forEach var="bmVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>" >
			<tr>
				<th>${bmVO.bon_id}</th>
				<th>${bmVO.pt_id}</th>
				<th>${bmVO.bon_name}</th>
				<th>${bmVO.bon_price}</th>
				<th><img src="<%=request.getContextPath()%>/BounsMall/ImageServlet.do?bon_id=${bmVO.bon_id}"id="display"></th>
				<th><pre>${bmVO.bon_info}</pre></th>
				<th>${bmVO.bon_exchange}</th>
				<th>${bmVO.bon_stock}</th>
				<th>${bmVO.bon_addDate}</th>
				<th>${(bmVO.bon_status==0)? "�W�[":"�U�["}</th>
				<th>
					<form method="post"
						action="<%=request.getContextPath()%>/BounsMall/BounsMall.do"
						style="margin-bottom: 0px;">
						<input type="hidden" name="bon_id" value="${bmVO.bon_id}">
						<input type="hidden" name="action" value="getOne_For_Update">
						<button type="submit" class="btn btn-outline-info">�ק�</button>
					</form>				
				<td><th>			
					<form method="post"
						action="<%=request.getContextPath()%>/BounsMall/BounsMall.do"
						style="margin-bottom: 0px;">
						<input type="hidden" name="bon_id" value="${bmVO.bon_id}">
						<input type="hidden" name="action" value="delete">
						<button type="submit" class="btn btn-outline-danger">�R��</button>
	</td></th>
					</form>
				</th>
			</tr>
		</c:forEach>
	</table>
	</div>
	<%@ include file="../../files/page2C.file"%>
	</div>
	
	</div>
		<%-- ���~�C�� --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~�G</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	</div>
	
	</div>
	
	</div>
	
	</main>
	
</body>
</html>