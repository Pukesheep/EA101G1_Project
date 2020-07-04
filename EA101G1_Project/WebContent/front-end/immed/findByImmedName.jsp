<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.immed.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%	request.setCharacterEncoding("UTF-8");
	String immedName = request.getParameter("immed_search"); 
	ImmedService immedSvc = new ImmedService();
	List<ImmedVO> list = immedSvc.findByImmedName(immedName);
	pageContext.setAttribute("list", list);
%>

<html>
<head>
<title>所有商品資料 - listAllImmed.jsp</title>
<link rel="icon shortcut" href="./img/ICON.ico">
<!-- Bootstrap官方網站 https://getbootstrap.com/ -->
<!-- 連結Bootstrap.min.css -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
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
	href="<%=request.getContextPath()%>/front-end/css/style.css">

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
	<!-- navbar -->
	<!-- 使用Boostrap Navbar -->
	<!-- 設定Navbar緊貼畫面上緣 -->
	<!-- b4-navbar-default 安裝Bootstrap外掛,可以使用快捷指令 -->
	<nav class="navbar navbar-expand-md navbar-dark fixed-top">
		<a class="navbar-brand" href="index.html"> <span class="logo"><i
				class="fas fa-bomb"></i></span> <span class="logo2">S.F.G</span> <span
			class="logo3">{{{</span>
		</a>
		<!-- 手機選單按鈕 -->
		<button class="navbar-toggler d-lg-none" type="button"
			data-toggle="collapse" data-target="#collapsibleNavId"
			aria-controls="collapsibleNavId" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="navbar2 navbar-dark">
			<div class="row">
				<div class="item col-md-2">
					<a href="#"></a>商城
				</div>
				<div class="item col-md-2">
					<a href="#"></a>團購
				</div>
				<div class="item col-md-2">
					<a href="#"></a>交易
				</div>
				<div class="item col-md-2">
					<a href="#"></a>討論區
				</div>
				<div class="item col-md-2">
					<a href="#"></a>紅利
				</div>
				<div class="item col-md-2">
					<a href="#"></a>Q&A
				</div>
			</div>
		</div>

		<div class="collapse navbar-collapse" id="collapsibleNavId">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="#">登入</a></li>
				<li class="nav-item"><a class="nav-link" href="#">註冊</a></li>
				<li class="nav-item"><a class="nav-link" href="#">會員中心</a></li>
				<li class="nav-item"><a class="nav-link" href="#">我的最愛</a></li>
				<li class="nav-item"><a class="nav-link" href="#">購物車</a></li>

			</ul>
		</div>


	</nav>
	<!-- navbar end -->
	<section class="blank0"></section>
	<!-- 內容 -->
	<section class="blank1">
		<div class="container">
			<!-- 			<div class="row mb-1"> -->
			<!-- 				<table id="table-1"> -->
			<!-- 					<tr> -->
			<!-- 						<td> -->
			<!-- 							<h3>所有商品資料 - listAllImmed.jsp</h3> -->
			<!-- 							<h4> -->
			<!-- 								<a -->
			<%-- 									href="<%=request.getContextPath()%>/front-end/immed/select_page.jsp"><img --%>
			<%-- 									src="<%=request.getContextPath()%>/front-end/immed/images/back1.gif" --%>
			<!-- 									width="100" height="32" border="0">回首頁</a> -->
			<!-- 							</h4> -->
			<!-- 						</td> -->
			<!-- 					</tr> -->
			<!-- 				</table> -->
			<!-- 			</div> -->

			<!-- 			<div class="row"> -->
			<%-- 				錯誤表列 --%>
			<%-- 				<c:if test="${not empty errorMsgs}"> --%>
			<!-- 					<font style="color: red">請修正以下錯誤:</font> -->
			<!-- 					<ul> -->
			<%-- 						<c:forEach var="message" items="${errorMsgs}"> --%>
			<%-- 							<li style="color: red">${message}</li> --%>
			<%-- 						</c:forEach> --%>
			<!-- 					</ul> -->
			<%-- 				</c:if> --%>
			<!-- 			</div> -->
			<div class="row mb-4">
				<%@ include file="../../files/page1.file"%>
			</div>

			<form method="post" action="<%=request.getContextPath()%>/immed/immed.do">
				<input type="text" name="immed_search"> <input
					type="hidden" name="action" value="findByImmedName"> <input
					type="submit" value="搜尋">
			</form>
			
			<div class="row mb-4">
				<c:forEach var="immedVO" items="${list}" begin="<%=pageIndex%>"
					end="<%=pageIndex+rowsPerPage-1%>">
					<div class="col-6 col-md-3">
						<div class="card mb-4 px-2 pt-2">
							<a
								href="<%=request.getContextPath()%>/immed/immed.do?action=getOne_For_Display&immed_id=${immedVO.immed_id}"
								title="${immedVO.immed_name}"><img
								src="<%=request.getContextPath()%>/immed/ImmedPicRead?ID=${immedVO.immed_id}"
								class="card-img-top" alt="..."></a>
							<div class="card-body">
								<a
									href="<%=request.getContextPath()%>/front-end/immed/immed.do?immed=${immedVO.immed_id}"
									title="${immedVO.immed_name}"><h5 class="card-title">${immedVO.immed_name}</h5></a>
								<p class="card-price">$${immedVO.immed_prc}</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="row">
				<%@ include file="../../files/page2.file"%>
			</div>
			<!-- 			<table id="table-1"> -->
			<!-- 				<tr> -->
			<!-- 					<td> -->
			<!-- 						<h3>所有商品資料 - listAllImmed.jsp</h3> -->
			<!-- 						<h4> -->
			<!-- 							<a -->
			<%-- 								href="<%=request.getContextPath()%>/front-end/immed/select_page.jsp"><img --%>
			<%-- 								src="<%=request.getContextPath()%>/front-end/immed/images/back1.gif" --%>
			<!-- 								width="100" height="32" border="0">回首頁</a> -->
			<!-- 						</h4> -->
			<!-- 					</td> -->
			<!-- 				</tr> -->
			<!-- 			</table> -->

			<%-- 錯誤表列 --%>
			<%-- 			<c:if test="${not empty errorMsgs}"> --%>
			<!-- 				<font style="color: red">請修正以下錯誤:</font> -->
			<!-- 				<ul> -->
			<%-- 					<c:forEach var="message" items="${errorMsgs}"> --%>
			<%-- 						<li style="color: red">${message}</li> --%>
			<%-- 					</c:forEach> --%>
			<!-- 				</ul> -->
			<%-- 			</c:if> --%>

			<!-- 			<table id="table-2"> -->
			<!-- 				<tr> -->
			<!-- 					<th>商品編號</th> -->
			<!-- 					<th>賣家編號</th> -->
			<!-- 					<th>買家編號</th> -->
			<!-- 					<th>商品種類編號</th> -->
			<!-- 					<th>商品名稱</th> -->
			<!-- 					<th>商品上架時間</th> -->
			<!-- 					<th>商品價格</th> -->
			<!-- 					<th>商品圖片</th> -->
			<!-- 					<th>商品描述</th> -->
			<!-- 					<th>商品售出狀態</th> -->
			<!-- 					<th>商品下架狀態</th> -->
			<!-- 					<th>訂單時間</th> -->
			<!-- 					<th>訂單狀態編號</th> -->
			<!-- 					<th>收件人姓名</th> -->
			<!-- 					<th>收件人電話</th> -->
			<!-- 					<th>收件人地址</th> -->
			<!-- 					<th>修改</th> -->
			<!-- 					<th>刪除</th> -->
			<!-- 				</tr> -->

			<%-- 							<%@ include file="../file/page1.file"%> --%>
			<%-- 				<c:forEach var="immedVO" items="${list}" begin="<%=pageIndex%>" --%>
			<%-- 					end="<%=pageIndex+rowsPerPage-1%>"> --%>
			<!-- 					<tr> -->
			<%-- 						<td>${immedVO.immed_id}</td> --%>
			<%-- 						<td>${immedVO.sale_id}</td> --%>
			<%-- 						<td>${immedVO.buy_id}</td> --%>
			<%-- 						<td>${immedVO.pt_id}</td> --%>
			<%-- 						<td><p class="immed_name">${immedVO.immed_name}</p></td> --%>
			<%-- 						<td><fmt:formatDate value="${immedVO.immed_start}" --%>
			<%-- 								pattern="yyyy-MM-dd HH:mm:ss" /></td> --%>
			<!-- 						<td>$${immedVO.immed_prc}</td> -->
			<!-- 						<td><img class="immed_pic" -->
			<%-- 							src="<%=request.getContextPath()%>/front-end/immed/ImmedPicRead?ID='${immedVO.immed_id}'"></td> --%>
			<%-- 						<td><p class="immed_desc">${immedVO.immed_desc}</p></td> --%>
			<%-- 						<td>${immedVO.immed_sold eq 1 ? "已售出" : "未售出"}</td> --%>
			<%-- 						<td>${immedVO.immed_down eq 1 ? "已下架" : "未下架"}</td> --%>
			<%-- 						<td><fmt:formatDate value="${immedVO.ord_time}" --%>
			<%-- 								pattern="yyyy-MM-dd HH:mm:ss" /></td> --%>
			<%-- 						<td>${immedVO.ordstat_id}</td> --%>
			<%-- 						<td>${immedVO.rcpt_name}</td> --%>
			<%-- 						<td>${immedVO.rcpt_cell}</td> --%>
			<%-- 						<td><p class="rcpt_add">${immedVO.rcpt_add}</p></td> --%>
			<!-- 						<td> -->
			<!-- 							<FORM METHOD="post" -->
			<%-- 								ACTION="<%=request.getContextPath()%>/front-end/immed/immed.do" --%>
			<!-- 								style="margin-bottom: 0px;"> -->
			<!-- 								<input type="submit" value="修改"> <input type="hidden" -->
			<%-- 									name="immed_id" value="${immedVO.immed_id}"> <input --%>
			<!-- 									type="hidden" name="action" value="getOne_For_Update"> -->
			<!-- 							</FORM> -->
			<!-- 						</td> -->
			<!-- 						<td> -->
			<!-- 							<FORM METHOD="post" -->
			<%-- 								ACTION="<%=request.getContextPath()%>/front-end/immed/immed.do" --%>
			<!-- 								style="margin-bottom: 0px;"> -->
			<!-- 								<input type="submit" value="刪除"> <input type="hidden" -->
			<%-- 									name="immed_id" value="${immedVO.immed_id}"> <input --%>
			<!-- 									type="hidden" name="action" value="delete"> -->
			<!-- 							</FORM> -->
			<!-- 						</td> -->
			<!-- 					</tr> -->
			<%-- 				</c:forEach> --%>
			<!-- 			</table> -->
			<%-- 						<%@ include file="../file/page2.file"%> --%>
	</section>
	<!-- 內容 ---end  -->


	<!-- footer -->
	<footer id="footer" class="pt-5 ">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-6 footer-list">
					<h5>
						快速連結
						</h4>
						<ul>
							<li><a class="footer-link" href="">S.F.G首頁</a></li>
							<li><a class="footer-link" href="">註冊會員</a></li>
							<li><a class="footer-link" href="">商城</a></li>
							<li><a class="footer-link" href="">團購</a></li>
						</ul>
				</div>
				<div class="col-md-3 col-sm-6 footer-list">
					<h5 class="text-uppercase">會員互動</h5>
					<ul>
						<li><a class="footer-link" href="">競標區</a></li>
						<li><a class="footer-link" href="">直購區</a></li>
						<li><a class="footer-link" href="">討論區</a></li>
						<li><a class="footer-link" href="">聊天室</a></li>
					</ul>
				</div>
				<div class="col-md-3 col-sm-6 footer-list">
					<h5 class="text-uppercase">關於我們</h5>
					<ul>
						<li><a class="footer-link" href="">關於S.F.G</a></li>
						<li><a class="footer-link" href="">最新消息</a></li>
						<li><a class="footer-link" href="">隱私權政策</a></li>
					</ul>
				</div>
				<div class="col-md-3 col-sm-6 footer-list">
					<h5 class="text-uppercase">技術支援</h5>
					<ul>
						<li><a class="footer-link" href="">新手上路</a></li>
						<li><a class="footer-link" href="">幫助&支援</a></li>
						<li><a class="footer-link" href="">服務條款</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="footer-end bg-dark mt-5 py-2">
			<p class="text-center">&copy; Copy right 2020</p>
		</div>
	</footer>

	<button id="chatBtn" class="bg-primary">
		<i class="fas fa-comments"></i>
	</button>


	<!-- 連結Bootstrap所需要的js -->
	<!-- jquery.min.js -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- popper.min.js -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<!-- bootstrap.min.js -->
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>

</body>
</html>