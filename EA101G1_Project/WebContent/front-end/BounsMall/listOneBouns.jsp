<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="com.BounsMall.model.*" %>
<%@ page import="com.member.model.*" %>

<%
	BMService bmSvc = new BMService();
	List<BMVO> list = bmSvc.getAll();
	pageContext.setAttribute("list",list);
	BMVO bmVO = (BMVO) request.getAttribute("bmVO");
	MemberService memSvc = new MemberService(); 
	MemberVO memVO = (MemberVO) request.getAttribute("memVO");
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>紅利商品詳情</title>
    <!-- TODO: 換title 的icon -->
    <link rel="icon shortcut" href="<%=request.getContextPath()%>/front-end/img/ICON.ico">
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">

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
        
    <!-- SweetAlert2 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<!-- CKEditor -->
	<script src="<%=request.getContextPath()%>/files/ckeditor/ckeditor.js"></script>
	
	<style>
		h5.mt-0 {
			color: green;
		}
		img.bon_image {
			width: 300px;
			height: 300px;
		}
		div.card
		
	</style>
		
</head>
<body>
    <!-- navbar -->
		<%@ include file="../../files/header.jsp" %>
    <!-- navbar end -->
    <section class="blank0"></section>
    <!-- 內容 -->

<div class="contianer">
	<div class="row justify-content-center">
		<div class="col-8">
			<div class="card">
				<div class="card-body">
					<div class="media">
						<img src="<%=request.getContextPath()%>/BounsMall/ImageServlet.do?bon_id=${bmVO.bon_id}" class="mr-3 bon_image" alt="...">
						<div class="media-body">
							<h5 class="mt-0">${bmVO.bon_name}</h5>
							${bmVO.bon_info}
						</div>
					</div>
				</div>
				<div class="row justify-content-center">
					<div class="col-4">
<!-- 						<button type="button" class="btn btn-danger float-left">我要購買</button> -->
						<a href="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do?action=insert&mem_id=${memVO.mem_id}&bon_id=${bmVO.bon_id}"><button type="button" class="btn btn-danger float-left">我要購買</button></a>
						<button type="button" class="btn btn-secondary float-right">加入最愛</button>
					</div>
				</div>
			</div>
		</div>
		<div class="col-8">
			<div class="row">
				<c:forEach var="bmVO" items="${list}" varStatus="s">
					<c:if test="${s.count <= 4}">
						<div class="col-3">
							<div class="card mt-5">
								<figure class="figure">
									<a href="<%=request.getContextPath()%>/BounsMall/BounsMall.do?action=getOne_For_Display&BON_ID=${bmVO.bon_id}">
										<img src="<%=request.getContextPath()%>/BounsMall/ImageServlet.do?bon_id=${bmVO.bon_id}" class="figure-img img-fluid rounded" alt="...">
										<figcaption class="figure-caption text-center">${bmVO.bon_name} －  <i class="fas fa-clock"></i>${bmVO.bon_price}</figcaption>
									</a>
								</figure>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
	<!-- 內容 -->
        <!-- footer -->
			<%@ include file="../../files/footer.jsp" %>
        <!-- footer -->
</body>



</html>