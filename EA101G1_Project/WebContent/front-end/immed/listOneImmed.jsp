<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.immed.model.*"%>
<%@ page import="com.productType.model.*"%>
<%@ page import="com.member.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
	ImmedVO immedVO = (ImmedVO) request.getAttribute("immedVO"); //ImmedServlet.java(Concroller), 存入req的immedVO物件
%>

<%
	PtService ptSvc = new PtService();
	PtVO ptVO = ptSvc.getOneProductType(immedVO.getPt_id());
%>

<%
	MemberService memberSvc = new MemberService();
	MemberVO saleVO = memberSvc.getOneMember(immedVO.getSale_id());
%>

<%
	MemberVO buyVO = memberSvc.getOneMember(immedVO.getBuy_id());
	pageContext.setAttribute("buyVO", buyVO);
%>
<html>
<head>
<title>${immedVO.immed_name}直購商品資料-listOneImmed.jsp</title>

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
div.descWrapper {
	background: hsla(0, 0%, 100%, 0.8);
}

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

div.content nav ol.breadcrumb {
	background-color: white;
	padding: 0rem 1rem;
}

div.content nav ol.breadcrumb a {
	color: rgb(102, 102, 102);
}

div.content li.breadcrumb-item+li.breadcrumb-item::before {
	content: ">";
}

div.immedName h4 {
	font-size: 1.3rem;
	font-weight: 600;
}

div.intro_left {
	border: 1px solid #D3D3D3;
	background: hsla(0, 0%, 100%, 0.8);
}

div.intro_left .slick-slide {
	height: auto;
}

div.intro_left .slider-for img {
	height: 230px;
}

div.intro_left div.slider-for {
	border: 1px solid #D3D3D3;
}

div.intro_left div.slider-nav div.slider_nav_img {
	border: 1px solid #D3D3D3;
}

div.intro_left h6.immedId {
	border-top: 1px solid #D3D3D3;
	margin: 5px 10px 0 10px;
	padding-top: 5px;
	font-size: 1rem;
}

div.intro_left div.immedRemark {
	border-top: 1px solid #D3D3D3;
	margin: 5px 10px 0 10px;
	padding-top: 5px;
}

div.intro_left div.immedRemark h6 {
	font-size: 1rem;
}

div.intro_left div.immedRemark ul {
	margin-left: -20px;
}

div.intro_left div.immedRemark li {
	font-size: 0.8rem;
}

button.slick-prev {
	left: 2px;
}

button.slick-next {
	right: 2px;
}

