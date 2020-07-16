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
<title>全部紅利商品訊息</title>
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

		<%-- 錯誤列表 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤：</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<main>
		<nav aria-label="breadcrumb">
		  <ol class="breadcrumb">
		    <li class="breadcrumb-item active" aria-current="page">紅利商品管理</li>
		  </ol>
		</nav>
	
			<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-12">
					<div class="card alert alert-info">
						<div class="card-header">
							<h1>全部紅利商品查詢</h1>
						</div>
						<div class="card-body">
							<div class="row">
							
	<table>
		<tr>
			<th>紅利商品編號</th>
			<th>商品分類編號</th>
			<th>紅利商品名稱</th>
			<th>所需紅利點數</th>
			<th>紅利商品圖片</th>
			<th>紅利商品描述</th>
			<th>已兌換數量</th>
			<th>現有總庫存</th>
			<th>上架日期</th>
			<th>紅利商品狀態</th>
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
				<td><pre>${bmVO.bon_info}</pre></td>
				<td>${bmVO.bon_exchange}</td>
				<td>${bmVO.bon_stock}</td>
				<td>${bmVO.bon_addDate}</td>
				<td>${(bmVO.bon_status==0)? "上架":"下架"}</td>
				<td>
					<form method="post"
						action="<%=request.getContextPath()%>/BounsMall/BounsMall.do"
						style="margin-bottom: 0px;">
						<input type="hidden" name="bon_id" value="${bmVO.bon_id}">
						<input type="hidden" name="action" value="getOne_For_Update">
						<button type="submit" class="btn btn-outline-info">修改</button>
					</form>
				</td>
				<td>
					<form method="post"
						action="<%=request.getContextPath()%>/BounsMall/BounsMall.do"
						style="margin-bottom: 0px;">
						<input type="hidden" name="bon_id" value="${bmVO.bon_id}">
						<input type="hidden" name="action" value="delete">
						<button type="submit" class="btn btn-outline-danger">刪除</button>

					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	<%@ include file="../../files/page2C.file"%>
	</div>
	
	</div>
	
	</div>
	
	</div>
	
	</div>
	
	</main>
	
</body>
</html>