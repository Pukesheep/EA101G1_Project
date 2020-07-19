<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.immed.model.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="java.util.*"%>

<%--
	ImmedVO immedVO = (ImmedVO) request.getAttribute("immedVO");
--%>

<%
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
%>

<%
	ImmedService immedSvc = new ImmedService();
	List<ImmedVO> list = immedSvc.getAllSaleIng(memberVO.getMem_id());
	pageContext.setAttribute("list", list);
%>

<html>
<head>
<title>刊登直購商品</title>

<link rel="icon shortcut"
	href="<%=request.getContextPath()%>/front-end/immed/images/ICON.ico">

<!-- Bootstrap官方網站 https://getbootstrap.com/ -->
<!-- 連結Bootstrap.min.css -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">

<!-- 使用font awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">

<!-- 使用google Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Sedgwick+Ave+Display&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Lakki+Reddy&display=swap"
	rel="stylesheet">

<!-- 使用style.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.css">

<style>
body {
	padding-top: 90px;
	background-image:
		url('<%=request.getContextPath()%>/front-end/immed/images/14.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center center;
}

.immed_nav {
	background: linear-gradient(#4475b6, #00334e);
}

.immed_nav .navbar {
	padding: 0rem 1rem;
	background: none !important;
	box-shadow: none !important;
}

.immed_nav .navbar-brand {
	/* 	padding-top: 0.5rem; */
	padding-top: 1rem;
	padding-bottom: 0rem;
}

.immed_nav .form-inline {
	padding-top: 1rem;
}

.immed_nav .form-inline .form-control {
	width: 350px;
}

.immed_nav .form-inline button {
	margin-left: -42px;
}

.immed_nav .navbar-collapse {
	flex-grow: initial;
}

.immed_nav a.nav-link div {
	font-size: 0.9rem;
}

.immed_nav a.nav-link i {
	font-size: 1.5rem;
	padding-top: 0.25rem;
}

.immed_nav div.avator img {
	border-radius: 50%;
	width: 30px;
}

.logo {
	font-family: 'Sedgwick Ave Display', cursive;
	font-size: 35px;
	color: #16e8f7f8;
}

.logo2 {
	font-family: 'Lakki Reddy', cursive;
	font-size: 35px;
	color: #f1edd2f8;
	margin-left: 5px;
}

.logo3 {
	font-family: 'Sedgwick Ave Display', cursive;
	font-size: 15px;
	color: #f3efd5f8;
	margin-left: 5px;
}

nav ol.breadcrumb {
	background-color: white;
	padding: 0rem 1rem;
}

nav ol.breadcrumb a {
	color: rgb(102, 102, 102);
}

nav.breadcrumb {
	border: 1px solid #ddd;
}

nav ol.breadcrumb {
	margin-bottom: 0rem;
}

/* table#table-1 { */
/* 	width: 500px; */
/* 	background-color: #CCCCFF; */
/* 	border: 2px solid black; */
/* 	text-align: center; */
/* } */

/* table#table-1 h4 { */
/* 	color: red; */
/* 	display: block; */
/* 	margin-bottom: 1px; */
/* } */

/* h4 { */
/* 	color: blue; */
/* 	display: inline; */
/* } */
table {
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table img {
	width: 90px;
	height: 120px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}

td:nth-of-type(2) {
	max-width: 170px;
	word-wrap: break-word;
}

td:nth-of-type(3) {
	max-width: 100px;
}

td:nth-of-type(5) {
	max-width: 200px;
	word-wrap: break-word;
}

td:nth-of-type(6) {
	max-width: 200px;
	word-wrap: break-word;
}

td:nth-of-type(6) img {
	max-width: 100px;
	max-height: 150px;
}

td.previewTd {
	display: flex;
	flex-direction: column-reverse;
}

div.content {
	background: hsla(0, 0%, 100%, .8);
	min-height: 100vh;
}
.dropdown-menu li:hover .sub-menu {
	visibility: visible;
}

.dropdown:hover .dropdown-menu {
	display: block;
}
@media ( max-width : 1023px) {
	header .form-inline .form-control {
		width: 250px;
	}
}

@media ( max-width : 767px) {
	header .form-inline .form-control {
		width: 200px;
	}
	.logo3 {
		display: none;
	}
}
</style>

</head>
<body>
	<!-- navbar -->
	<%@ include file="/files/header.jsp"%>
	<!-- navbar end -->

	<div class="container immed_nav">
		<nav class="navbar navbar-expand-md navbar-light">
			<a class="navbar-brand"
				href="<%=request.getContextPath()%>/front-end/immed/immed_index.jsp">
				<span class="logo2">Immed</span> <span class="logo3">Trade</span>
			</a>

			<form class="form-inline mr-auto ml-2" method="post"
				action="<%=request.getContextPath()%>/immed/immed.do">
				<input class="form-control" type="text" placeholder="搜尋商品"
					aria-label="Search" name="immed_name_search" autocomplete="off">
				<input type="hidden" name="action" value="find_By_Immed_Name">
				<button class="btn btn-light my-2 my-sm-0" type="submit">
					<i class="fas fa-search"></i>
				</button>
			</form>

			<ul class="navbar-nav">
				<li class="nav-item "><a class="nav-link text-white"
					href="<%=request.getContextPath()%>/front-end/protected/immed/addImmed.jsp">
						<div>
							<i class="fas fa-gavel  pl-2 pb-1"></i>
						</div>
						<div>賣東西</div>
				</a></li>
				<li class="nav-item  pl-md-2"><a class="nav-link text-white"
					href="<%=request.getContextPath()%>/front-end/protected/immed/buyerManage.jsp">
						<div>
							<i class="fas fa-shopping-basket pl-md-4 pl-2 pb-1"></i>
						</div>
						<div>已購買商品</div>
				</a></li>
				<li class="nav-item  pl-md-2 dropdown"><a
					class="nav-link text-white " dropdown-toggle" href="" role="button"
					id="dropdownMenuLink" data-toggle="dropdown">
						<div>
							<i class="fas fa-user pl-md-3 pl-2 pb-1"></i>
							<div>賣家管理</div>
						</div>
				</a>

					<div class="dropdown-menu">
						<a class="dropdown-item"
							href="<%=request.getContextPath()%>/front-end/protected/immed/salerManage.jsp">出貨管理</a>
						<a class="dropdown-item"
							href="<%=request.getContextPath()%>/front-end/protected/immed/salerAlter.jsp">商品管理</a>
					</div></li>
				<li class="nav-item pl-md-2"><a
					class="nav-link text-white favColl" href="" data-toggle="modal"
					data-target=".bd-example-modal-lg">
						<div>
							<i class="fas fa-heart pl-md-4 pl-2 pb-1"></i>
						</div>
						<div>已追蹤商品</div>
				</a></li>

			</ul>
		</nav>
	</div>


	<div class="container content">
		<div class="row pt-3 pb-2">
			<div class="col-auto">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a
							href="<%=request.getContextPath()%>/front-end/index.jsp">首頁</a></li>
						<li class="breadcrumb-item"><a
							href="<%=request.getContextPath()%>/front-end/immed/immed_index.jsp">直購商品</a></li>
						<li class="breadcrumb-item"><a
							href="<%=request.getContextPath()%>/front-end/protected/immed/salerAlter.jsp">商品管理</a></li>
						<!-- 						<li class="breadcrumb-item active" aria-current="page">Data</li> -->
					</ol>
				</nav>
			</div>
		</div>

		<div class="row flex-column">
			<div class="col-12">
				<h3 class="pb-2">販售中商品</h3>

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
							<!-- 							<th>賣家編號</th> -->
							<!-- 							<th>買家編號</th> -->
							<!-- 							<th>商品種類編號</th> -->
							<th>商品名稱</th>
							<th>商品上架時間</th>
							<th>商品價格</th>
							<th>商品圖片</th>
							<th>商品描述</th>
							<!-- 							<th>商品售出狀態</th> -->
							<!-- 							<th>商品在架狀態</th> -->
							<!-- 							<th>訂單時間</th> -->
							<!-- 							<th>訂單狀態</th> -->
							<!-- 							<th>收件人姓名</th> -->
							<!-- 							<th>收件人電話</th> -->
							<!-- 							<th>收件人地址</th> -->
							<th>商品下架</th>
							<th>商品修改</th>
						</tr>

						<%@ include file="/files/immed/immedPage5.file"%>
						<c:forEach var="immedVO" items="${list}" begin="<%=pageIndex%>"
							end="<%=pageIndex+rowsPerPage-1%>">
							<tr>
								<td>${immedVO.immed_id}</td>
								<%-- 								<td>${immedVO.sale_id}</td> --%>
								<%-- 								<td>${immedVO.buy_id}</td> --%>
								<%-- 								<td>${immedVO.pt_id}</td> --%>
								<td><a
									href="<%=request.getContextPath()%>/immed/immed.do?action=getOne_For_Display&immed_id=${immedVO.immed_id}">
										${immedVO.immed_name}</a></td>
								<td><fmt:formatDate value="${immedVO.immed_start}"
										pattern="yyyy-MM-dd HH:mm" /></td>
								<td>$${immedVO.immed_prc}</td>
								<td><img class="immed_pic"
									src="<%=request.getContextPath()%>/immed/ImmedPic.do?immed_id=${immedVO.immed_id}"></td>
								<td><pre class="immed_desc">${immedVO.immed_desc}</pre></td>
								<%-- 								<td>${(immedVO.immed_sold eq 1) ? '已售出' : '未售出'}</td> --%>
								<%-- 								<td>${(immedVO.immed_down eq 1) ? "已下架" : "未下架"}</td> --%>
								<%-- 								<td><fmt:formatDate value="${immedVO.ord_time}" --%>
								<%-- 										pattern="yyyy-MM-dd HH:mm:ss" /></td> --%>
								<%-- 								<td>${immedVO.ordstat_id}</td> --%>
								<%-- 								<td>${immedVO.rcpt_name}</td> --%>
								<%-- 								<td>${immedVO.rcpt_cell}</td> --%>
								<%-- 								<td><p class="rcpt_add">${immedVO.rcpt_add}</p></td> --%>
								<td>
									<FORM METHOD="post"
										ACTION="<%=request.getContextPath()%>/immed/immed.do"
										style="margin-bottom: 0px;">
										<c:if test="${immedVO.immed_down==0}">
											<input type="submit" value="下架">
											<input type="hidden" name="immed_id"
												value="${immedVO.immed_id}">
											<input type="hidden" name="action" value="update_down">
										</c:if>
										<c:if test="${immedVO.immed_down==1}">
											<input type="submit" value="上架">
											<input type="hidden" name="immed_id"
												value="${immedVO.immed_id}">
											<input type="hidden" name="action" value="update_up">
										</c:if>
									</FORM>
								</td>
								<td>
									<!-- 									<FORM METHOD="post" --> <%-- 										ACTION="<%=request.getContextPath()%>/immed/immed.do" --%>
									<!-- 										style="margin-bottom: 0px;"> --> <!-- 										<input type="hidden" name="from" value="back-end"> <input -->
									<!-- 											type="submit" value="刪除"> <input type="hidden" -->
									<%-- 											name="immed_id" value="${immedVO.immed_id}"> <input --%>
									<!-- 											type="hidden" name="action" value="delete"> -->
									<!-- 									</FORM> -->

									<FORM METHOD="post"
										ACTION="<%=request.getContextPath()%>/immed/immed.do"
										style="margin-bottom: 0px;">

										<input type="submit" value="修改"
											${immedVO.immed_sold == 1 ? 'disabled' : ''}> <input
											type="hidden" name="immed_id" value="${immedVO.immed_id}">
										<input type="hidden" name="action" value="getOne_For_Update">
									</FORM>
								</td>
							</tr>
						</c:forEach>
					</table>
					<div class="modal  bd-example-modal-lg" tabindex="-1" role="dialog"
						aria-labelledby="myLargeModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content"><jsp:include
									page="/front-end/protected/immed/listAllFavImmed.jsp"
									flush="true" /></div>
						</div>
					</div>
				</div>
				<%@ include file="/files/immed/page2B.file"%>
			</div>


		</div>

	</div>

	<!-- footer -->
	<%@ include file="/files/footer.jsp"%>
	<!-- footer -->

	<!-- 連結Bootstrap所需要的js -->
	<!-- jquery.min.js -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>

	<script>
		function readURL(input) {
			if (input.files && input.files[0]) {
				var img_box = document.getElementById('preview_img');
				img_box.setAttribute('style',
						'display:inline-block; width:200px;');
				var imageTagID = input.getAttribute("targetID");
				var reader = new FileReader();
				reader.onload = function(e) {
					var img = document.getElementById(imageTagID);
					img.setAttribute("src", e.target.result)
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>
</body>
</html>