button.slick-prev:before, button.slick-next:before {
	font-family: "slick";
	font-size: 20px;
	line-height: 1;
	color: #383838;
	opacity: 0.75;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

div.intro_right {
	border: 1px solid #D3D3D3;
}

div.intro_right div.immedBuy {
	width: 100%;
	background-color: #FFF8A4;
	border-radius: 8px;
}

div.intro_right div.immedBuy span.price {
	color: red;
	font-size: 1.5rem;
	padding-left: 15px;
	font-weight: 600;
}

div.intro_right button.immed_buy {
	/* 	color: white; */
	/* 	background-color: #d8313d; */
	font-size: 1rem;
	margin-left: 20px;
}

div.intro_right div.immedPay span {
	font-size: 1rem;
}

div.intro_right div.immedPay ul {
	list-style-type: none;
	font-size: 1rem;
	padding-left: 15px;
}

div.intro_right div.saleInfo {
	width: 100%;
	border: 1px solid #D3D3D3;
}

div.intro_right div.saleInfo h6 {
	background-color: #E6E9ED;
	font-size: 1rem;
	padding: 5px 10px;
	margin-bottom: 0px;
}

div.intro_right div.saleInfo div {
	font-size: 0.9rem;
	padding: 3px 10px;
}
/* table#table-2 h4 { */
/* 	color: blue; */
/* 	display: inline; */
/* } */
div.immedDesc {
	margin-top: 30px;
	/* 	padding: 0px 150px 0px 170px; */
}

/* content */
div.content {
	background: hsla(0, 0%, 100%, .8);
	min-height: 800px;
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
				<li class="nav-item pl-md-2"><a class="nav-link text-white"
					href="">
						<div>
							<i class="fas fa-heart pl-md-3 pl-2 pb-1"></i>
						</div>
						<div>追蹤商品</div>
				</a></li>

			</ul>
			<!-- 		</div> -->
		</nav>
	</div>

	<div class="container content">

		<div class="row pt-3">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a
						href="<%=request.getContextPath()%>/front-end/index.jsp">首頁</a></li>
					<li class="breadcrumb-item"><a
						href="<%=request.getContextPath()%>/front-end/immed/immed_index.jsp">直購商品</a></li>
					<li class="breadcrumb-item"><a
						href="<%=request.getContextPath()%>/immed/immed.do?action=find_By_Immed_Type&immed_type_search=<%=ptVO.getPt_id()%>"><%=ptVO.getTypename()%></a></li>
				</ol>
			</nav>
		</div>

		<div class="immedName">
			<h4>${immedVO.immed_name}</h4>
		</div>

		<div class="row mt-4">
			<div class="col-md-3">
				<div class="intro_left">

					<div class="slider-for m-2">
						<div class="p-3">
							<img
								src="<%=request.getContextPath()%>/immed/ImmedPic.do?immed_id=${immedVO.immed_id}"
								class="card-img-top" alt="...">
						</div>
						<!-- 						<div class="p-3"> -->
						<!-- 							<img -->
						<%-- 								src="<%=request.getContextPath()%>/immed/ImmedPic.do?immed_id=${immedVO.immed_id}" --%>
						<!-- 								class="card-img-top" alt="..."> -->
						<!-- 						</div> -->
						<!-- 						<div class="p-3"> -->
						<!-- 							<img -->
						<%-- 								src="<%=request.getContextPath()%>/immed/ImmedPic.do?immed_id=${immedVO.immed_id}" --%>
						<!-- 								class="card-img-top" alt="..."> -->
						<!-- 						</div> -->
						<!-- 						<div class="p-3"> -->
						<!-- 							<img -->
						<%-- 								src="<%=request.getContextPath()%>/immed/ImmedPic.do?immed_id=${immedVO.immed_id}" --%>
						<!-- 								class="card-img-top" alt="..."> -->
						<!-- 						</div> -->
					</div>
					<div class="slider-nav px-4 py-2">
						<div class="p-1 slider_nav_img">
							<img
								src="<%=request.getContextPath()%>/immed/ImmedPic.do?immed_id=${immedVO.immed_id}"
								class="card-img-top" alt="...">
						</div>
						<!-- 						<div class="p-1 slider_nav_img"> -->
						<!-- 							<img -->
						<%-- 								src="<%=request.getContextPath()%>/immed/ImmedPic.do?immed_id=${immedVO.immed_id}" --%>
						<!-- 								class="card-img-top" alt="..."> -->
						<!-- 						</div> -->
						<!-- 						<div class="p-1 slider_nav_img"> -->
						<!-- 							<img -->
						<%-- 								src="<%=request.getContextPath()%>/immed/ImmedPic.do?immed_id=${immedVO.immed_id}" --%>
						<!-- 								class="card-img-top" alt="..."> -->
						<!-- 						</div> -->
						<!-- 						<div class="p-1 slider_nav_img"> -->
						<!-- 							<img -->
						<%-- 								src="<%=request.getContextPath()%>/immed/ImmedPic.do?immed_id=${immedVO.immed_id}" --%>
						<!-- 								class="card-img-top" alt="..."> -->
						<!-- 						</div> -->
					</div>

					<h6 class="immedId">商品編號: ${immedVO.immed_id}</h6>

					<div class="immedRemark">
						<h6>商品備註:</h6>
						<ul>
							<!-- 							<li>物品所在地:</li> -->
							<li>上架時間: <fmt:formatDate value="${immedVO.immed_start}"
									pattern="yyyy-MM-dd HH:mm:ss" /></li>
							<li>可能會提前結束販售</li>
						</ul>
					</div>

				</div>
			</div>

			<div class="col-md-9 descWrapper">
				<div class="intro_right">
					<div class="row mx-3 my-4">
						<div class="immedBuy py-3 px-2 d-flex">
							<span>直購價: </span> <span class="price">$${immedVO.immed_prc}</span>

							<form class="form-inline mr-auto ml-2" method="post"
								<%-- 								action="<%=request.getContextPath()%>/front-end/immed/immedPay.jsp?immed_id=${immedVO.immed_id}"> --%>
								action="<%=request.getContextPath()%>/immed/immed.do">

								<!-- 								<input type="hidden" name="action" value="find_By_Immed_Name"> -->
								<%-- 								<input type="hidden" name="immedVO" value=<%=immedVO%>> --%>
								<%-- 								<input type="hidden" name="buy_id" value="${memberVO.mem_id}"> --%>
								<input type="hidden" name="action"
									value="getOne_For_Update_OneBuy"> <input type="hidden"
									name="immed_id" value="${immedVO.immed_id}">
								<%-- 								<input type="hidden" name="buy_id" value="${memberVO.mem_id}"> --%>
								<button type="submit" class="btn btn-danger immed_buy"
									${ (immedVO.immed_sold == 1 || immedVO.sale_id == memberVO.mem_id )? "disabled" : "" }
									title="立即購買">${immedVO.immed_sold ==1 ? "已售出" : "立即購買" }</button>

								<c:if test="${immedVO.immed_sold ==1}">

									<p class="pl-3">買家: ${immedVO.immed_sold ==1 ?  buyVO.mem_name : "" }</p>
								</c:if>
							</form>

						</div>
					</div>

					<div style="border-top: 1px solid #D3D3D3;" class="row mx-2 mt-4">
						<div class="col-md-8 mt-3">
							<!-- 							<div class="immedPay d-flex"> -->
							<!-- 								<span>運送方式: </span> -->
							<!-- 								<ul> -->
							<!-- 									<li>7-11取貨付款 60 元</li> -->
							<!-- 									<li>全家、OK、萊爾富取貨付款 60 元</li> -->
							<!-- 									<li>宅配/快遞 90 元</li> -->
							<!-- 								</ul> -->
							<!-- 							</div> -->

						</div>
						<div class="col-md-4">
							<div class="saleInfo mt-3">
								<h6>賣家資訊</h6>
								<div style="border-bottom: 1px dashed #E6E9ED;">
									賣家名稱:
									<%=saleVO.getMem_name()%></div>
								<!-- 								<div>全部商品:</div> -->
								<!-- 								<div>評價分數:</div> -->
							</div>
						</div>
					</div>
				</div>

				<div class="immedDesc px-3">
					<h4 class="mb-4">商品描述</h4>
					<div><%=immedVO.getImmed_desc()%></div>

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

	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>

	<script type="text/javascript">
		$('.slider-for').slick({
			autoplay : false,
			slidesToShow : 1,
			slidesToScroll : 1,
			arrows : false,
			fade : true,
			asNavFor : '.slider-nav'
		});
		$('.slider-nav').slick({
			autoplay : false,
			slidesToShow : 3,
			slidesToScroll : 1,
			asNavFor : '.slider-for',
			dots : false,
			focusOnSelect : true
		});
	</script>
</body>
</html>