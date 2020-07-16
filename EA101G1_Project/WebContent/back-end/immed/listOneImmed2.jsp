<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.immed.model.*"%>
<%@ page import="com.productType.model.*"%>
<%@ page import="com.member.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.adm.model.*"%>

<%
	AdmVO admVO = (AdmVO) request.getAttribute("admVO");
%>

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

<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title></title>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<%@ include file="/back-end/css/BackHeaderCssLink"%>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.css">

<style>
div.dashContent {
	
}

div.status_row {
	/* 	margin-top: 50px; */
	
}

div.chart_row {
	margin-top: 30px;
}

div.descWrapper {
	background: hsla(0, 0%, 100%, 0.8);
}

body {
/* 	padding-top: 90px; */
/* 	background-image: */
<%-- 		url('<%=request.getContextPath()%>/front-end/immed/images/14.jpg'); --%>
/* 	background-size: cover; */
/* 	background-repeat: no-repeat; */
/* 	background-position: center center; */
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



div.contentListOne nav ol.breadcrumb {
	background-color: white;
	padding: 0rem 1rem;
}

div.contentListOne nav ol.breadcrumb a {
	color: rgb(102, 102, 102);
}

div.contentListOne li.breadcrumb-item+li.breadcrumb-item::before {
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
	display: flex;
	justify-content: center;
}

div.intro_left div.slider-nav div.slider_nav_img img{
	width: 100px;
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
div.contentListOne {
	background: hsla(0, 0%, 100%, .8);
	min-height: 800px;
}

pre img {
	max-width: 400px;
	max-height: 500px;
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
	<!-- header -->

	<%@ include file="/back-end/css/header.jsp"%>
	<!-- header -->

	<div class="content d-md-flex">

		<!-- aside -->
		<%@ include file="/back-end/css/aside.jsp"%>
		<!-- aside -->

		<main>
			<div class="container contentListOne">

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
											value="getOne_For_Update_OneBuy"> <input
											type="hidden" name="immed_id" value="${immedVO.immed_id}">
										<%-- 								<input type="hidden" name="buy_id" value="${memberVO.mem_id}"> --%>
<!-- 										<button type="submit" class="btn btn-danger immed_buy" -->
<%-- 											${ (immedVO.immed_sold == 1 || immedVO.sale_id == memberVO.mem_id )? "disabled" : "" } --%>
<%-- 											title="立即購買">${immedVO.immed_sold ==1 ? "已售出" : "立即購買" }</button> --%>

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
							<pre><%=immedVO.getImmed_desc()%></pre>

						</div>

					</div>
				</div>

			</div>
	</div>
	</main>
	</div>


	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>

	





</body>

</html>