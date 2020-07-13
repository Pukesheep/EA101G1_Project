<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.immed.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	ImmedService immedSvc = new ImmedService();
	List<ImmedVO> list = immedSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">



<title>S.F.G 後台管理</title>
<%@ include file="/back-end/css/BackHeaderCssLink"%>
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

table#table-2 tr {
	max-width: 100%;
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

<body>
	<!-- header -->

	<%@ include file="/back-end/css/header.jsp"%>
	<!-- header -->

	<div class="content d-md-flex">

		<!-- aside -->
		<%@ include file="/back-end/css/aside.jsp"%>
		<!-- aside -->
		<div class="table-responsive">
			<main>

				<div class="container-fluid">
					<div class="row">

						<table id="table-1" class="table">
							<tr>
								<td>
									<h3>所有商品資料 - listAllImmed.jsp</h3>
									<h4>
										<a href="select_page.jsp"><img src="images/back1.gif"
											width="100" height="32" border="0">回首頁</a>
									</h4>
								</td>
							</tr>
						</table>

						<%-- 錯誤表列 --%>
						<c:if test="${not empty errorMsgs}">
							<font style="color: red">請修正以下錯誤:</font>
							<ul>
								<c:forEach var="message" items="${errorMsgs}">
									<li style="color: red">${message}</li>
								</c:forEach>
							</ul>
						</c:if>

						<div class="table-responsive">
							<table id="table-2" class="table">
								<tr>
									<th>商品編號</th>
									<th>賣家編號</th>
									<th>買家編號</th>
									<th>商品種類編號</th>
									<th>商品名稱</th>
									<th>商品上架時間</th>
									<th>商品價格</th>
									<th>商品圖片</th>
									<th>商品描述</th>
									<th>商品售出狀態</th>
									<th>商品下架狀態</th>
									<th>訂單時間</th>
									<th>訂單狀態編號</th>
									<th>收件人姓名</th>
									<th>收件人電話</th>
									<th>收件人地址</th>
									<th>修改</th>
									<th>刪除</th>
								</tr>

								<%@ include file="page1.file"%>
								<c:forEach var="immedVO" items="${list}" begin="<%=pageIndex%>"
									end="<%=pageIndex+rowsPerPage-1%>">
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
											src="<%=request.getContextPath()%>/immed/ImmedPicRead?ID=${immedVO.immed_id}"></td>
										<td><p class="immed_desc">${immedVO.immed_desc}</p></td>
										<td>${(immedVO.immed_sold eq 1) ? '已售出' : '未售出'}</td>
										<td>${(immedVO.immed_down eq 1) ? "已下架" : "未下架"}</td>
										<td><fmt:formatDate value="${immedVO.ord_time}"
												pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td>${immedVO.ordstat_id}</td>
										<td>${immedVO.rcpt_name}</td>
										<td>${immedVO.rcpt_cell}</td>
										<td><p class="rcpt_add">${immedVO.rcpt_add}</p></td>
										<td>
											<FORM METHOD="post"
												ACTION="<%=request.getContextPath()%>/immed/immed.do"
												style="margin-bottom: 0px;">
												<input type="hidden" name="from" value="back-end"> <input
													type="submit" value="修改"> <input type="hidden"
													name="immed_id" value="${immedVO.immed_id}"> <input
													type="hidden" name="action" value="getOne_For_Update">
											</FORM>
										</td>
										<td>
											<FORM METHOD="post"
												ACTION="<%=request.getContextPath()%>/immed/immed.do"
												style="margin-bottom: 0px;">
												<input type="hidden" name="from" value="back-end"> <input
													type="submit" value="刪除"> <input type="hidden"
													name="immed_id" value="${immedVO.immed_id}"> <input
													type="hidden" name="action" value="delete">
											</FORM>
										</td>
									</tr>
								</c:forEach>
							</table>
						</div>

						<%@ include file="page2.file"%>
					</div>
				</div>


			</main>

		</div>
</body>
</html>
