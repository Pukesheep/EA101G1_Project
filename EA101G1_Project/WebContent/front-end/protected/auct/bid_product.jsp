<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.auct.model.*"%>
<%@ page import="com.member.model.*"%>

<%
	AuctVO auctVO = (AuctVO) request.getAttribute("auctVO"); //AuctServlet.java(Controller), 存入req的auctVO物件

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
<title>BID競標專區</title>
<!-- TODO: 換title 的icon -->
<link rel="icon shortcut" href="./img/ICON(yellow).ico">
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
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/css/Auct_index.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/css/bid_product.css">

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
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>

<style>

.countdown{
	font-size:30px;
	color:red;
}

.row1 {
	width: 94px;
}
.row2 {
	width: 138px;
}
.row3 {
	width: 94px;
}

</style>



</head>

<!-- 進入頁面onload 連線 connect()             -->
<body onload="connect(); init();" onunload="disconnect();">

	<!-- navbar -->
		<%@ include file="/files/header.jsp" %>
	<!-- navbar end -->

	<section class="blank0"></section>

	<header class="nav-auct container">
		<ul class="text-right">
			<li class="auct-navbtn">
                <a href="<%=request.getContextPath()%>/front-end/protected/auct/Auct_index.jsp">競標專區</a>
            </li>
            <li class="auct-navbtn">
                <a href="<%=request.getContextPath()%>/front-end/protected/auct/Results_all.jsp">結標專區</a>
            </li>
           
            <li class="auct-navbtn">
                <a href="<%=request.getContextPath()%>/front-end/protected/auct/buy_order.jsp">戰利品</a>
            </li>
            <li class="auct-navbtn">
                <a href="<%=request.getContextPath()%>/front-end/protected/auct/listAllAuct.jsp">我的拍賣區</a>
            </li>
		</ul>
		<h6 class="h6">
			<a class="a-index" href="All_index.jsp">首頁</a> > <a class="a-index"
				href="Auct_index.jsp">競標區</a> > BID
		</h6>

	</header>

	<section class="auct-all container bg-white">
		<div class="">
			<div class="auct-title py-2">
				<h6>&nbsp&nbsp&nbsp&nbsp商品名稱</h6>
			</div>
			<div class="auct-list row px-3 py-3">

				<div class="product col-md-4 mb-3">
					<div class="product-rel">
						<div class="auct-title  py-2">
							<h6 class="text-center">商品名稱</h6>
						</div>
						<div class="auct-list">
							<div class="text-center">
								<img class="produce-img"
									src="<%=request.getContextPath()%>/front-end/auct/pic.do?auct_id=${auctVO.auct_id}"
									alt="">
							</div>
							<div class="mt-3">
								<ul class="ml-5">
									<li class="text-left">拍賣編號: ${auctVO.auct_id}</li>
									<li class="text-left">商品分類:
										${PtSvc.getOneProductType(auctVO.pt_id).typename}</li>
									<li class="text-left">拍賣者&nbsp&nbsp:&nbsp
										${MemberSvc.getOneMember(auctVO.sale_id).mem_name}</li>
									<li class="text-left">開始時間: <fmt:formatDate
											value="${auctVO.auct_start}" pattern="yyyy-MM-dd HH:mm:ss" /></li>
									<li class="text-left">起標價&nbsp&nbsp:&nbsp
										${auctVO.initPrice} 元</li>
									<li class="text-left">出價增額: ${auctVO.auct_inc} 元</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="product col-md-4 ">
					<div class="product-rel">
						<div class="auct-title  py-2">
							<h4 class="text-center" id="titlescore"></h4>
							<div class="text-center" id="countdown"></div>
						</div>
						<div class="auct-list1 mx-5">
							<div class=" py-2 bg-white">
								<ul>
									<li class="market" >市價 : <font id="marketPrice">${auctVO.marketPrice}</font> 元</li>
									<li class="market" >目前 : <font id="score"></font> 元</li>
									<li class="market" >現省 : <font id="saveMoney" style="color:red;"></font> 元</li>
								</ul>
							</div>
						</div>
						<div>
							<ul>
								<li>
									<h6>目前贏家:</h6>
								</li>
								<input type="hidden" name="${memVO.mem_id}" id="${memVO.mem_id}"
									value="${memVO.mem_id}">
								<li><button type="submit" class="bid-btn my-2" id="button"
										onclick="sendMessage();saveMoney();">BID / 競標</button></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="product col-md-4 mb-3">
					<div class="product-rel">
						<div class="auct-title py-3">
							<h6 class="text-center">排行榜</h6>
						</div>
						<div class="bid-table">
							<div style="height:285px; overflow-y:hidden;">
								<table>
									<tr>
										<th class="mx-5">名次</th>
										<th>下標者</th>
										<th>NTD</th>
									</tr>
								</table>
								
								<table id="messagesArea" >

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
						<h6 class="pl-3">商品描述</h6>
					</div>
					<div class="auct-list px-5 py-4">
						<h4 class="describe">${auctVO.auct_desc}</h4>
					</div>
				</div>
			</div>
			<a href="<%=request.getContextPath()%>/front-end/protected/auct/Auct_index.jsp"><button type="submit"
					class="back-btn mb-4">回競標專區</button></a>
		</div>
	</section>

	<button id="chatBtn" class="bg-primary">
		<i class="fas fa-comments"></i>
	</button>


	<script type="text/javascript">
		var plus = ${auctVO.auct_inc}; //加價
		var pro = "${auctVO.auct_id}"; //商品ID
		console.log(pro);
		var MyPoint = "/TogetherWS/${memVO.mem_id}/${auctVO.auct_id}";
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
			webSocket.onmessage = function(event) { //從控制器C, 送來前端的資訊
				var messagesArea = document.getElementById("messagesArea");
				var jObj = JSON.parse(event.data);
				// 			console.log(jsonObj.userName);
				// 			console.log(jsonObj.score);
				var arr = jObj.record;
				console.log(arr);
				for (var i = 0; i < arr.length; i++) {

					$('#titlescore').text(parseInt(arr[i].score) );
					$('#score').text(parseInt(arr[i].score) );
				
 
//      alert(jsonObj.userName);
					var rank=1;
					var str =  '<tr><td class="row1">' + rank + '</td>'
								 + '<td class="row2">' + arr[i].userName + '</td>'
								 + '<td class="row3">' + parseInt(arr[i].score) + '</td></tr>';

					$("#messagesArea").prepend(str); //jQuery 加在字串的前面

					$('.row1').each(function(i, item){ 
						$(item).text(i+1);			   
					});
				}
				
			};

		} //onload --end

		var inputUserID= document.getElementById("${memVO.mem_id}");

		function sendMessage() {  //送進C

			var userID = inputUserID.value.trim();
			var nowscore = parseInt($('#score').text());
			score = parseInt(nowscore) + plus;
			console.log(score);
			$('#score').text(nowscore + plus);
			var now = new Date();
			var jsonObj = {
				"userID" : userID,
				"score" : score,
				"product" : pro,
				"type" : plus
			};

			webSocket.send(JSON.stringify(jsonObj));//傳入 競標者ID+刷新最高價
			
		}
		
		function disconnect() {  //disconnect()斷線
			webSocket.close();
		}
		
