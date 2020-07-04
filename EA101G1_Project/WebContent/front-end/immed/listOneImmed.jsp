<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.immed.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
	String immed_id = request.getParameter("immedID");
	ImmedService immedSvc = new ImmedService();
	ImmedVO immedVO = immedSvc.getOneImmed(immed_id);
	pageContext.setAttribute("immedVO", immedVO);
%>

<html>
<head>
<title>���ʰӫ~��� - listOneImmed.jsp</title>

<link rel="icon shortcut" href="./img/ICON.ico">

<!-- Bootstrap�x����� https://getbootstrap.com/ -->
<!-- �s��Bootstrap.min.css -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<!-- �ϥ�font awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">

<!-- �ϥ�google Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Sedgwick+Ave+Display&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Lakki+Reddy&display=swap"
	rel="stylesheet">

<!-- �ϥ�style.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.css">
<!-- <link rel="stylesheet" -->
<!-- 	href="https://kenwheeler.github.io/slick/slick/slick-theme.css"> -->

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

table#table-2 {
	width: 100%
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

</style>

</head>
<body style="">

	<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4>
	<table id="table-1">
		<tr>
			<td>
				<h3>���ʰӫ~��� - ListOneImmed.jsp</h3>
				<h5>
					<a href="select_page.jsp"><img src="images/back1.gif"
						width="100" height="32" border="0">�^����</a>
				</h5>
			</td>
		</tr>
	</table>

	<div class="container">
		<div class="immedName">
			<h4>${immedVO.immed_name}</h4>
		</div>

		<div class="row mt-4">
			<div class="col-md-3">
				<div class="intro_left">

					<div class="slider-for m-2">
						<div class="p-3">
							<img
								src="<%=request.getContextPath()%>/immed/ImmedPicRead?ID=${immedVO.immed_id}"
								class="card-img-top" alt="...">
						</div>
						<div class="p-3">
							<img
								src="<%=request.getContextPath()%>/immed/ImmedPicRead?ID=${immedVO.immed_id}"
								class="card-img-top" alt="...">
						</div>
						<div class="p-3">
							<img
								src="<%=request.getContextPath()%>/immed/ImmedPicRead?ID=${immedVO.immed_id}"
								class="card-img-top" alt="...">
						</div>
						<div class="p-3">
							<img
								src="<%=request.getContextPath()%>/immed/ImmedPicRead?ID=${immedVO.immed_id}"
								class="card-img-top" alt="...">
						</div>
					</div>
					<div class="slider-nav px-4 py-2">
						<div class="p-1 slider_nav_img">
							<img
								src="<%=request.getContextPath()%>/immed/ImmedPicRead?ID=${immedVO.immed_id}"
								class="card-img-top" alt="...">
						</div>
						<div class="p-1 slider_nav_img">
							<img
								src="<%=request.getContextPath()%>/immed/ImmedPicRead?ID=${immedVO.immed_id}"
								class="card-img-top" alt="...">
						</div>
						<div class="p-1 slider_nav_img">
							<img
								src="<%=request.getContextPath()%>/immed/ImmedPicRead?ID=${immedVO.immed_id}"
								class="card-img-top" alt="...">
						</div>
						<div class="p-1 slider_nav_img">
							<img
								src="<%=request.getContextPath()%>/immed/ImmedPicRead?ID=${immedVO.immed_id}"
								class="card-img-top" alt="...">
						</div>
					</div>

					<h6 class="immedId">�ӫ~�и�: ${immedVO.immed_id}</h6>

					<div class="immedRemark">
						<h6>�ӫ~�Ƶ�:</h6>
						<ul>
							<li>���~�Ҧb�a:</li>
							<li>�W�[�ɶ�: <fmt:formatDate value="${immedVO.ord_time}"
									pattern="yyyy-MM-dd HH:mm:ss" /></li>
							<li>�i��|���e�����c��</li>
						</ul>
					</div>

				</div>
			</div>

			<div class="col-md-9">
				<div class="intro_right">
					<div class="row m-2">
						<div class="immedBuy py-3 px-2">
							<span>���ʻ�: </span> <span class="price">$${immedVO.immed_prc}</span>
							<button type="button" class="btn btn-danger immed_buy"
								title="�����ʶR">�����ʶR</button>
						</div>
					</div>

					<div style="border-top: 1px solid #D3D3D3;" class="row mx-2 mt-4">
						<div class="col-md-8 mt-3">
							<div class="immedPay d-flex">
								<span>�B�e�覡: </span>
								<ul>
									<li>7-11���f�I�� 60 ��</li>
									<li>���a�BOK�B�ܺ��I���f�I�� 60 ��</li>
									<li>�v�t/�ֻ� 90 ��</li>
								</ul>
							</div>

						</div>
						<div class="col-md-4">
							<div class="saleInfo mt-3">
								<h6>��a��T</h6>
								<div style="border-bottom: 1px dashed #E6E9ED;">${immedVO.sale_id}</div>
								<div>�����ӫ~:</div>
								<div>��������:</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="immedDesc px-5 mx-5">
				<p class="immed_desc">${immedVO.immed_desc}</p>
			</div>
		</div>
	</div>

	<!-- 	<table id="table-2"> -->
	<!-- 		<tr> -->
	<!-- 			<th>�ӫ~�s��</th> -->
	<!-- 			<th>��a�s��</th> -->
	<!-- 			<th>�R�a�s��</th> -->
	<!-- 			<th>�ӫ~�����s��</th> -->
	<!-- 			<th>�ӫ~�W��</th> -->
	<!-- 			<th>�ӫ~�W�[�ɶ�</th> -->
	<!-- 			<th>�ӫ~����</th> -->
	<!-- 			<th>�ӫ~�Ϥ�</th> -->
	<!-- 			<th>�ӫ~�y�z</th> -->
	<!-- 			<th>�ӫ~��X���A</th> -->
	<!-- 			<th>�ӫ~�U�[���A</th> -->
	<!-- 			<th>�q��ɶ�</th> -->
	<!-- 			<th>�q�檬�A�s��</th> -->
	<!-- 			<th>����H�m�W</th> -->
	<!-- 			<th>����H�q��</th> -->
	<!-- 			<th>����H�a�}</th> -->

	<!-- 		</tr> -->
	<!-- 		<tr> -->
	<%-- 			<td>${immedVO.immed_id}</td> --%>
	<%-- 			<td>${immedVO.sale_id}</td> --%>
	<%-- 			<td>${immedVO.buy_id}</td> --%>
	<%-- 			<td>${immedVO.pt_id}</td> --%>
	<%-- 			<td><p class="immed_name">${immedVO.immed_name}</p></td> --%>
	<%-- 			<td><fmt:formatDate value="${immedVO.immed_start}" --%>
	<%-- 					pattern="yyyy-MM-dd HH:mm:ss" /></td> --%>
	<!-- 			<td>$${immedVO.immed_prc}</td> -->
	<!-- 			<td><img class="immed_pic" -->
	<%-- 				src="ImmedPicRead?ID=${immedVO.immed_id}"></td> --%>
	<%-- 			<td><p class="immed_desc">${immedVO.immed_desc}</p></td> --%>
	<%-- 			<td>${(immedVO.immed_sold eq 1) ? '�w��X' : '����X'}</td> --%>
	<%-- 			<td>${(immedVO.immed_down eq 1) ? "�w�U�[" : "���U�["}</td> --%>
	<%-- 			<td><fmt:formatDate value="${immedVO.ord_time}" --%>
	<%-- 					pattern="yyyy-MM-dd HH:mm:ss" /></td> --%>
	<%-- 			<td>${immedVO.ordstat_id}</td> --%>
	<%-- 			<td>${immedVO.rcpt_name}</td> --%>
	<%-- 			<td>${immedVO.rcpt_cell}</td> --%>
	<%-- 			<td><p class="rcpt_add">${immedVO.rcpt_add}</p></td> --%>
	<%-- 			<%-- 		<td><%=immedVO.getEname()%></td> --%>
	<%-- 			<%-- 		<td><%=immedVO.getJob()%></td> --%>
	<%-- 			<%-- 		<td><%=immedVO.getHiredate()%></td> --%>
	<%-- 			<%-- 		<td><%=immedVO.getSal()%></td> --%>
	<%-- 			<%-- 		<td><%=immedVO.getComm()%></td> --%>
	<%-- 			<%-- 		<td><%=immedVO.getDeptno()%></td> --%>
	<!-- 		</tr> -->
	<!-- 	</table> -->

	<!-- �s��Bootstrap�һݭn��js -->
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

	<!-- 	<script type="text/javascript" -->
	<!-- 		src="https://code.jquery.com/jquery-1.11.0.min.js"></script> -->

	<!-- 	<script type="text/javascript" -->
	<!-- 		src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script> -->

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