<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.auct.model.*"%>
<%@ page import="com.member.model.*"%>

<%
	AuctVO auctVO = (AuctVO) request.getAttribute("auctVO"); //AuctServlet.java(Controller), �s�Jreq��auctVO����

	MemberVO memVO = (MemberVO) session.getAttribute("memberVO");
	pageContext.setAttribute("memVO", memVO);
%>

<jsp:useBean id="PtSvc" scope="page"
	class="com.productType.model.PtService" />
<jsp:useBean id="MemberSvc" scope="page"
	class="com.member.model.MemberService" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BID�v�бM��</title>
<!-- TODO: ��title ��icon -->
<link rel="icon shortcut" href="./img/ICON(yellow).ico">
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
	href="<%=request.getContextPath()%>/front-end/css/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/css/Auct_index.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/css/bid_product.css">

<!-- �s��Bootstrap�һݭn��js -->
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
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
</head>
<body onload="connect();" onunload="disconnect();">

	<!-- navbar -->
	<nav class="navbar navbar-expand-md navbar-dark fixed-top">
		<a class="navbar-brand" href="All_index.jsp"> <span class="logo"><i
				class="fas fa-bomb"></i></span> <span class="logo2">S.F.G</span> <span
			class="logo3">{{{</span>
		</a>
		<!-- ��������s -->
		<button class="navbar-toggler d-lg-none" type="button"
			data-toggle="collapse" data-target="#collapsibleNavId"
			aria-controls="collapsibleNavId" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<!-- ���e -->
		<div class="navbar2 navbar-dark">
			<div class="row">
				<div class="item col-md-2">
					<a href="#">�ӫ�</a>
				</div>
				<div class="item col-md-2">
					<a href="#">����</a>
				</div>
				<div class="item col-md-2">
					<a href="Auct_index.jsp">�v�а�</a>
				</div>
				<div class="item col-md-2">
					<a href="#">���ʰ�</a>
				</div>
				<div class="item col-md-2">
					<a href="#">�Q�װ�</a>
				</div>
				<div class="item col-md-2">
					<a href="#">���Q</a>
				</div>
			</div>
		</div>

		<div class="collapse navbar-collapse" id="collapsibleNavId">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="#">�n�X</a></li>
				<li class="nav-item"><a class="nav-link" href="#">���U</a></li>
				<li class="nav-item"><a class="nav-link" href="#">�|������</a></li>
				<li class="nav-item"><a class="nav-link" href="#">�ڪ��̷R</a></li>
				<li class="nav-item"><a class="nav-link" href="#">�ʪ���</a></li>

			</ul>
		</div>
	</nav>
	<!-- navbar end -->

	<section class="blank0"></section>

	<header class="nav-auct container">
		<ul class="text-right">
			<a href="Auct_index.jsp"><li class="auct-navbtn">�v�бM��</li></a>
			<a href="Results_all.jsp"><li class="auct-navbtn">���бM��</li></a>
			<a><li class="auct-navbtn">�X���O��</li></a>
			<a><li class="auct-navbtn">�ԧQ�~</li></a>
			<a href="listAllAuct.jsp"><li class="auct-navbtn">�ڪ�����</li></a>
		</ul>
		<h6 class="h6">
			<a class="a-index" href="All_index.jsp">����</a> > <a class="a-index"
				href="Auct_index.jsp">�v�а�</a> > BID
		</h6>

	</header>

	<section class="auct-all container bg-white">
		<div class="">
			<div class="auct-title py-2">
				<h6>&nbsp&nbsp&nbsp&nbsp�ӫ~�W��</h6>
			</div>
			<div class="auct-list row px-3 py-3">

				<div class="product col-md-4 mb-3">
					<div class="product-rel">
						<div class="auct-title  py-2">
							<h6 class="text-center">�ӫ~�W��</h6>
						</div>
						<div class="auct-list">
							<div>
								<img class="produce-img"
									src="<%=request.getContextPath()%>/front-end/auct/pic.do?auct_id=${auctVO.auct_id}"
									alt="">
							</div>
							<div class="mt-3">
								<ul class="ml-5">
									<li class="text-left">���s��: ${auctVO.auct_id}</li>
									<li class="text-left">�ӫ~����:
										${PtSvc.getOneProductType(auctVO.pt_id).typename}</li>
									<li class="text-left">����&nbsp&nbsp:&nbsp
										${MemberSvc.getOneMember(auctVO.sale_id).mem_name}</li>
									<li class="text-left">�}�l�ɶ�: <fmt:formatDate
											value="${auctVO.auct_start}" pattern="yyyy-MM-dd HH:mm:ss" /></li>
									<li class="text-left">�_�л�&nbsp&nbsp:&nbsp
										${auctVO.initPrice} ��</li>
									<li class="text-left">�X���W�B: ${auctVO.auct_inc} ��</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="product col-md-4 ">
					<div class="product-rel">
						<div class="auct-title  py-2">
							<h4 class="text-center" id="titlescore"></h4>
							<h4 class="text-center">00:00:10</h4>
						</div>
						<div class="auct-list1 mx-5">
							<div class=" py-2 bg-white">
								<ul>
									<li class="market">���� : 5000��</li>
									<li class="market" id="score"></li>
									<li class="market">�{�� : ��</li>
								</ul>
							</div>
						</div>
						<div>
							<ul>
								<li>
									<h6>�ثeĹ�a:</h6>
								</li>
								<input type="text" name="${memVO.mem_id}" id="${memVO.mem_id}"
									value="${memVO.mem_name}">
								<li><button type="submit" class="bid-btn my-2" id="button"
										onclick="sendMessage();">BID / �v��</button></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="product col-md-4 mb-3">
					<div class="product-rel">
						<div class="auct-title py-3">
							<h6 class="text-center">�U�аO��</h6>
						</div>
						<div class="bid-table">
							<div>
								<table id="messagesArea" style="overflow-y:auto; height:300px">
									<tr>
										<th>NTD</th>
										<th>�U�Ъ�</th>
										<th>�X���ɶ�</th>
									</tr>


								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- JSTL for-each   end-->
			</div>
			<div class="product col-md-12 mb-5">
				<div class="product-rel">
					<div class="auct-title  py-2">
						<h6 class="pl-3">�ӫ~�y�z</h6>
					</div>
					<div class="auct-list px-5 py-4">
						<h4 class="describe">${auctVO.auct_desc}</h4>
					</div>
				</div>
			</div>
			<a href="Auct_index.jsp"><button type="submit"
					class="back-btn mb-4">�^�v�бM��</button></a>
		</div>
	</section>

	<button id="chatBtn" class="bg-primary">
		<i class="fas fa-comments"></i>
	</button>


	<script type="text/javascript">
		var plus = ${auctVO.auct_inc}; //���g�����[��
		var pro = "${auctVO.auct_id}";
		console.log(pro);
		var MyPoint = "/TogetherWS/${memVO.mem_name}/${auctVO.auct_id}";
		var host = window.location.host;
		var path = window.location.pathname;
		var webCtx = path.substring(0, path.indexOf('/', 1));
		var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;

		var titlescore = document.getElementById("titlescore");
		var score = document.getElementById("score");
		var webSocket;

		function connect() {

			webSocket = new WebSocket(endPointURL);
			webSocket.onopen = function(event) {
				// 			console.log(event);
			}
			webSocket.onmessage = function(event) {
				var messagesArea = document.getElementById("messagesArea");
				var jObj = JSON.parse(event.data);
				// 			console.log(jsonObj.userName);
				// 			console.log(jsonObj.score);
				var arr = jObj.record;
				console.log(arr);
				for (var i = 0; i < arr.length; i++) {
				// 			for(var i = 0;i<jsonObj.set.length;i++){
				// 				var array = [];
				// 				array[i] = jsonObj.set[i];
				// 				console.log(array[i]);
				// 			}
					$('#titlescore').text(arr[i].score);
					$('#score').text(arr[i].score);
// 				messagesArea.innerHTML="";
				
 
//      alert(jsonObj.userName);
    
					messagesArea.innerHTML += '<tr><td>' + arr[i].userName
					+ '</td><td>' + arr[i].score + '</td></tr>';
							
				// 			score.innerHTML=jsonObj.score;
				// 			score.innerHTML=jsonObj.score;
				
				}
				
				messagesArea.scrollTop = messagesArea.scrollHeight;
			};

		}

		var inputUserName = document.getElementById("${memVO.mem_id}");

		function sendMessage() {

			var userName = inputUserName.value.trim();
			var nowscore = parseInt($('#score').text());
			score = parseInt(nowscore) + plus;
			console.log(score);
			$('#score').text(nowscore + plus);
			var now = new Date();
			var jsonObj = {
				"userName" : userName,
				"score" : score,
				"product" : pro,
				"type" : plus
			};

			webSocket.send(JSON.stringify(jsonObj));//�ǥX�X���H+��s�̰���

		}
		function disconnect() {
			webSocket.close();
		}
	</script>


</body>
</html>