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
<title>全部紅利商品訊息</title>
<%@ include file="/back-end/css/BackHeaderCssLink"%>
<style>
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-2 h4 {
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
		<div class="table-responsive">
			<table id="table-1" >
				<tr>
					<td>
						<h3>所有紅利商品資料</h3>
					</td>
				</tr>
			</table>

			<%-- 錯誤列表 --%>
			<c:if test="${not empty errorMsgs}">
				<font style="color: red">請修正以下錯誤：</font>
				<ul>
					<c:forEach var="message" items="${errorMsgs}">
						<li style="color: red">${message}</li>
					</c:forEach>
				</ul>
			</c:if>

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
					<th>紅利商品上架狀態</th>
					<th colspan="2">欲執行之動作</th>
				</tr>
				<%@ include file="../../files/page1.file"%>
				<c:forEach var="bmVO" items="${list}" begin="<%=pageIndex%>"end="<%=pageIndex+rowsPerPage-1%>">
					<tr>
						<td>${bmVO.bon_id}</td>
						<td>${bmVO.pt_id}</td>
						<td>${bmVO.bon_name}</td>
						<td>${bmVO.bon_price}</td>
						<td><img
							src="<%=request.getContextPath()%>/BounsMall/ImageServlet.do?bon_id=${bmVO.bon_id}"
							id="display"></td>
						<td id="info">${bmVO.bon_info}</td>
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
								<input type="submit" value="修改">
							</form>
						</td>
						<td>
							<form method="post"
								action="<%=request.getContextPath()%>/BounsMall/BounsMall.do"
								style="margin-bottom: 0px;">
								<input type="hidden" name="bon_id" value="${bmVO.bon_id}">
								<input type="hidden" name="action" value="delete"> <input
									type="submit" value="刪除">
							</form>
						</td>
					</tr>
				</c:forEach>
			</table>
			<%@ include file="../../files/page2.file"%>
		</div>

</body>
</html>