// 		websocket---end
// ====================================================================================================================================	
		//倒數計時器
		
		<%
			Long auct_end = auctVO.getAuct_end().getTime();
		%>
		var remain = null;
		
		function init(){
			
			var auct_end = <%=auct_end%>;
			var initSize = 12;
			var timer = setInterval(function(){
				var now = new Date().getTime();
				    remain = Math.ceil((auct_end - now) / 1000);
				var day = Math.floor(remain / 86400);
				var hour = Math.floor(remain % 86400 / 3600);
				var minute = Math.floor((remain % 86400 % 3600) / 60);
				var second = (((remain % 86400) % 3600) % 60);
				
				$('#countdown').text(day+'天'+' ' + hour+':'+' ' + minute+':'+' ' + second);
				$('#countdown').addClass('countdown');
				
				saveMoney();
				
				//倒數10秒, 數字變大
				if(remain < 10 && remain > 0) {
					initSize += 0.3;
					$('#countdown').css('font-size', initSize+'px');
				}
				
				//時間到, 競標結束
				if(remain  == 0){
					if(timer) clearInterval(timer);	 //停止timer,不會每0.1秒做一次			
					sendAjax();
				}
			}, 100);
			
			
		}
// 		window.onload = init; //當載入頁面, 呼叫init function, 啟動計時器 (已經寫在body開始處)
		

		function sendAjax(){  //送Ajax 回控制器
			$.ajax({ // Ajax開始
				url: '<%=request.getContextPath()%>/front-end/auct/auct.do',  
				type: 'POST', 
				data: {
					auct_id: '<%=auctVO.getAuct_id()%>',
					mem_id:'<%=memVO.getMem_id()%>',
					action: 'timeout'
				},
				success: function(result){
				
				    if(true){
				    	
				    alert("恭喜得標");
				    document.location.href = '<%=request.getContextPath()%>/front-end/protected/auct/payMoney.jsp';		
				    }
				
				    if(false){
					alert("競標結束 !!"); 
// 					alert("OK"); //可以改sweetAlert
					document.location.href = '<%=request.getContextPath()%>/front-end/protected/auct/Auct_index.jsp';
				    }
				}// success結束
			});  // Ajax結束
		}
		
		
		/********現省多少錢********/
		function saveMoney(){
			var marketPrice = $('#marketPrice').text();
// 			console.log(marketPrice);
			var score = $('#score').text();
// 			console.log(score);
			var saveMoney = marketPrice-score;
			$('#saveMoney').text(saveMoney);
// 			console.log(saveMoney);

			//如果 小於10秒, 每點一次加回10秒
// 			if(remain < 10 && remain > 0) {
// 				auct_end = ((10 - remain) + auct_end/1000) * 1000;
// 			}
			
		}
		
		
	</script>


</body>
</html>