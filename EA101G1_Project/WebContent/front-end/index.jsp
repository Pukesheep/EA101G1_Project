<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.product.model.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.auct.model.*"%>
<%@ page import="com.shopCart.model.PRODUCT" %>


<%
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
%>
<%
    AuctService auctSvc = new AuctService();
    List<AuctVO> list = auctSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>S.F.G首頁</title>
<%@ include file="../../files/HeaderCssLink" %>

    <!-- 使用style.css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/style.css">

</head>

<body>
	<!-- navbar -->
    	<%@ include file="../../files/header.jsp" %>
    <!-- navbar end -->
    
<!--     <section class="blank0"></section> -->
<!-- 內容 -->
 <br><br>
		
		<!-- 圖片輪播 -->
    <!-- b4-元件-default -->
    <!-- b4-carousel-default -->
    <!-- id和href都要對到,否則沒有作用 -->
    <div id="imageCarousel" class="carousel slide" data-ride="carousel">
        <!-- 頁碼提示器 -->
        <ol class="carousel-indicators">
            <li data-target="#imageCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#imageCarousel" data-slide-to="1"></li>
            <li data-target="#imageCarousel" data-slide-to="2"></li>
        </ol>
        <!-- 頁面容器 -->
        <div class="carousel-inner" role="listbox">
            <!-- page 1 -->
            <div class="carousel-item active">
<!--                 <img src="images/6001.jpg" class="w-100"> -->
                <img src="<%=request.getContextPath() %>/front-end/product/images/front1.jpg" class="d-block w-100" alt="...">
            </div>

            <!-- page 2 -->
            <div class="carousel-item">
<!--                 <img src="img/6001.jpg" class="w-100"> -->
                <img src="<%=request.getContextPath() %>/front-end/product/images/front2.jpg" class="d-block w-100" alt="...">
            </div> 
            <!-- page 3 -->
             <div class="carousel-item">
<!--                 <img src="img/6001.jpg" class="w-100"> -->
                <img src="<%=request.getContextPath() %>/front-end/product/images/front3.jpg" class="d-block w-100" alt="...">
            </div> 
           
        </div>
        <!-- 上一頁 -->
        <a class="carousel-control-prev" href="#imageCarousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <!-- 下一頁 -->
        <a class="carousel-control-next" href="#imageCarousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <!-- 圖片輪播 end -->


    <!-- header -->
    <!-- 為Jumbotron加入背景圖被設定文字為白色 -->
    <section class="blank-2"></section>
    <header id="header" class="jumbotron bg-dark text-white text-center">

        <div class="container">
            <h1>Join us !! Have FUN !!</h1>
            <p>We find the Like-minded friends &amp; play games together.</p>
        </div>

    </header>
    <!-- header end -->



    <!-- -->
  <section class="discount">
    <div class="col-md-12 text-center" style="border-radius:5px; list-style-type:none;">
			    <li class="breadcrumb-item active pt-3" aria-current="page" style="font-size:35px;font-weight:bolder;color:white;">
			    -- 敬請期待 --</li>
    </div>
  </section>
	  
	  
	  
      <section class="discount container">
        <div class="row">

            <div class="col-md-12">
                <div class="discount2 my-5">
                    
                    <div class="" style=" max-width: 100%;
									    height: auto;
									    border-radius: 10px;
									    overflow: hidden;
									    box-shadow:0 10px 18px #00334e;">
                        <a href="<%=request.getContextPath()%>/front-end/product/listAllProduct.jsp">
                        	<img src="<%=request.getContextPath()%>/front-end/css/0717_02.JPG">
                        </a>
                    </div>
                </div>

            </div>
        </div>
    </section>
	
	<!-- 熱賣商品 -->
	<section class="">
    <div class="section-3 py-5">
        <div class="container text-center">
            <hr>
            <h1 class="heading-1">熱門商品</h1><br>
            <hr>
            <div class="row justify-content-center text-center mb-5">
                <div class="col-md-4 mb-5">
                    <div class="card">
                        <img src="<%=request.getContextPath()%>/front-end/css/product1.jpg"  class="card-img-top">
                        <div class="card-body">
                            <h4 class="card-title">Nintendo Switch</h4>
                            <pre class="card-text text-left ml-5">
▉ 可遊玩時間加長!!!

▉ 遊戲生活變得更加互動

▉ 可連線8台主機，進行對戰或協力遊戲

▉ 台灣公司貨，提供1年保固"
                            </pre>
                            <a href="<%=request.getContextPath()%>/front-end/product/listAllProduct.jsp">
                        	    <input type="button" value="逛商城" class="btn btn-primary">
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <div class="card">
                        <img src="<%=request.getContextPath()%>/front-end/css/product7.jpg" class="card-img-top">
                        <div class="card-body">
                            <h4 class="card-title">Xbox One S</h4>
                            <pre class="card-text text-left ml-5">
▉ 全面數位化，個人遊戲庫

▉ 超值的價錢 豐富的遊戲和娛樂
			
▉ 效能依然強悍，支援4K與HDR
			
▉ 內含3款遊戲
                            </pre>
                            <a href="<%=request.getContextPath()%>/front-end/groupbuy/listAllGroupbuy.jsp">
                        	    <input type="button" value="去團購" class="btn btn-primary">
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <div class="card">
                        <img src="<%=request.getContextPath()%>/front-end/css/immed000003.jpg" class="card-img-top">
                        <div class="card-body">
                            <h4 class="card-title">PS4 PRO主機 1TB</h4>
                            <pre class="card-text text-left ml-4">
Days of Play

原價12980元，活動時間內特價10880元

售完為止

此商品為雙手把組，第二支手把皆黑手把
                            </pre>
                            <input type="button" value="去直購" class="btn btn-primary">
                        </div>
                    </div>
                </div>

            </div>
        </div>
        </section>
        <!-- 熱賣商品 --end -->
	


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
								<li><a class="footer-link" href="<%=request.getContextPath()%>/front-end/product/listAllProduct.jsp">商城</a></li>
								<li><a class="footer-link" href="<%=request.getContextPath()%>/front-end/groupbuy/listAllGroupbuy.jsp">團購</a></li>
							</ul>
					</div>
					<div class="col-md-3 col-sm-6 footer-list">
						<h5 class="text-uppercase">會員互動</h5>
						<ul>
							<li><a class="footer-link" href="<%=request.getContextPath()%>/front-end/protected/auct/Auct_index.jsp">競標區</a></li>
							<li><a class="footer-link" href="<%=request.getContextPath()%>/front-end/immed/immed_index.jsp">直購區</a></li>
							<li><a class="footer-link"
								href="<%=request.getContextPath()%>/front-end/post/listAllPost.jsp">討論區</a>
							</li>
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

		<button id="chatBtn" class="bg-primary" onclick="on()">
			<i class="fas fa-comments"></i>
		</button>
		
		</div>
</body>

</html>