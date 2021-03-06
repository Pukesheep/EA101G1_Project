<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.groupbuy.model.*" %>
<%@ page import="com.product.model.*" %>

<%
	GroupbuyVO groupbuyVO = (GroupbuyVO) request.getAttribute("groupbuyVO");
%>

<jsp:useBean id="groupbuySvc" scope="page" class="com.groupbuy.model.GroupbuyService" />
<jsp:useBean id="productSvc" scope="page" class="com.product.model.ProService" />
<jsp:useBean id="rebateSvc" scope="page" class="com.rebate.model.RebateService" />

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/back-end/css/bootstrap.min.css">
    <!-- Include Favicon ico-->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/back-end/img/ICON.ico">
    <!-- Font-awesome CSS -->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.13.0/css/all.css">
    <!--GoogleFont-->
    <link href="https://fonts.googleapis.com/css2?family=Sedgwick+Ave+Display&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lakki+Reddy&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap" rel="stylesheet">
    <!-- Include style.css-->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/back-end/css/style.css">
    
     <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
        integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
        integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
        crossorigin="anonymous"></script>   
  
	<!-- groupbuy.css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/groupbuy.css">    


    <title>團購詳情</title>
    
</head>

<body>
<!-- header -->
	
	<%@ include file="/back-end/css/header.jsp" %>
<!-- header -->

    <div class="content d-md-flex">

<!-- aside -->
	<%@ include file="/back-end/css/aside.jsp" %>
<!-- aside -->

        <main>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs }">
<%
	java.util.List<String> errorMsgs = (java.util.List<String>) request.getAttribute("errorMsgs");
	String message = "";
	for (String msg : errorMsgs) {
		message += msg;
		message += "\\n";
	}
%>
<script>
	Swal.fire({
		icon: 'error',
		title: '<%=message%>'
	});
</script>
</c:if>
<%-- 錯誤表列 --%>

<nav aria-label="breadcrumb">
	<ol class="breadcrumb bg-transparent">
		<li class="breadcrumb-item"><a class="bread" href="<%=request.getContextPath()%>/back-end/index.jsp">後台首頁</a></li>
		<li class="breadcrumb-item"><a class="bread" href="<%=request.getContextPath()%>/back-end/protected/groupbuy/select_page.jsp">團購查詢</a></li>
		<li class="breadcrumb-item"><a class="bread" href="<%=request.getContextPath()%>/back-end/protected/groupbuy/listAllGroupbuy.jsp">團購列表</a></li>
		<li class="breadcrumb-item active text-warning" aria-current="page">團購詳情</li>
	</ol>
</nav>



			<div class="container">
				<div class="row justify-content-center">
					<div class="col-11">
						<div class="card mt-5">
							<div class="card-body bg-secondary">
								<c:forEach var="productVO" items="${productSvc.all}">
									<c:if test="${groupbuyVO.p_id eq productVO.p_id}">
										<div class="media">
											<img src="<%=request.getContextPath()%>/product/proPic.do?p_id=${groupbuyVO.p_id}" class="align-self-center mr-3 product_image rounded" alt="">
											<div class="media-body w-10">
												<h3 class="mt-0 mb-3 alert alert-primary">${productVO.p_name}</h3>
												<pre class="alert alert-primary">${productVO.p_info}</pre>
												<div class="row justify-content-around alert alert alert-primary ml-0 mr-0">
													<div class="col-3 text-center">
														<button type="button" class="btn btn-danger btn-sm" data-container="body" data-toggle="popover" data-placement="top" data-content="目前團購案人數 ： ${groupbuyVO.people} 人">
															參與人數
														</button>
													</div>
													<div class="col-6 text-center">
														<button type="button" class="btn btn-warning btn-sm" id="reveal" data-container="body" data-toggle="popover" data-placement="top" data-content="剩餘時間">
															0 天 00 小時 00 分鐘 00 秒
														</button>
													</div>	
