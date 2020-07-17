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


    <!-- 限時優惠 -->
  <section class="discount">
    <div class="col-md-12 text-center" style="border-radius:5px; list-style-type:none;">
<!-- 			    <li class="breadcrumb-item active pt-3" aria-current="page" style="font-size:50px;font-weight:bolder;color:white;"> -->
<!-- 			    -- 熱賣商品 --</li> -->
			    
    <section class="discount container" style="">
        <div class="row">
<!--             <div class="col-md-5"> -->
<!--                 <div class="discount1 my-4"> -->
<!--                     <div class="discount1-1"> -->
<!--                         <h6 class="ml-2">商城</h6> -->
<!--                     </div> -->
<!--                     <div class="discount1-2" style="background:none; height:550px;margin:0;"> -->
<%--                         <a href="<%=request.getContextPath()%>/front-end/product/listAllProduct.jsp"> --%>
<!--                         	<img src="img/1.jpg" style="height:550px;"> -->
<!--                         </a> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->


            <div class="col-md-12">
                <div class="discount2 my-4" style="height:380px;">
<!--                     <div class="discount2-1"> -->
<!--                         <h6>團購 ING</h6> -->
<!--                     </div> -->
                    <div class="discount2-2">
                        <a href="<%=request.getContextPath()%>/front-end/product/listAllProduct.jsp">
                     	   <img src="<%=request.getContextPath()%>/front-end/css/0717_03.JPG" style="background-size: cover;">
                        </a>
                    </div>
                </div>

                 <div class="discount2 my-4" style="height:345px;">
<!--                     <div class="discount2-1"> -->
<!--                         <h6>競標 ING</h6> -->
<!--                     </div> -->
                    <div class="discount2-2">
                        <a href="<%=request.getContextPath()%>/front-end/product/listAllProduct.jsp">
                        	<img src="<%=request.getContextPath()%>/front-end/css/0717_02.JPG" >
                        </a>
                    </div>
                </div>

                <div class="discount2 my-4" style="height:345px;">
<!--                     <div class="discount2-1"> -->
<!--                         <h6>直購專區</h6> -->
<!--                     </div> -->
                    <div class="discount2-2" style="">
                        <a href="<%=request.getContextPath()%>/front-end/product/listAllProduct.jsp" class="" style="">
                      	    <img src="<%=request.getContextPath()%>/front-end/css/0717_01.JPG"  style="">
                        </a>
                    </div>
                </div>
            </div>
        </div>

		</section>
        </div> <!-- 熱賣商品 --end -->
    </section>


        <!-- reviewsSection -->
        <!-- reviewsSection end -->

<!-- 內容 ---end  -->

	<div>
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