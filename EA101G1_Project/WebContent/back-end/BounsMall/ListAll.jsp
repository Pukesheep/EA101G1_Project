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
	<main>
	
<!-- 		<nav aria-label="breadcrumb"> -->
<!-- 		  <ol class="breadcrumb"> -->
<!-- 		    <li class="breadcrumb-item active" aria-current="page">�������Q�ӫ~�T��</li> -->
<!-- 		  </ol> -->
<!-- 		</nav> -->
	
<!-- 	<div class="container-fluid"> -->
<!-- 			<div class="row justify-content-center"> -->
<!-- 				<div class="col-11"> -->
<!-- 					<div class="card alert alert-info"> -->
<!-- 						<div class="card-header"> -->
<!-- 							<h1>�������Q�ӫ~�T��</h1> -->
<!-- 						</div> -->
<!-- 						<div class="card-body"> -->
<!-- 							<div class="row"> -->
<%-- 								<%@ include file="../../files/page1.file"%> --%>
<%-- 		<c:forEach var="bmVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>" > --%>
	
<!-- 								<div class="col-12"> -->
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	</main>
</body>
</html>