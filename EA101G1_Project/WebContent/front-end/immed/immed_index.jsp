<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.immed.model.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.product.model.*"%>
<%
	ImmedService immedSvc = new ImmedService();
	List<ImmedVO> list = immedSvc.getAllOnSale();
	pageContext.setAttribute("list", list);
%>
<jsp:useBean id="favImmedSvc" scope="page"
	class="com.favImmed.model.FavImmedService" />
<html>
<head>
<title>直購商品首頁</title>

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

<!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

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
	background: linear-gradient(#4475b6, #00334e) !important;
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
/*=============================================
=                   Section                   =
=============================================*/
section.blank1 {
	min-height: 600px;
}

section.blank1 nav ol.breadcrumb {
	background-color: white;
	padding: 0rem 1rem;
}

section.blank1 nav ol.breadcrumb a {
	color: rgb(102, 102, 102);
}

section.blank1 nav.breadcrumb {
	border: 1px solid #ddd;
}

section.blank1 nav ol.breadcrumb {
	margin-bottom: 0rem;
}

dl, ol, ul {
	margin-top: 0;
	margin-bottom: 1rem;
}

section.blank1 li.breadcrumb-item+li.breadcrumb-item::before {
	content: ">";
}

section.blank1 div.container {
	background: hsla(0, 0%, 100%, .7);
}

section.blank1 div.left_side {
	min-height: calc(100vh - 116px);
	background: hsla(0, 0%, 100%, 0.8);
	border: 1px solid #ddd;
}

section.blank1 .card {
	height: 310px;
	overflow: hidden;
}

section.blank1 .card-body {
	padding: 0.5rem 0rem 0rem 0rem;
}

section.blank1 .card:hover {
	transform: scale(1.03);
	box-shadow: 0px 0px 3px #888888;
}

section.blank1 .card .card-title {
	color: #006ab4;
	font-size: 1rem;
	margin-bottom: 0.5rem;
	min-height: 40px;
	overflow: hidden;
	display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 2;
	text-overflow: ellipsis;
}

section.blank1 .card-img-top {
	height: 200px;

	/* 	 	transition: 0.3s;  */
}

/* section.blank1 .card-img-top:hover {  */
/*  	transform: scale(1.06);  */
/*  	transition: 0.3s;  */
/*  }  */
section.blank1 .card .card-price {
	color: red;
	font-size: 1.5rem;
	font-weight: 600;
}

ul.navbar-Nav .nav-link {
	color: #606060;
	/*     font-weight: bolder; */
}

aside .navbar-nav .nav-link:hover {
	background-color: #A9A9A9;
	cursor: pointer;
}

.dropdown-menu li:hover .sub-menu {
	visibility: visible;
}

.dropdown:hover .dropdown-menu {
	display: block;
}

/* .img-icon { */
/* 	width: 25px; */
/* 	height: 25px; */
/* 	float: right; */
/* 	margin: 8px 2px; */
/* 	cursor: pointer; */
/* } */
.favAdd {
	float: right;
	padding-bottom: 10px;
}

@media ( max-width : 1023px) {
	.immed_nav .form-inline .form-control {
		width: 250px;
	}
}

@media ( max-width : 767px) {
	.immed_nav .form-inline .form-control {
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
			<!-- 				<a class="navbar-brand" -->
			<%-- 					href="<%=request.getContextPath()%>/front-end/index.jsp"> <span --%>
			<!-- 					class="logo"><i class="fas fa-bomb"></i></span> <span class="logo2">交易區</span> -->
			<!-- 					<span class="logo3">直購商品</span> -->
			<!-- 				</a> -->

			<form class="form-inline mr-auto ml-2" method="post"
				action="<%=request.getContextPath()%>/immed/immed.do">
				<input class="form-control" type="text" placeholder="搜尋商品"
					aria-label="Search" name="immed_name_search" autocomplete="off">
				<input type="hidden" name="action" value="find_By_Immed_Name">
				<button class="btn btn-light my-2 my-sm-0" type="submit">
					<i class="fas fa-search"></i>
				</button>
			</form>

			<!-- 		<BUTTON CLASS="NAVBAR-TOGGLER" TYPE="BUTTON" DATA-TOGGLE="COLLAPSE" -->
			<!-- 			DATA-TARGET="#NAVBARTOGGLERDEMO03" -->
			<!-- 			ARIA-CONTROLS="NAVBARTOGGLERDEMO03" ARIA-EXPANDED="FALSE" -->
			<!-- 			ARIA-LABEL="TOGGLE NAVIGATION"> -->
			<!-- 			<SPAN CLASS="NAVBAR-TOGGLER-ICON"></SPAN> -->
			<!-- 		</BUTTON> -->
			<!-- 		<div class="collapse navbar-collapse" id="navbarTogglerDemo03"> -->
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


	<!-- 內容 -->
	<section class="blank1">

		<div class="container">
			<div class="row py-3">

				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a
							href="<%=request.getContextPath()%>/front-end/index.jsp">首頁</a></li>
						<li class="breadcrumb-item"><a
							href="<%=request.getContextPath()%>/front-end/immed/immed_index.jsp">直購商品</a></li>
						<!-- 						<li class="breadcrumb-item active" aria-current="page">Data</li> -->
					</ol>
				</nav>

				<%-- 錯誤表列 --%>
				<c:if test="${not empty errorMsgs}">
					<font style="color: red">請修正以下錯誤:</font>
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<li style="color: red">${message}</li>
						</c:forEach>
					</ul>
				</c:if>
			</div>

			<%-- 			<div>${memberVO.mem_name}${memberVO.mem_id}</div> --%>

			<!-- 			<form method="post" -->
			<%-- 				action="<%=request.getContextPath()%>/front-end/immed/findByImmedName.jsp"> --%>
			<!-- 				<input type="text" name="immed_search"> <input type="hidden" -->
			<!-- 					name="action" value="find_By_Immed_Name"> <input -->
			<!-- 					type="submit" value="搜尋"> -->
			<!-- 			</form> -->

			<div class="row pb-4">
				<div class="col-md-2 left_side pt-2">
					<aside class=" navbar-collapse" id="navbarNav">
						<ul class="navbar-nav pl-2">
							<li class="nav-item">
								<div class="nav-link pl-1" data-toggle="collapse"
									data-target="#sideNavColl01">[ Switch ]</div>
								<ul class="collapse navbar-nav" id="sideNavColl01"
									data-parent="#navbarNav">
									<li class="nav-item"><a class="nav-link pl-4"
										href="<%=request.getContextPath()%>/immed/immed.do?action=find_By_Immed_Type&immed_type_search=PT002">Switch
											遊戲</a></li>
									<li class="nav-item"><a class="nav-link pl-4"
										href="<%=request.getContextPath()%>/immed/immed.do?action=find_By_Immed_Type&immed_type_search=PT001">Switch
											主機</a></li>
									<li class="nav-item"><a class="nav-link pl-4"
										href="<%=request.getContextPath()%>/immed/immed.do?action=find_By_Immed_Type&immed_type_search=PT003">Switch
											周邊</a></li>
								</ul>
							</li>
							<li class="nav-item">
								<div class="nav-link pl-1" data-toggle="collapse"
									data-target="#sideNavColl02">[ PS4 ]</div>
								<ul class="collapse navbar-nav" id="sideNavColl02"
									data-parent="#navbarNav">
									<li class="nav-item"><a class="nav-link pl-4"
										href="<%=request.getContextPath()%>/immed/immed.do?action=find_By_Immed_Type&immed_type_search=PT005">PS4
											遊戲</a></li>
									<li class="nav-item"><a class="nav-link pl-4"
										href="<%=request.getContextPath()%>/immed/immed.do?action=find_By_Immed_Type&immed_type_search=PT004">PS4
											主機</a></li>
									<li class="nav-item"><a class="nav-link pl-4"
										href="<%=request.getContextPath()%>/immed/immed.do?action=find_By_Immed_Type&immed_type_search=PT006">PS4
											周邊</a></li>
								</ul>
							</li>
							<li class="nav-item ">
								<div class="nav-link pl-1" data-toggle="collapse"
									data-target="#sideNavColl03">[ XBOX ]</div>
								<ul class="collapse navbar-nav" id="sideNavColl03"
									data-parent="#navbarNav">
									<li class="nav-item"><a class="nav-link pl-4"
										href="<%=request.getContextPath()%>/immed/immed.do?action=find_By_Immed_Type&immed_type_search=PT008">XBOX
											遊戲</a></li>
									<li class="nav-item"><a class="nav-link pl-4"
										href="<%=request.getContextPath()%>/immed/immed.do?action=find_By_Immed_Type&immed_type_search=PT007">XBOX
											主機</a></li>
									<li class="nav-item"><a class="nav-link pl-4"
										href="<%=request.getContextPath()%>/immed/immed.do?action=find_By_Immed_Type&immed_type_search=PT009">XBOX
											周邊</a></li>
								</ul>
							</li>
						</ul>

					</aside>
				</div>

				<div class="col-md-10">
					<div class="row mb-4 pl-5">
						<%@ include file="/files/immed/immedPage1.file"%>
					</div>
					<div class="row no-gutters px-4">
						<c:forEach var="immedVO" items="${list}" begin="<%=pageIndex%>"
							end="<%=pageIndex+rowsPerPage-1%>">
							<div class="col-6 col-md-3">
								<div class="card mb-4 px-2 py-2">
									<a
										href="<%=request.getContextPath()%>/immed/immed.do?action=getOne_For_Display&immed_id=${immedVO.immed_id}"
										title="${immedVO.immed_name}"> <img
										src="<%=request.getContextPath()%>/immed/ImmedPic.do?immed_id=${immedVO.immed_id}"
										class="card-img-top"
										style="${immedVO.immed_sold==1 ? 'opacity: 0.5;':'opacity: 1;' }"
										alt="...">
									</a>
									<div class="card-body ">
										<a
											href="<%=request.getContextPath()%>/immed/immed.do?action=getOne_For_Display&immed_id=${immedVO.immed_id}"
											title="${immedVO.immed_name}"><h5 class="card-title">${immedVO.immed_name}</h5></a>
										<span class="card-price">$${immedVO.immed_prc}</span>
										<!-- 										<form class="favAdd"> -->
										<!-- 										method="post" -->
										<%-- 											action="<%=request.getContextPath()%>/favImmed/favImmed.do"> --%>
										<c:choose>
											<c:when
												test="${favImmedSvc.getOne(immedVO.immed_id, sessionScope.memberVO.mem_id) eq null}">
												<%-- 			<img class="img-icon" alt="" src="<%=request.getContextPath()%>/front-end/product/images/icons/empty.png" id="${immedVO.immed_id}${sessionScope.memberVO.mem_id}" title="加入最愛"> --%>
												<input type="hidden" name="action" value="insert">
												<input type="hidden" name="immed_id"
													value="${immedVO.immed_id}">
												<input type="hidden" name="mem_id"
													value="${memberVO.mem_id}">
												<button type="button"
													style="box-shadow: none !important; border: none !important;"
													class="btn favAdd text-danger">
													<i class="far fa-heart fa-2x addIcon"
														id="${immedVO.immed_id}${sessionScope.memberVO.mem_id}"></i>
												</button>
												<!-- 													<input class="img-icon" type="image" -->
												<%-- 														src="<%=request.getContextPath()%>/front-end/product/images/icons/empty.png" --%>
												<!-- 														alt="Submit" width="25" height="25"> -->
											</c:when>
											<c:otherwise>
												<%-- 			<img class="img-icon" alt="" src="<%=request.getContextPath()%>/front-end/product/images/icons/full.png" id="${immedVO.immed_id}${sessionScope.memberVO.mem_id}" title="取消最愛"> --%>
												<input type="hidden" name="action" value="delete">
												<input type="hidden" name="immed_id"
													value="${immedVO.immed_id}">
												<input type="hidden" name="mem_id"
													value="${memberVO.mem_id}">
												<button type="button"
													style="box-shadow: none !important; border: none !important;"
													class="btn favAdd text-danger">
													<i class="fas fa-heart fa-2x addIcon"
														id="${immedVO.immed_id}${sessionScope.memberVO.mem_id}"></i>
												</button>
												<!-- 													<input class="img-icon" type="image" -->
												<%-- 														src="<%=request.getContextPath()%>/front-end/product/images/icons/full.png" --%>
												<!-- 														alt="Submit" width="25" height="25"> -->
											</c:otherwise>
										</c:choose>
										<!-- 										</form> -->
										<!-- 											<img -->
										<!-- 											style="" class=" img-icon" alt="" -->
										<%-- 											src="<%=request.getContextPath()%>/front-end/product/images/icons/empty.png" --%>
										<%-- 											id="${immedVO.immed_id}${sessionScope.memberVO.mem_id}" --%>
										<!-- 											title="加入最愛"> -->
									</div>
								</div>
							</div>
						</c:forEach>
					</div>

					<!-- 					<button type="button" class="btn btn-primary" data-toggle="modal" -->
					<!-- 						data-target=".bd-example-modal-lg">Large modal</button> -->

					<div class="modal  bd-example-modal-lg" tabindex="-1" role="dialog"
						aria-labelledby="myLargeModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content"><jsp:include
									page="/front-end/protected/immed/listAllFavImmed.jsp"
									flush="true" /></div>
						</div>
					</div>

					<!-- 					Button trigger modal -->
					<!-- 					<button type="button" class="btn btn-primary" data-toggle="modal" -->
					<!-- 						data-target="#exampleModalLong">Launch demo modal</button> -->

					<!-- 					Modal -->
					<!-- 					<div class="modal fade" id="exampleModalLong" tabindex="-1" -->
					<!-- 						role="dialog" aria-labelledby="exampleModalLongTitle" -->
					<!-- 						aria-hidden="true"> -->
					<!-- 						<div class="modal-dialog" role="document"> -->
					<!-- 							<div class="modal-content"> -->

					<!-- 								<div class="modal-body"></div> -->

					<!-- 							</div> -->
					<!-- 						</div> -->
					<!-- 					</div> -->
					<div class="row pl-5">
						<%@ include file="/files/immed/page2B.file"%>
					</div>
				</div>
			</div>
		</div>


	</section>
	<!-- 內容 ---end  -->

	<!-- footer -->
	<%@ include file="/files/footer.jsp"%>
	<!-- footer -->

	<!-- 連結Bootstrap所需要的js -->
	<!-- jquery.min.js -->
	<!-- 	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" -->
	<!-- 		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" -->
	<!-- 		crossorigin="anonymous"></script> -->

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
// 加入最愛
$('.addIcon').click(function(){
	var thisID = this.id;
	var immed_id = thisID.substring(0, 11);
	var mem_id = thisID.substring(11, 18);
	
	 if(${sessionScope.memberVO eq null}) {
			Swal.fire({
				icon: 'info',
				title: '請先登入會員',
				showConfirmButton: true,
				confirmButtonText: '好'
			}).then((result) => {
					  <%session.setAttribute("location", request.getRequestURI() + "?" + request.getQueryString());%>	
						document.location.href = '<%=request.getContextPath()%>/front-end/member/login.jsp';  
			})
	}else{
			if ($(this).hasClass("far")) {
				$.ajax({
					url: '<%=request.getContextPath()%>/favImmed/favImmed.do',
					type: 'POST',
					data: {
						immed_id: immed_id,
						mem_id: mem_id,
						action: 'insert'
					},
					success: function(){
						Swal.fire({
							icon: 'info',
							title: '已加入',
							showConfirmButton: false,
							timer: 500
						})
						.then((result) => {
							$(".modal-content").load("<%=request.getContextPath()%>/front-end/protected/immed/listAllFavImmed.jsp")
						})
					}
				});
				$(this).removeClass("far");
				$(this).addClass("fas");
			}
			else if($(this).hasClass("fas")){
				$.ajax({
					url: '<%=request.getContextPath()%>/favImmed/favImmed.do',
					type: 'POST',
					data: {
						immed_id: immed_id,
						mem_id: mem_id,
						action: 'delete'
					},
					success: function(){
						Swal.fire({
							icon: 'info',
							title: '已移除',
							showConfirmButton: false,
							timer: 500
						})
						.then((result) => {
							$(".modal-content").load("<%=request.getContextPath()%>/front-end/protected/immed/listAllFavImmed.jsp")
						})
					}
				});
				$(this).removeClass("fas");
				$(this).addClass("far");
			}
	}
	});
	</script>

	<script>	
	$('.favColl').click(function(){ 			/* 已追蹤商品會員跳轉*/
		if(${sessionScope.memberVO eq null}) {
					Swal.fire({
						icon: 'info',
						title: '請先登入會員',
						showConfirmButton: true,
						confirmButtonText: '好'
					}).then((result) => {
							  <%session.setAttribute("location", request.getRequestURI() + "?" + request.getQueryString());%>	
								document.location.href = '<%=request.getContextPath()%>/front-end/member/login.jsp';  
					})
		}
	});
	</script>

</body>
</html>