<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.product.model.*" %>

<jsp:useBean id="ptSvc" scope="page" class="com.productType.model.PtService" />
<jsp:useBean id="productSvc" scope="page" class="com.product.model.ProService" />

<%
	ProVO proVO = (ProVO) request.getAttribute("proVO");
%>
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
        
     <!-- SweetAlert2 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>   
    
    <!-- datetimepicker -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/files/datetimepicker/jquery.datetimepicker.css" />
	<script src="<%=request.getContextPath()%>/files/datetimepicker/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/files/datetimepicker/jquery.datetimepicker.full.js"></script>
 
	<!-- groupbuy.css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/groupbuy.css">    
    
    

    <title>新增商品</title>
    <style>
    #preview img {
	width: 100%;
	height: 100%;
}
    </style>
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


<nav aria-label="breadcrumb">
	<ol class="breadcrumb bg-transparent">
		<li class="breadcrumb-item"><a class="bread" href="<%=request.getContextPath()%>/back-end/index.jsp">後台首頁</a></li>
		<li class="breadcrumb-item active text-warning" aria-current="page">新增商品</li>
	</ol>
</nav>
		
			
			<div class="container-fluid">
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/pro.do" enctype="multipart/form-data">
				<div class="row justify-content-center">
					<div class="col-10">
					<div class="row">
						<div class="col-6">
						<div class="card mt-5 h-100 mb-5">
							<div class="card-body bg-info">
								<div class="media">
									<div class="media-body">
										<h1 class="mt-0">新增商品</h1>
										<div class="media mt-3">
											<div class="media-body">
												<h3 class="mt-0">請輸入商品詳情</h3>
												
													<div class="form-group">
														<label for="exampleInputEmail1" class="text-white">商品名稱<front style="color:red">${errorMsgs.p_name}</front></label>
														<div class="input-group mb-3">
															<div class="input-group-prepend">
																<span class="input-group-text" id="basic-addon1"><i class="fas fa-calendar-plus"></i></span>
															</div>
															<input type="TEXT" class="form-control text-center" id="p_name" name="p_name" size="45" <c:if test="${not empty proVO.getP_name()}">value="<%=proVO.getP_name()%>"</c:if>
																	placeholder="請輸入商品名稱" />
														</div>
													</div>
													
													<div class="form-group">
														<label for="exampleInputEmail1" class="text-white">商品價格<font style="color:red">${errorMsgs.p_price}</font></label>
														<div class="input-group mb-3">
															<div class="input-group-prepend">
																<span class="input-group-text" id="basic-addon1"><i class="fas fa-calendar-plus"></i></span>
															</div>
															<input type="TEXT" class="form-control text-center" id="p_price" name="p_price" size="45" <c:if test="${not empty proVO.getP_price()}">value="<%=proVO.getP_price()%>"</c:if>
																	placeholder="請輸入商品價格" />
														</div>
													</div>
													
													<div class="form-group">
														<label for="exampleInputEmail1" class="text-white">商品庫存<font style="color:red">${errorMsgs.p_stock}</font></label>
														<div class="input-group mb-3">
															<div class="input-group-prepend">
																<span class="input-group-text" id="basic-addon1"><i class="fas fa-calendar-plus"></i></span>
															</div>
															<input type="TEXT" class="form-control text-center" id="p_stock" name="p_stock" size="45" <c:if test="${not empty proVO.getP_stock()}">value="<%=proVO.getP_stock()%>"</c:if>
																	placeholder="請輸入商品庫存量" />
														</div>
														
													</div>
													<div class="form-group">
														<label for="grotime" class="text-white">商品上下架</label>
														<div class="input-group mb-3">
															<div class="input-group-prepend">
																<span class="input-group-text " id="basic-addon1"><i class="fas fa-calendar-minus"></i></span>
															</div>
															<select size="1" name="p_stat">
																<option value=0>下架
																<option value=1 selected>上架
															</select>
														</div>
													</div>
													
													
													<div class="form-group">
														<label for="grotime" class="text-white">商品分類</label>
														<div class="input-group mb-3">
															<div class="input-group-prepend">
																<span class="input-group-text " id="basic-addon1"><i class="fas fa-calendar-minus"></i></span>
															</div>
															<select size="1" name="pt_id">
																<c:forEach var="ptVO" items="${ptSvc.all}">
																<option value="${ptVO.pt_id}"
																${(proVO.pt_id==ptVO.pt_id)? 'selected':'' }>${ptVO.typename}
																</c:forEach>
															</select>
														</div>
													</div>
													
													
													<div class="row justify-content-center">
														<div class="col-6 text-center">
															<div class="btn-group">
																<button class="btn btn-warning ">確認</button><div><input type="button" id="magical" class="btn btn-danger" value="神奇按鈕"></div>
																<div class="dropdown-menu">
																	<input type="hidden" name="from" value="back-end">
																	<input type="hidden" name="action" value="insert">
																</div>
															</div>
														</div>
													</div>
												
											</div>
										</div>
									</div>
								</div>								
							</div>
						</div>
						</div>
						
						<div class="col-6">
							<div class="card mt-5 w-100 h-100 mb-5">
								<div class="card-body bg-info">
									<h2 class="mt-0 text-center">商品圖片</h2>
									<input type="file" name="p_image" id="myFile" <c:if test="${not empty proVO.getP_image()}">value="<%=proVO.getP_image()%>"</c:if>
									accept="image/gif, image/jpeg, image/png" style="display:none"/>
									<label for="myFile" style="width:100%">
								<div id="preview" class="card product-display" style="height:400px; display:block" >
									<img id="addDisplay" src="<%=request.getContextPath()%>/images/camera.png" class="" alt="">				
								</div></label><front style="color:red">${errorMsgs.p_image}</front>
								<div class="card-body">
								<h2 class="card-title text-center">商品描述</h2>
								<pre><textarea id="p_info" name="p_info" rows="6" cols="75"><c:if test="${not empty proVO.getP_info()}"><%=proVO.getP_info()%></c:if></textarea></pre><front style="color:red">${errorMsgs.p_info}</front>
								</div>
								</div>
							</div>
							</div>
						</div>
					
					
					
					
					
					</div>
					
					
					
					
				</div>
			</div>
            </FORM>
        </main>
    </div>
    
    <script>
		function init() {

			var myFile = document.getElementById("myFile");
			var preview = document.getElementById('preview');

			myFile.addEventListener('change', function(e) {

				var files = myFile.files;

				if (files !== null && files.length > 0) {

					var file = files[0];

					console.log(file.type);
					if (file.type.indexOf('image') > -1) {

						var reader = new FileReader();

						reader.addEventListener('load', function(e) {

							var result = e.target.result;

							var img = document.createElement('img');

							img.src = result;
							preview.innerHTML = "";
							preview.append(img);
						});

						reader.readAsDataURL(file); // ***** 

					}
				}
			});
		}
		
		$('#magical').click(function(){
			$('#p_name').val('健身環大冒險 RingFit');
			$('#p_price').val('3150');
			$('#p_stock').val('200');
			$('#p_info').val(`主機平台：Switch

遊戲類型：運動

發售日期：2019-10-31

遊戲人數：1人

作品分級：保護級

製作廠商：Nintendo

發行廠商：Nintendo`);
		});
		
		window.onload = init;
	</script>
</body>

</html>