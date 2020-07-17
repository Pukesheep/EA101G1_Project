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
<title>S.F.G����</title>
<%@ include file="../../files/HeaderCssLink" %>

    <!-- �ϥ�style.css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/style.css">

</head>

<body>
	<!-- navbar -->
    	<%@ include file="../../files/header.jsp" %>
    <!-- navbar end -->
    
<!--     <section class="blank0"></section> -->
<!-- ���e -->
 <br><br>
		
		<!-- �Ϥ����� -->
    <!-- b4-����-default -->
    <!-- b4-carousel-default -->
    <!-- id�Mhref���n���,�_�h�S���@�� -->
    <div id="imageCarousel" class="carousel slide" data-ride="carousel">
        <!-- ���X���ܾ� -->
        <ol class="carousel-indicators">
            <li data-target="#imageCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#imageCarousel" data-slide-to="1"></li>
            <li data-target="#imageCarousel" data-slide-to="2"></li>
        </ol>
        <!-- �����e�� -->
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
        <!-- �W�@�� -->
        <a class="carousel-control-prev" href="#imageCarousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <!-- �U�@�� -->
        <a class="carousel-control-next" href="#imageCarousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <!-- �Ϥ����� end -->


    <!-- header -->
    <!-- ��Jumbotron�[�J�I���ϳQ�]�w��r���զ� -->
    <section class="blank-2"></section>
    <header id="header" class="jumbotron bg-dark text-white text-center">

        <div class="container">
            <h1>Join us !! Have FUN !!</h1>
            <p>We find the Like-minded friends &amp; play games together.</p>
        </div>

    </header>
    <!-- header end -->


    <!-- �����u�f -->
  <section class="discount">
    <div class="col-md-12 text-center" style="border-radius:5px; list-style-type:none;">
<!-- 			    <li class="breadcrumb-item active pt-3" aria-current="page" style="font-size:50px;font-weight:bolder;color:white;"> -->
<!-- 			    -- ����ӫ~ --</li> -->
			    
    <section class="discount container" style="">
        <div class="row">
<!--             <div class="col-md-5"> -->
<!--                 <div class="discount1 my-4"> -->
<!--                     <div class="discount1-1"> -->
<!--                         <h6 class="ml-2">�ӫ�</h6> -->
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
<!--                         <h6>���� ING</h6> -->
<!--                     </div> -->
                    <div class="discount2-2">
                        <a href="<%=request.getContextPath()%>/front-end/product/listAllProduct.jsp">
                     	   <img src="<%=request.getContextPath()%>/front-end/css/0717_03.JPG" style="background-size: cover;">
                        </a>
                    </div>
                </div>

                 <div class="discount2 my-4" style="height:345px;">
<!--                     <div class="discount2-1"> -->
<!--                         <h6>�v�� ING</h6> -->
<!--                     </div> -->
                    <div class="discount2-2">
                        <a href="<%=request.getContextPath()%>/front-end/product/listAllProduct.jsp">
                        	<img src="<%=request.getContextPath()%>/front-end/css/0717_02.JPG" >
                        </a>
                    </div>
                </div>

                <div class="discount2 my-4" style="height:345px;">
<!--                     <div class="discount2-1"> -->
<!--                         <h6>���ʱM��</h6> -->
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
        </div> <!-- ����ӫ~ --end -->
    </section>


        <!-- reviewsSection -->
        <!-- reviewsSection end -->

<!-- ���e ---end  -->

	<div>
		<!-- footer -->
		<footer id="footer" class="pt-5 ">
			<div class="container">
				<div class="row">
					<div class="col-md-3 col-sm-6 footer-list">
						<h5>
							�ֳt�s��
							</h4>
							<ul>
								<li><a class="footer-link"
									href="<%=request.getContextPath()%>/front-end/index.jsp">S.F.G����</a>
								</li>
								<li><a class="footer-link" href="<%=request.getContextPath()%>/front-end/product/listAllProduct.jsp">�ӫ�</a></li>
								<li><a class="footer-link" href="<%=request.getContextPath()%>/front-end/groupbuy/listAllGroupbuy.jsp">����</a></li>
							</ul>
					</div>
					<div class="col-md-3 col-sm-6 footer-list">
						<h5 class="text-uppercase">�|������</h5>
						<ul>
							<li><a class="footer-link" href="<%=request.getContextPath()%>/front-end/protected/auct/Auct_index.jsp">�v�а�</a></li>
							<li><a class="footer-link" href="<%=request.getContextPath()%>/front-end/immed/immed_index.jsp">���ʰ�</a></li>
							<li><a class="footer-link"
								href="<%=request.getContextPath()%>/front-end/post/listAllPost.jsp">�Q�װ�</a>
							</li>
						</ul>
					</div>
					<div class="col-md-3 col-sm-6 footer-list">
						<h5 class="text-uppercase">����ڭ�</h5>
						<ul>
							<li><a class="footer-link" href="">����S.F.G</a></li>
							<li><a class="footer-link" href="">�̷s����</a></li>
							<li><a class="footer-link" href="">���p�v�F��</a></li>
						</ul>
					</div>
					<div class="col-md-3 col-sm-6 footer-list">
						<h5 class="text-uppercase">�޳N�䴩</h5>
						<ul>
							<li><a class="footer-link" href="">�s��W��</a></li>
							<li><a class="footer-link" href="">���U&�䴩</a></li>
							<li><a class="footer-link" href="">�A�ȱ���</a></li>
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