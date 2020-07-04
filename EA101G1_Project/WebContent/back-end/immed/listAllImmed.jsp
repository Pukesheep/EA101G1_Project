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

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<!-- Include Favicon ico-->
<link rel="shortcut icon" href="./img/ICON.ico">
<!-- Font-awesome CSS -->
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.13.0/css/all.css">
<!--GoogleFont-->
<link
	href="https://fonts.googleapis.com/css2?family=Sedgwick+Ave+Display&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Lakki+Reddy&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap"
	rel="stylesheet">
<!-- Include style.css-->
<link rel="stylesheet" href="./css/style.css">

<title>S.F.G 後台管理</title>
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
	<header class="navbar navbar-expand-md navbar-dark fixed-top">
		<a class="navbar-brand" href="#"> <span class="logo"><i
				class="fas fa-bomb"></i></span> <span class="logo2">S.F.G</span> <sub><span
				class="logo3">Dashboard</span></sub>
		</a>

		<div class="navbar-nav ml-auto  mr-4 mr-md-0">
			<a class="nav-link login_color" href="login.html"> <i
				class="fas fa-user-cog"></i> <span class="ml-2">管理員登入</span>
			</a>
		</div>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
	</header>

	<div class="content d-md-flex">
		<aside class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ">
				<li class="nav-item">
					<div class="nav-link" data-toggle="collapse"
						data-target="#sideNavColl01">
						<i class="fas fa-user-edit ml-3"></i> 會員管理
					</div>
					<ul class="collapse navbar-nav" id="sideNavColl01"
						data-parent="#navbarNav">
						<li class="nav-item"><a class="nav-link pl-4" href="#">會員權限管理</a>
						</li>
						<li class="nav-item"><a class="nav-link pl-4" href="#">會員資料管理</a>
						</li>
					</ul>
				</li>
				<li class="nav-item">
					<div class="nav-link" data-toggle="collapse"
						data-target="#sideNavColl02">
						<i class="fas fa-home-alt ml-3 mr-2"></i>商城管理
					</div>
					<ul class="collapse navbar-nav" id="sideNavColl02"
						data-parent="#navbarNav">
						<li class="nav-item "><a class="nav-link pl-4" href="#">商品上下架</a>
						</li>
						<li class="nav-item "><a class="nav-link pl-4" href="#">商成訂單管理</a>
						</li>
						<li class="nav-item "><a class="nav-link pl-4" href="#">限時專案管理</a>
						</li>
					</ul>
				</li>
				<li class="nav-item ">
					<div class="nav-link" data-toggle="collapse"
						data-target="#sideNavColl03">
						<i class="fas fa-gift ml-3 mr-2"></i>紅利商城管理
					</div>
					<ul class="collapse navbar-nav" id="sideNavColl03"
						data-parent="#navbarNav">
						<li class="nav-item"><a class="nav-link pl-4" href="#">紅利商品上下架</a>
						</li>
						<li class="nav-item"><a class="nav-link pl-4" href="#">紅利商品訂單管理</a>
						</li>
						<li class="nav-item"><a class="nav-link pl-4" href="#">紅利商品商品管理</a>
						</li>
					</ul>
				</li>
				<li class="nav-item ">
					<div class="nav-link" data-toggle="collapse"
						data-target="#sideNavColl04">
						<i class="fas fa-users-class  ml-3 mr-1"></i>團購管理
					</div>
					<ul class="collapse navbar-nav pt-2" id="sideNavColl04"
						data-parent="#navbarNav">
						<li class="nav-item"><a class="nav-link pl-4" href="#">團購訂單管理</a>
						</li>
						<li class="nav-item"><a class="nav-link pl-4" href="#">團購商品管理</a>
						</li>
						<li class="nav-item"><a class="nav-link pl-4" href="#">團購商品上下架</a>
						</li>
					</ul>
				</li>
				<li class="nav-item ">
					<div class="nav-link" data-toggle="collapse"
						data-target="#sideNavColl05">
						<i class="fas fa-hand-pointer ml-3 mr-2"></i>交易區管理
					</div>
					<ul class="collapse navbar-nav" id="sideNavColl05"
						data-parent="#navbarNav">
						<li class="nav-item"><a class="nav-link pl-4" href="#">交易管理</a>
						</li>
					</ul>
				</li>
				<li class="nav-item ">
					<div class="nav-link" data-toggle="collapse"
						data-target="#sideNavColl06">
						<i class="fas fa-exclamation-triangle ml-3 mr-1"></i>檢舉管理
					</div>
					<ul class="collapse navbar-nav" id="sideNavColl06"
						data-parent="#navbarNav">
						<li class="nav-item"><a class="nav-link pl-4" href="#">商品檢舉管理</a>
						</li>
						<li class="nav-item"><a class="nav-link pl-4" href="#">會員檢舉管理</a>
						</li>
						<li class="nav-item"><a class="nav-link pl-4" href="#">文章檢舉管理</a>
						</li>
					</ul>
				</li>
				<li class="nav-item ">
					<div class="nav-link" data-toggle="collapse"
						data-target="#sideNavColl07">
						<i class="far fa-envelope-open-text ml-3 mr-2"></i>客服中心
					</div>
					<ul class="collapse navbar-nav" id="sideNavColl07"
						data-parent="#navbarNav">
						<li class="nav-item"><a class="nav-link pl-4" href="#">客服訊息管理</a>
						</li>
						<li class="nav-item"><a class="nav-link pl-4" href="#">Q&A管理</a>
						</li>
					</ul>
				</li>
				<li class="nav-item ">
					<div class="nav-link" data-toggle="collapse"
						data-target="#sideNavColl08">
						<i class="fas fa-address-card ml-3 mr-2"></i>員工管理
					</div>
					<ul class="collapse navbar-nav" id="sideNavColl08"
						data-parent="#navbarNav">
						<li class="nav-item"><a class="nav-link pl-4" href="#">員工帳號管理</a>
						</li>
						<li class="nav-item"><a class="nav-link pl-4" href="#">員工權限管理</a>
						</li>
					</ul>
				</li>
			</ul>
		</aside>

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
										<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/immed/immed.do"
											style="margin-bottom: 0px;">
											<input type="hidden" name="from" value="back-end">
											<input type="submit" value="修改"> <input type="hidden"
												name="immed_id" value="${immedVO.immed_id}"> <input
												type="hidden" name="action" value="getOne_For_Update">
										</FORM>
									</td>
									<td>
										<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/immed/immed.do"
											style="margin-bottom: 0px;">
											<input type="hidden" name="from" value="back-end">
											<input type="submit" value="刪除"> <input type="hidden"
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


		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
			integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
			crossorigin="anonymous"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
			integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
			crossorigin="anonymous"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
			integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
			crossorigin="anonymous"></script>
</body>
</html>
