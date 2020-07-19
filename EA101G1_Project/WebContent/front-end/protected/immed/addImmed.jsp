<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.immed.model.*"%>

<%
	ImmedVO immedVO = (ImmedVO) request.getAttribute("immedVO");
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

<!-- CKEditor -->
<script src="<%=request.getContextPath()%>/files/ckeditor/ckeditor.js"></script>

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
	/* 	background-color: white; */
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}

td.previewTd {
	display: flex;
	flex-direction: column-reverse;
}

div.content {
	background: hsla(0, 0%, 100%, .8);
	min-height: 100vh;
}

div.buy_content {
	background: hsla(0, 0%, 100%, .8);
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
						<!-- 						<li class="breadcrumb-item active" aria-current="page">Data</li> -->
					</ol>
				</nav>
			</div>
		</div>

		<div class="row flex-column ">
			<div class="col-12 buy_content">
				<div class="">
					<h3 class="pb-2">刊登直購商品:</h3>

					<%-- 錯誤表列 --%>
					<c:if test="${not empty errorMsgs}">
						<font style="color: red">請修正以下錯誤:</font>
						<ul>
							<c:forEach var="message" items="${errorMsgs}">
								<li style="color: red">${message}</li>
							</c:forEach>
						</ul>
					</c:if>

					<form METHOD="post"
						ACTION="<%=request.getContextPath()%>/immed/immed.do" name="form1"
						enctype="multipart/form-data">
						<table class="w-100">
							<!-- 						<tr> -->
							<!-- 							<td><label>賣家編號: </label></td> -->
							<%-- 							<td>${memberVO.mem_id}</td> --%>
							<%-- 												value="<%=(immedVO == null) ? "M000001" : immedVO.getSale_id()%>" /></td> --%>
							<!-- 						</tr> -->

							<jsp:useBean id="ptSvc" scope="page"
								class="com.productType.model.PtService" />
							<tr>
								<td><label for="fpt_id">商品種類: </label></td>
								<td><select name="pt_id" id="fpt_id">
										<c:forEach var="ptVO" items="${ptSvc.all}">
											<option value="${ptVO.pt_id}">${ptVO.typename}</option>
										</c:forEach>
								</select></td>
							</tr>

							<tr>
								<td><label for="fimmed_name">直購商品名稱: </label></td>
								<td><input type="text" name="immed_name" id="fimmed_name" style="width:100%"
									value="${immedVO.immed_name}" autocomplete="off"></td>
							</tr>

							<tr>
								<td><label for="fimmed_prc">商品直購價: </label></td>
								<td><input type="text" name="immed_prc" 
									value="${immedVO.immed_prc}" autocomplete="off" /></td>
							</tr>

							<tr>
								<td>商品圖片:</td>
								<td class="previewTd"><input type="file"
									onchange="readURL(this)" name="immed_pic"
									targetID="preview_img"
									accept="image/gif, image/jpeg, image/png"> <img
									src="<%=request.getContextPath()%>/front-end/immed/images/upload.png"
									style="width: 200px;" id="preview_img">
								<td>
							</tr>

							<tr>
								<td><label for="fimmed_desc">商品描述: </label></td>
								<td><textarea name="immed_desc" id="editor1"></textarea> <!-- 							<textarea style="width: 350px; height: 250px;" name="immed_desc" -->
									<!-- 									id="fimmed_desc" --> <%-- 									value="<%=(immedVO == null) ? "10000" : immedVO.getImmed_desc()%>"> </textarea> --%>

								</td>


							</tr>
							<tr>
								<td><input type="hidden" name="sale_id"
									value="${memberVO.mem_id}" /> <input type="hidden"
									name="action" value="insert"> <input type="submit"
									value="送出"></td>
							</tr>
						</table>

					</form>
				</div>
			</div>
			<div class="modal  bd-example-modal-lg" tabindex="-1" role="dialog"
				aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content"><jsp:include
							page="/front-end/protected/immed/listAllFavImmed.jsp"
							flush="true" /></div>
				</div>
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

	<script>
		CKEDITOR.replace('editor1', {
			language : 'zh',
			height : 350
		});
	</script>
</body>
</html>