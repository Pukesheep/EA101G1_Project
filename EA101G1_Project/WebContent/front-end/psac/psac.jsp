<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.psac.model.*"%>

<%
	PsacVO psacVO = (PsacVO) request.getAttribute("psacVO");
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>S.F.G首頁</title>
<!-- TODO: 換title 的icon -->
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>


<style>
table#a {
	width: 100%;
	background-color: #5588DD;
	margin-top: 100px;
	margin-bottom: 10px;
	border: 5px solid Gray;
	height: 50px;
	text-align: center;
}

table#b {
	width: 50%;
	background-color: #AABB44;
	margin: 20px auto;
	height: 50px;
	text-align: center;
}

table, th, td {
	border: 1px solid #111111;
}

body {
	background-color: #455555;
}

textarea {
	width: 90%;
	height: 200px;
}
</style>

</head>

<body>
	<!-- navbar -->
	<!-- 使用Boostrap Navbar -->
	<!-- 設定Navbar緊貼畫面上緣 -->
	<!-- b4-navbar-default 安裝Bootstrap外掛,可以使用快捷指令 -->
	<nav class="navbar navbar-expand-md navbar-dark fixed-top">
		<a class="navbar-brand"
			href="<%=request.getContextPath()%>/front-end/index.jsp"> <span
			class="logo"><i class="fas fa-bomb"></i></span> <span class="logo2">S.F.G</span>
			<span class="logo3">{{{</span>
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
					<a
						href="<%=request.getContextPath()%>/front-end/post/listAllPost.jsp">討論區</a>
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
				<c:if test="${memberVO == null}">
					<li class="nav-item"><a class="nav-link"
						href="<%=request.getContextPath()%>/front-end/member/login.jsp">登入</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="<%=request.getContextPath()%>/front-end/member/addMember.jsp">註冊</a>
					</li>
				</c:if>
				<c:if test="${memberVO ne null}">
					<li class="nav-item"><a class="nav-link"
						href="<%=request.getContextPath()%>/front-end/protected/listOneMember.jsp">會員中心</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="<%=request.getContextPath()%>/member/member.do?action=logout">登出</a>
					</li>
				</c:if>
				<li class="nav-item"><a class="nav-link" href="#">我的最愛</a></li>
				<li class="nav-item"><a class="nav-link" href="#">購物車</a></li>

			</ul>
		</div>


	</nav>
	<!-- navbar end -->
	<section class="blank0"></section>
	<!-- 內容 -->
	<section class="blank1">

		<table id="a">
			<tr>
				<td><h2>檢舉表單</h2></td>
			</tr>
		</table>

		<FORM METHOD="post"
			ACTION="<%=request.getContextPath()%>/psac/psac.do"
			style="margin-bottom: 0px;">
			<table id="b" class="table table-striped">
				<tr>
					<th>檢舉原因</th>
					<th>請勾選(可複選)</th>
				</tr>
				<tr>
					<td>重複刊登</td>
					<td><input type="checkbox" name="reason" value="重複刊登"></td>
				</tr>
				<tr>
					<td>商品含色情或暴力內容</td>
					<td><input type="checkbox" name="reason" value="商品含色情或暴力內容"></td>
				</tr>
				<tr>
					<td>違法商品</td>
					<td><input type="checkbox" name="reason" value="違法商品"></td>
				</tr>
				<tr>
					<td>仿冒商品</td>
					<td><input type="checkbox" name="reason" value="仿冒商品"></td>
				</tr>
				<tr>
					<td>商品定價太高</td>
					<td><input type="checkbox" name="reason" value="商品定價太高"></td>
				</tr>
				<tr>
					<td>商品類別有誤</td>
					<td><input type="checkbox" name="reason" value="商品類別有誤"></td>
				</tr>
				<tr>
					<td>刊登不實內容</td>
					<td><input type="checkbox" name="reason" value="刊登不實內容"></td>
				</tr>
				</tr>
				<tr>
					<td>廣告訊息</td>
					<td><input type="checkbox" name="reason" value="廣告訊息"></td>
				</tr>
				<tr>
					<td>文章內容充滿色情文字</td>
					<td><input type="checkbox" name="reason" value="文章內容充滿色情文字"></td>
				</tr>
				<tr>
					<td>文章內容帶政治色彩</td>
					<td><input type="checkbox" name="reason" value="文章內容帶政治色彩"></td>
				</tr>
				<tr>
					<td>假冒他人</td>
					<td><input type="checkbox" name="reason" value="假冒他人"></td>
				</tr>
				<tr>
					<td id="a">檢舉內容</td>
					<td><textarea name="reason"></textarea></td>
				</tr>

				<tr>
					<td>送出表單</td>
					<td><input type="hidden" name="mem_id"  value="${psacVO.mem_id}"> 
						<input type="hidden" name="post_id" value="${psacVO.post_id}"> 
						<input type="hidden" name="action"  value="report"> 
						<input type="submit" class="btn btn-primary" id="base" value="確認送出">
					</td>
				</tr>
			</table>

		</FORM>




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
							<li><a class="footer-link"
								href="<%=request.getContextPath()%>/front-end/index.jsp">S.F.G首頁</a>
							</li>
							<li><a class="footer-link"
								href="<%=request.getContextPath()%>/front-end/member/addMember.jsp">註冊會員</a>
							</li>
							<li><a class="footer-link" href="">商城</a></li>
							<li><a class="footer-link" href="">團購</a></li>
						</ul>
				</div>
				<div class="col-md-3 col-sm-6 footer-list">
					<h5 class="text-uppercase">會員互動</h5>
					<ul>
						<li><a class="footer-link" href="">競標區</a></li>
						<li><a class="footer-link" href="">直購區</a></li>
						<li><a class="footer-link"
							href="<%=request.getContextPath()%>/front-end/post/listAllPost.jsp">討論區</a>
						</li>
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

</body>

</html>