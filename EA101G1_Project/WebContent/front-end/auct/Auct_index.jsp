<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.auct.model.*"%>
<%@ page import="com.member.model.*"%>


<%    
    AuctService auctSvc = new AuctService();
    List<AuctVO> list = auctSvc.getAllFront();
    pageContext.setAttribute("list",list);
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
    <!-- TODO: 換title 的icon -->
    <link rel="icon shortcut" href="images/ICON(yellow).ico">
    <!-- Bootstrap官方網站 https://getbootstrap.com/ -->
    <!-- 連結Bootstrap.min.css -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- 使用font awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
        integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
    <!-- 使用google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Sedgwick+Ave+Display&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lakki+Reddy&display=swap" rel="stylesheet">

    <!-- 使用style.css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/style.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/Auct_index.css">

    <!-- 連結Bootstrap所需要的js -->
    <!-- jquery.min.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- popper.min.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <!-- bootstrap.min.js -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
        

</head>

<body>
    <!-- navbar -->
    <nav class="navbar navbar-expand-md navbar-dark fixed-top">
        <a class="navbar-brand" href="All_index.jsp">
            <span class="logo"><i class="fas fa-bomb"></i></span>
            <span class="logo2">S.F.G</span>
            <span class="logo3">{{{</span>
            </a>
            <!-- 手機選單按鈕 -->
            <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#collapsibleNavId"
                aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!-- 內容 -->
            <div class="navbar2 navbar-dark">
                <div class="row">
                    <div class="item col-md-2"><a href="#">商城 </a></div>
                    <div class="item col-md-2"><a href="#">團購 </a></div> 
                    <div class="item col-md-2"><a href="/auct/Auct_index.html">競標區 </a></div> 
                    <div class="item col-md-2"><a href="#">直購區 </a></div> 
                    <div class="item col-md-2"><a href="#">討論區 </a></div> 
                    <div class="item col-md-2"><a href="#">紅利 </a></div> 
                </div>
            </div>
    
            <div class="collapse navbar-collapse" id="collapsibleNavId">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="<%=request.getContextPath()%>/member/login.do?action=logout">登出</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">註冊</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">會員中心</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">我的最愛</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">購物車</a>
                    </li>
    
                </ul>
            </div>
        </nav>
        <!-- navbar end -->
        <section class="blank0"></section>

        <section class="nav-auct container">
            <ul class="text-right">
                <li class="auct-navbtn">
                    <a href="Auct_index.jsp">競標專區</a>
                </li>
                <li class="auct-navbtn">
                    <a href="Results_all.jsp">結標專區</a>
                </li>
                <li class="auct-navbtn">
                    <a href="">出價記錄</a>
                </li>
                <li class="auct-navbtn">
                    <a href="">戰利品</a>
                </li>
                <li class="auct-navbtn">
                    <a href="listAllAuct.jsp">我的拍賣區</a>
                </li>
            </ul>
            <h6 class="h6"> <a class="a-index" href="All_index.jsp">首頁</a> > 競標區</h6>

        </section>

        <header class="container">
            <!-- 圖片 -->
            <div>
                <a href="   "><img src="images/ps5-0001.jpg" alt=""></a>
            </div>
            <!-- 圖片 end -->
        </header>

        <section class="auct-all container">
            <div class="">
                <div class="auct-title py-2">
                    <span class="span1">&nbsp&nbsp&nbsp&nbsp<i class="far fa-clock"></i></span>
                    <span class="span2"> &nbsp限時拍賣</span>
                </div>
                <div class="auct-list bg-white row">
 
<%@ include file="page3.file" %>                
<!-- JSTL for-each -->
<c:forEach var="auctVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
    <%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color:red">拍賣未開始:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
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
                                        
                                        <li id="bid_state" style="color:red;font-weight:bolder;">
											<%
												Timestamp startTime = auctVO.getAuct_start();
													long a = startTime.getTime();
													Timestamp endTime = auctVO.getAuct_end();
													long b = endTime.getTime();
													if (now_ms < a) {
														out.println("拍賣未開始");
													} else if (now_ms >= a && now_ms <=b) {
														out.println("拍賣進行中");
													} else {
														out.println("拍賣已結束");
													}
											%>
										</li>
                                        
                                        <li>拍賣開始時間:</li>
										<li class="${auctVO.auct_id} bid_start" id="bid_start1" onclick="bidstate()" value="${auctVO.auct_start}">
											<fmt:formatDate value="${auctVO.auct_start}" pattern="yyyy-MM-dd HH:mm:ss" />
										</li>
										<li>拍賣結束時間:</li>
										<li class="${auctVO.auct_id} bid_end" id="bid_end1" onclick="bidstate()" value="${auctVO.auct_end}">
											<fmt:formatDate value="${auctVO.auct_end}" pattern="yyyy-MM-dd HH:mm:ss" />
										</li>
                                        
                                        <li>NTD  元</li>
                                        <li>目前:誰</li>
                                        
                                        <li>
												<form METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/auct/auct.do">
													<input type="hidden" name="auct_id" value="${auctVO.auct_id}">
													<input type="hidden" name="auct_start" value="${auctVO.auct_start}">
													<input type="hidden" name="action" value="bid_info">
													<button type="submit" class="bid-btn">我要競標</button>
												</form>
										</li>
										
                                    </ul>
                                </div>                  
                            </div>
                        </div>
                    </div>            
                 
</c:forEach>
<!-- JSTL for-each   end-->

<%@ include file="page4.file" %>

<script type="text/javascript">
// 	function bidstate(){
		
// 		var now = new Date(); //現在時間
// /* 		var now_ms = now.getTime(); //轉成long */
		
// 		var	timer = setInterval(function(){
// 			$('li.bid_start').each(function(){
// 				if(now<this){
// 					var bid_state = "拍賣未開始";
// 				(bid_state).innerText = document.getElementById('bid_state');
// 				}
// 			}); 
// 		}, 3000);//每3秒 ,執行1次
	
// 			if (tick > think.length - 1) {
// 				tick = 0;
// 			}		
// 	}
	
// 	$('.bid-btn').click(function(){
// 		if (${sessionScope.memberVO != null}){
// 			console.log('123');
// 		} else {
<%-- 			<% --%>
// 				session.setAttribute("location", request.getRequestURI());
<%-- 			%> --%>
<%-- 			document.location.href = '<%=request.getContextPath()%>/front-end/member/login.jsp'; --%>
// 		}
// 	})
</script>


                </div>
            </div>
        </section>


        <!-- 聊天室 -->
        <button id="chatBtn" class="bg-primary">
            <i class="fas fa-comments"></i>
        </button>


</body>
</html>