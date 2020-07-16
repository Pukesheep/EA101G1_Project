<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>

<%
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
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
                <img src="images/6001.jpg" class="w-100">
            </div>

            <!-- page 2 -->
            <div class="carousel-item">
                <img src="img/6001.jpg" class="w-100">
            </div> 
            <!-- page 3 -->
             <div class="carousel-item">
                <img src="img/6001.jpg" class="w-100">
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
    <section class="discount container">
        <div class="row">
            <div class="col-md-5">
                <div class="discount1 my-4">
                    <div class="discount1-1">
                        <h6>限時優惠</h6>
                    </div>
                    <div class="discount1-2">
                        <a href="#"><img src="img/1.jpg" alt="商城限時優惠"></a>
                    </div>

                    <div class="discount1-2">
                        <a href="#"><img src="img/1.jpg" alt="商城限時優惠"></a>
                    </div>

                    <div class="discount1-2">
                        <a href="#"><img src="img/1.jpg" alt="商城限時優惠"></a>
                    </div>

                </div>
            </div>


            <div class="col-md-7">
                <div class="discount2 my-4">
                    <div class="discount2-1">
                        <h6>團購ING</h6>
                    </div>
                    <div class="discount2-2">
                        <a href="#"><img src="img/1.jpg" alt="商城限時優惠"></a>
                    </div>
                </div>

                <div class="discount2 my-4">
                    <div class="discount2-1">
                        <h6>競標ING</h6>
                    </div>
                    <div class="discount2-2">
                        <a href="#"><img src="img/1.jpg" alt="商城限時優惠"></a>
                    </div>
                </div>

                <div class="discount2 my-4">
                    <div class="discount2-1">
                        <h6>直購專區</h6>
                    </div>
                    <div class="discount2-2">
                        <a href="#"><img src="img/1.jpg" alt="商城限時優惠"></a>
                    </div>
                </div>
            </div>
        </div>
    </section>


        <!-- reviewsSection -->
        <section id="reviewsSection" class="py-5">
            <!-- 使用輪播(Carousel)元件放入以下兩頁內容 -->
            <!-- 輪播 -->
            <div id="carouselId" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselId" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselId" data-slide-to="1"></li>
                </ol>
                <div class="carousel-inner" role="listbox">
                    <div class="carousel-item active">
                        <!-- 第一頁 內容 -->
                        <div class="row justify-content-center py-5">
                            <div class="col-sm-2">
                                <!-- 設定使用者照片變圓型 -->
                                <img class="w-100 rounded-circle" src="./img/galleryImage1.jpg" alt="user photo">
                            </div>
                            <div class="col-sm-6">
                                <h3 class="title">Food and beverage manager</h3>
                                <h4 class="name">Robert A. Welch</h4>
                                <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quo provident quisquam a
                                    deleniti laborum
                                    omnis dicta aliquam repellat deserunt accusantium. Esse velit atque deleniti. Earum
                                    maxime
                                    necessitatibus veritatis vitae libero eveniet, accusantium culpa voluptas ipsam nisi
                                    non
                                    id neque
                                    atque minus qui, natus ducimus dolores est, dolor beatae? Quis esse eius facilis
                                    minima
                                    aut cum vero
                                    ex dolore obcaecati sint?</p>
                            </div>
                        </div>
                        <!-- 第一頁 內容 結束 -->
                    </div>
                    <div class="carousel-item">
                        <!-- 第二頁 -->
                        <div class="row justify-content-center py-5">
                            <div class="col-sm-2">
                                <!-- 設定使用者照片變圓型 -->
                                <img class="w-100 rounded-circle" src="./img/galleryImage1.jpg" alt="user photo">
                            </div>
                            <div class="col-sm-6">
                                <h3 class="title">Environmental scientist</h3>
                                <h4 class="name">Lorraine J. Rollins</h4>
                                <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quo provident quisquam a
                                    deleniti laborum
                                    omnis dicta aliquam repellat deserunt accusantium. Esse velit atque deleniti. Earum
                                    maxime
                                    necessitatibus veritatis vitae libero eveniet, accusantium culpa voluptas ipsam nisi
                                    non
                                    id neque
                                    atque minus qui, natus ducimus dolores est, dolor beatae? Quis esse eius facilis
                                    minima
                                    aut cum vero
                                    ex dolore obcaecati sint?</p>
                            </div>
                        </div>
                        <!-- 第二頁 結束 -->
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselId" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselId" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <!-- 輪播 end -->
        </section>
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
							<li><a class="footer-link" href="<%=request.getContextPath()%>/front-end/member/Auct_index.jsp">競標區</a></li>
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

		<button id="chatBtn" class="bg-primary" onclick="on()">
			<i class="fas fa-comments"></i>
		</button>
		
		</div>
</body>

</html>