<!-- 													<div class="col-3 text-center"> -->
<!-- 														<button type="button" class="btn btn-success btn-sm"> -->
<!-- 															立即參加 -->
<!-- 														</button> -->
<!-- 													</div> -->
												</div>	
											</div>
										</div>
										<div class="row justify-content-center">
											<div class="col-11 alert alert-primary text-center">
												<button id="currentPrice" type="button" class="btn mb-2 btn-outline-dark btn-lg" data-container="body" data-toggle="popover" data-placement="top" data-content="原價 $<fmt:formatNumber pattern="#" value="${productVO.p_price}" />">
														
												</button>
												<div class="progress border border-dark mb-1" style="height: 30px">
													<div class="progress-bar bg-danger" id="1stlevel" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"> <h6>${groupbuyVO.people} / ${rebateSvc.getOneRebate(groupbuyVO.reb1_no).people} 人</h6></div>
													<div class="progress-bar progress-bar-striped text-white" role="progressbar" style="width: 10%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">
														<h6>
															$ <fmt:formatNumber pattern="#" value="${productVO.p_price * rebateSvc.getOneRebate(groupbuyVO.reb1_no).discount}" />
														</h6>
													</div>
												</div>
												<div class="progress border border-dark mb-1" style="height: 40px">
													<div class="progress-bar bg-warning" id="2ndlevel" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"> <h5>${groupbuyVO.people} / ${rebateSvc.getOneRebate(groupbuyVO.reb2_no).people} 人</h5></div>
													<div class="progress-bar progress-bar-striped text-white" role="progressbar" style="width: 10%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">
														<h5>
															$ <fmt:formatNumber pattern="#" value="${productVO.p_price * rebateSvc.getOneRebate(groupbuyVO.reb2_no).discount}" />
														</h5>
													</div>
												</div>
												<div class="progress border border-dark mb-2" style="height: 50px">
													<div class="progress-bar bg-success" id="3rdlevel" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"> <h4>${groupbuyVO.people} / ${rebateSvc.getOneRebate(groupbuyVO.reb3_no).people} 人</h4></div>
													<div class="progress-bar progress-bar-striped text-white" role="progressbar" style="width: 10%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">
														<h4>
															$ <fmt:formatNumber pattern="#" value="${productVO.p_price * rebateSvc.getOneRebate(groupbuyVO.reb3_no).discount}" />
														</h4>
													</div>
												</div>	
												
												<button id="amount" type="button" class="btn mb-2 btn-outline-danger btn-lg" data-container="body" data-toggle="popover" data-placement="bottom" data-content="總數：<fmt:formatNumber pattern="#" value="${groupbuyVO.amount}" /> 份">
													
												</button>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
            
        </main>
    </div>

<script>
	<%
		Long end_date = groupbuyVO.getEnd_date().getTime();
	%>
	function init(){
		
		var timer = setInterval(function(){
			var end_date = <%=end_date%>;
			var now = new Date().getTime();
			var remain = Math.ceil((end_date - now) / 1000);
			var day = Math.floor(remain / 86400);
			var hour = Math.floor(remain % 86400 / 3600);
			var minute = Math.floor((remain % 86400 % 3600) / 60);
			var second = (((remain % 86400) % 3600) % 60);
			
			if (remain <= 0) {
				$('#reveal').text('團購已截止, 下次請早');
			} else {
				$('#reveal').text(day + ' 天 ' + hour + ' 小時 ' + minute + ' 分鐘 ' + second + ' 秒 ');
			}
			
		}, 1000);
		
		var level1 = ${rebateSvc.getOneRebate(groupbuyVO.reb1_no).people};
		var level2 = ${rebateSvc.getOneRebate(groupbuyVO.reb2_no).people};
		var level3 = ${rebateSvc.getOneRebate(groupbuyVO.reb3_no).people};
		var discount1 = ${rebateSvc.getOneRebate(groupbuyVO.reb1_no).discount};
		var discount2 = ${rebateSvc.getOneRebate(groupbuyVO.reb2_no).discount};
		var discount3 = ${rebateSvc.getOneRebate(groupbuyVO.reb3_no).discount};
		
		var currentGroup = ${groupbuyVO.people};
		var first = 	(currentGroup / level1 * 100) >= 100 ? 90 : (currentGroup / level1 * 100) - 10;
		var second = 	(currentGroup / level2 * 100) >= 100 ? 90 : (currentGroup / level2 * 100) - 10;
		var third = 	(currentGroup / level3 * 100) >= 100 ? 90 : (currentGroup / level3 * 100) - 10;
		
		var currentValue = ${productSvc.getOnePro(groupbuyVO.p_id).p_price};
		var showNow = '';
		if (currentGroup >= level1) {
			currentValue = (currentValue * discount1).toFixed(0);
			showNow = '目前達標金額： $ ';
		} else if (currentGroup >= level2) {
			currentValue = (currentValue * discount2).toFixed(0);
			showNow = '目前達標金額： $ ';
		} else if (currentGroup >= level3) {
			currentValue = (currentValue * discount13).toFixed(0);
			showNow = '目前達標金額： $ ';
		} else {
			currentValue = ${productSvc.getOnePro(groupbuyVO.p_id).p_price}.toFixed(0);
			showNow = '維持原價： $ ';
		}
		
		$('#1stlevel').attr('style', 'width:' + first + '%');
		$('#2ndlevel').attr('style', 'width:' + second + '%');
		$('#3rdlevel').attr('style', 'width:' + third + '%');	
		
		$('#currentPrice').text(showNow + currentValue);
		
		var currentAmount = ${groupbuyVO.amount - groupbuyVO.people};
		if (currentAmount > 0){
			$('#amount').text('團購案容許人數： ' + currentAmount);
		} else {
			$('#amount').text('團購商品已售罄');
		}
		
	}
	
	window.onload = init;
	
	$(function () {
		$('[data-toggle="popover"]').popover()
	})
</script>


</body>

</html>