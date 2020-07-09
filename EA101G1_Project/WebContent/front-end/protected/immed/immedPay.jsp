<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.immed.model.*"%>
<%@ page import="com.productType.model.*"%>
<%@ page import="com.member.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%--
	ImmedService immedSvc = new ImmedService();
	ImmedVO immedVO = immedSvc.getOneImmed(request.getParameter("immed_id")); 
	pageContext.setAttribute("immedVO", immedVO);
--%>
<%
	ImmedVO immedVO = (ImmedVO) session.getAttribute("immedBuyVO"); //ImmedServlet.java (Concroller) 存入req的immedVO物件 (包括幫忙取出的immedVO
%>

<%--
	PtService ptSvc = new PtService();
	PtVO ptVO = ptSvc.getOneProductType(immedVO.getPt_id());
--%>

<%
	MemberService memberSvc = new MemberService();
	MemberVO memberVO = memberSvc.getOneMember(immedVO.getSale_id());
	pageContext.setAttribute("memberVO", memberVO);
%>


<html>
<head>
<title>${immedVO.immed_name}直購商品資料-listOneImmed.jsp</title>

<link rel="icon shortcut"
	href="<%=request.getContextPath()%>/front-end/immed/images/ICON.ico">

<!-- Bootstrap官方網站 https://getbootstrap.com/ -->
<!-- 連結Bootstrap.min.css -->
<!-- CSS only -->
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
	href="<%=request.getContextPath()%>/front-end/css/immed/immed_header_footer.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.css">

<style>
body {
	padding-top: 90px;
	background-color: #F5F5F5;
}

.immed_nav {
	background: linear-gradient(#4475b6, #00334e);
}

.immed_nav .navbar {
	padding: 0rem 1rem;
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
	margin-top: 40px;
}

/* content */
div.content {
	background-color: white;
	min-height: 800px;
}

form.recipi {
	width: 100%;
}

form.recipi thead th {
	font-size: 22px;
}

table th {
	padding: .5rem 1rem;
}

form.recipi tbody th {
	width: 14%;
}

form.recipi tbody tr:nth-child(3) input {
	width: 50%;
}

div.errMsg ul li {
	float: left;
	border: 0;
	width: 25%;
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
	<%@ include file="/files/immed/immed_header.jsp"%>
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
				<li class="nav-item d-flex"><a class="nav-link text-white"
					href="<%=request.getContextPath()%>/front-end/protected/immed/addImmed.jsp">
						<div>
							<i class="fas fa-gavel  pl-2 pb-1"></i>
						</div>
						<div>賣東西</div>
				</a></li>
				<li class="nav-item d-flex pl-md-2"><a
					class="nav-link text-white" href="#">
						<div>
							<i class="fas fa-user pl-md-3 pl-2 pb-1"></i>
						</div>
						<div>我的拍賣</div>
				</a></li>
				<li class="nav-item d-flex pl-md-2"><a
					class="nav-link text-white" href="#">
						<div>
							<i class="fas fa-shopping-cart pl-md-1 pl-1 pb-1"></i>
						</div>
						<div>購物車</div>
				</a></li>
			</ul>

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
					<!-- 						<li class="breadcrumb-item active" aria-current="page">Data</li> -->
				</ol>
			</nav>
		</div>

		<div class="row">
			<div class="col">
				<table class="immedInfo">
					<thead>
						<tr>
							<th><div>購買的商品明細</div></th>
							<td><div>賣家: ${memberVO.mem_name}</div></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">商品名稱:</th>
							<td>${immedVO.immed_name}</td>
						</tr>
						<!-- 					<tr> -->
						<!-- 						<th scope="row">收件人電話:</th> -->
						<!-- 						<td><input type="text" name="rcpt_cell"></td> -->
						<!-- 					</tr> -->
						<!-- 					<tr> -->
						<!-- 						<th scope="row">收件地址:</th> -->
						<!-- 						<td><input type="text" name="rcpt_add"></td> -->
						<!-- 					</tr> -->
					</tbody>
				</table>
			</div>
		</div>

		<form class="creit_form" action="#">
			<div class="container-fluid">
				<div class="row pull-center">
					<div class="col-md-4">
						<div class="well">
							<div class="row card"></div>
							<br />
							<div class="row">
								<div class="col-md-8">
									<div class="form-group">
										<label>信用卡卡號 </label> <input type="text" name="number"
											class="form-control" />
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label>有效期限</label> <input type="text" placeholder="MM/YY"
											name="expiry" class="form-control" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-8">
									<div class="form-group">
										<label>持卡人姓名</label> <input type="text" name="name"
											class="form-control" />
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label>認證碼 </label> <input type="text" name="cvv"
											class="form-control" />
									</div>
								</div>
							</div>
							<div class="row ">

								<div class="col-md-12 text-right">
									<button type="button" class="btn btn-success">Submit</button>
									<button type="button" class="btn btn-info">Clear</button>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-4">
						<div>
							<%-- 錯誤表列 --%>
							<c:if test="${not empty errorMsgs}">
								<font style="color: red">請修正以下錯誤:</font>
								<ul>
									<c:forEach var="message" items="${errorMsgs}">
										<li style="color: red; float: left; border: 0; width: 25%;">${message}</li>
									</c:forEach>
								</ul>
							</c:if>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col">
						<!-- 						<form class="recipi" -->
						<%-- 							action="<%=request.getContextPath()%>/immed/immed.do" method="post"> --%>
						<table>
							<thead>
								<tr>
									<th scope="row">收件人資料</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">收件人姓名:</th>
									<td><input type="text" name="rcpt_name"></td>
								</tr>
								<tr>
									<th scope="row">收件人電話:</th>
									<td><input type="text" name="rcpt_cell"></td>
								</tr>
								<tr>
									<th scope="row">收件地址:</th>
									<td><input type="text" name="rcpt_add"></td>
								</tr>
								<tr>
									<th><input type="hidden" name="action"
										value="update_one_buy"> <input type="hidden"
										name="immed_id" value="${immedVO.immed_id}"> <input
										type="hidden" name="buy_id" value="${memberVO.mem_id}">
										<input type="submit" value="送出"></th>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</form>

	</div>


	<!-- footer -->
	<%@ include file="/files/footer.jsp"%>
	<!-- footer -->

	<!-- 連結Bootstrap所需要的js -->
	<!-- JS, Popper.js, and jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
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

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/card/1.3.1/js/card.min.js"></script>

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

	<script>
		new Card({
			form : '.creit_form',
			container : '.card',
			formSelectors : {
				numberInput : 'input[name=number]',
				expiryInput : 'input[name=expiry]',
				cvcInput : 'input[name=cvv]',
				nameInput : 'input[name=name]'
			},

			width : 350, // optional — default 350px
			formatting : true,

			placeholders : {
				number : '‧‧‧‧ ‧‧‧‧ ‧‧‧‧ ‧‧‧‧',
				name : 'Full Name',
				expiry : '‧‧/‧‧',
				cvc : '‧‧‧'
			}
		})
	</script>
</body>
</html>