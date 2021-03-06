<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.auct.model.*"%>
<%@ page import="com.member.model.*"%>


<%
	AuctService auctSvc = new AuctService();
	List<AuctVO> list = auctSvc.getAllFront();
	pageContext.setAttribute("list", list);
%>

<%
	java.util.GregorianCalendar time = new java.util.GregorianCalendar();
	long now_ms = time.getTimeInMillis();
	pageContext.setAttribute("now_ms", now_ms);
%>
<jsp:useBean id="PtSvc" scope="page" class="com.productType.model.PtService" />
<jsp:useBean id="MemberSvc" scope="page" class="com.member.model.MemberService" />

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BID競標專區</title>

<%@ include file="/files/HeaderCssLink"%>

<!-- 使用style.css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/Auct_index.css">

<style>
body {
	background-color: white;
	background: url(<%=request.getContextPath()%>/front-end/protected/auct/images/rkXP0RBoX3.jpg);
	background-size: cover;
}
</style>


</head>

<body>
	<!-- navbar -->
	<%@ include file="/files/header.jsp"%>
	<!-- navbar end -->

	<section class="blank0"></section>

	<!-- 內容 -->
	<section class="nav-auct container">
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
			<a class="a-index" href="All_index.jsp">首頁</a>
			> 競標區
		</h6>

	</section>

	<!--         <header class="container"> -->
	<!--             圖片 -->
	<!--             <div> -->
	<!--                 <a href="   "><img src="./images/ps5-0001.jpg" alt=""></a> -->
	<!--             </div> -->
	<!--             圖片 end -->
	<!--         </header> -->

	<section class="auct-all container mt-3">
		<div class="">
			<div class="auct-title py-2">
				<span class="span1">
					&nbsp&nbsp&nbsp&nbsp
					<i class="far fa-clock"></i>
				</span>
				<span class="span2"> &nbsp限時拍賣</span>
			</div>
			<div class="auct-list bg-white row">

				<%@ include file="page3.file"%>
				<!-- JSTL for-each -->
				<c:forEach var="auctVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>" varStatus="s">

					<%-- 錯誤表列 --%>
					<c:if test="${not empty errorMsgs}">
						<font style="color: red">拍賣未開始:</font>
						<ul>
							<c:forEach var="message" items="${errorMsgs}">
								<li style="color: red">${message}</li>
							</c:forEach>
						</ul>
					</c:if>

					<div class="product col-md-4 mb-5">
						<div class="product-rel">
							<div class="auct-title  py-3">
								<h6 class="text-center">${auctVO.auct_name}</h6>
							</div>
							<div class="auct-list">
								<div>
									<ul>
										<li>市價 : ${auctVO.marketPrice}元</li>
										<li>
											<img src="<%=request.getContextPath()%>/front-end/auct/pic.do?auct_id=${auctVO.auct_id}" height="200px">
										</li>

										<jsp:useBean id="auctVO" scope="page" class="com.auct.model.AuctVO" />

										<li id="bid_state${s.count}" style="color: red; font-weight: bolder;">
											<%
												Timestamp startTime = auctVO.getAuct_start();
													long a = startTime.getTime();
													pageContext.setAttribute("a", a);
													Timestamp endTime = auctVO.getAuct_end();
													long b = endTime.getTime();
													pageContext.setAttribute("b", b);
													if (now_ms < a) {
														out.println("拍賣未開始");
													} else if (now_ms >= a && now_ms <= b) {
														out.println("拍賣進行中");
													} else {
														out.println("拍賣已結束");
													}
											%>
										</li>

										<li>拍賣開始時間:</li>
										<li class="${auctVO.auct_id} bid_start" id="bid_start" data-id="1" value="${auctVO.auct_start}">
											<fmt:formatDate value="${auctVO.auct_start}" pattern="yyyy-MM-dd HH:mm:ss" />
										</li>
										<li>拍賣結束時間:</li>
										<li class="${auctVO.auct_id} bid_end" id="bid_end" value="${auctVO.auct_end}">
											<fmt:formatDate value="${auctVO.auct_end}" pattern="yyyy-MM-dd HH:mm:ss" />
										</li>



										<li>
											<form METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/auct/auct.do">
												<input type="hidden" name="auct_id" value="${auctVO.auct_id}">
												<input type="hidden" name="auct_start" value="${auctVO.auct_start}">
												<input type="hidden" name="action" value="bid_info">
												<button type="submit" class="bid-btn" onclick="checkStatus${s.count}();">我要競標</button>
											</form>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>

				</c:forEach>
				<!-- JSTL for-each   end-->

				<%@ include file="page4.file"%>


			</div>
		</div>
	</section>


	<!-- 聊天室 -->
	<!--         <button id="chatBtn" class="bg-primary"> -->
	<!--             <i class="fas fa-comments"></i> -->
	<!--         </button> -->
	<%@ include file="/files/footer.jsp"%>
	

</body>
</html>