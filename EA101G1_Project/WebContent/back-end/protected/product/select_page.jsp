<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.groupbuy.model.*" %>
<%@ page import="com.product.model.*" %>

<jsp:useBean id="proSvc" scope="page" class="com.product.model.ProService" />
<jsp:useBean id="ptSvc" scope="page" class="com.productType.model.PtService" />

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
  
	<!-- groupbuy.css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/groupbuy.css">    
    
    
    

    <title>團購暨訂單查詢</title>
    

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
		<li class="breadcrumb-item active text-warning" aria-current="page">團購暨訂單查詢</li>
	</ol>
</nav>	
		
			
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-10">
						<div class="card">
							<div class="card-header bg-dark">
								<ul class="nav float-right mr-1 mt-1 text-dark">
									<li class="nav-item">
										<a class="nav-link active h5" href="<%=request.getContextPath()%>/back-end/protected/groupbuy/select_page.jsp">團購暨訂單查詢</a>
									</li>
									<li class="nav-item">
										<a class="nav-link active h5" href="<%=request.getContextPath()%>/back-end/protected/groupbuy/listAllGroupbuy.jsp">團購列表</a>
									</li>
									<li class="nav-item">
										<a class="nav-link active h5" href="<%=request.getContextPath()%>/back-end/protected/groupbuy/listAllGro_order.jsp">訂單管理</a>
									</li>
								</ul>
								<h1 class="text-white">團購暨訂單查詢</h1>
							</div>
							<div class="card-body bg-info">
								<div class="media">
									<img src="<%=request.getContextPath()%>/images/groupbuy/search.png" class="mr-3" alt="">
									<div class="media-body">
										<h2 class="mt-0">團購查詢</h2>
										<div class="media mt-3">
											<div class="media-body">
												<h5 class="mt-0">請輸入查詢條件</h5>
												
												<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/pro.do" >
													<div class="input-group mb-3">
														<div class="input-group-prepend">
															<span class="input-group-text" id="basic-addon1"><i class="fas fa-search"></i></span>
														</div>
														<input type="text" class="form-control" name="p_id" placeholder="請輸入商品編號 ex: P001" autocomplete="off">
														
														<div class="input-group-append">
															<input type="hidden" name="action" value="getOne_For_Display">
															<button class="btn btn-danger" type="submit">查詢</button>
															
														</div>
													</div>
												</form>
												
												<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/pro.do" >
													<div class="input-group mb-3">
														<div class="input-group-prepend">
															<span class="input-group-text" id="basic-addon1"><i class="fas fa-search"></i></span>
														</div>
														<select class="custom-select" name="gro_id">
															<c:forEach var="proVO" items="${proSvc.all}" varStatus="s">
																<option value="${proVO.p_id}">${proVO.p_id}</option>
															</c:forEach>
														</select>
														<div class="input-group-append">
															<input type="hidden" name="action" value="getOne_For_Display">
															<button class="btn btn-danger" type="submit">查詢</button>
														</div>
													</div>
												</form>
												
												<form action="<%=request.getContextPath()%>/groupbuy/groupbuy.do" method="post">
													<div class="input-group mb-3">
														<div class="input-group-prepend">
															<span class="input-group-text" id="basic-addon1"><i class="fas fa-search"></i></span>
														</div>
														<select class="custom-select" name="gro_id">
															<c:forEach var="productVO" items="${productSvc.all}">
																<c:forEach var="groupbuyVO" items="${groupbuySvc.all}">
																	<c:if test="${productVO.p_id eq groupbuyVO.p_id}">
																		<option value="${groupbuyVO.gro_id}">${productVO.p_name}</option>
																	</c:if>
																</c:forEach>
															</c:forEach>
														</select>
														<div class="input-group-append">
															<input type="hidden" name="from" value="back-end">
															<input type="hidden" name="action" value="getOne_For_Display">
															<button class="btn btn-danger" type="submit">查詢</button>
														</div>
													</div>
												</form>
												<div class="row justify-content-center">
													<div class="col-4 text-center mb-3">
														<h2 class="mt-0 mb-3">新增團購</h2>
														<a href="<%=request.getContextPath()%>/back-end/protected/groupbuy/addGroupbuy.jsp">
															<img alt="" class="select_icon" src="<%=request.getContextPath()%>/images/groupbuy/addGroupbuy.png">
														</a>
													</div>
													<div class="col-4 text-center mb-3">
														<h2 class="mt-0 mb-3">團購列表</h2>
														<a href="<%=request.getContextPath()%>/back-end/protected/groupbuy/listAllGroupbuy.jsp">
															<img alt="" class="select_icon" src="<%=request.getContextPath()%>/images/groupbuy/groupbuy.png" >
														</a>
													</div>
													<div class="col-4 text-center mb-3">
														<h2 class="mt-0 mb-3">訂單管理</h2>
														<a href="<%=request.getContextPath()%>/back-end/protected/groupbuy/listAllGro_order.jsp">
															<img alt="" class="select_icon" src="<%=request.getContextPath()%>/images/groupbuy/list.png">
														</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="media">
									<img src="<%=request.getContextPath()%>/images/groupbuy/search.png" class="mr-3" alt="">
									<div class="media-body">
										<h2 class="mt-0">訂單查詢</h2>
										<div class="media mt-3">
											<div class="media-body">
												<h5 class="mt-0">請輸入查詢條件</h5>
												<form action="<%=request.getContextPath()%>/gro_order/gro_order.do" method="post">
													<div class="input-group mb-3">
														<div class="input-group-prepend">
															<span class="input-group-text" id="basic-addon1"><i class="fas fa-search"></i></span>
														</div>
														<input type="text" class="form-control" name="ord_id" placeholder="請輸入訂單編號 ex: GO000001" autocomplete="off">
														<div class="input-group-append">
															<input type="hidden" name="from" value="back-end">
															<input type="hidden" name="action" value="getOne_For_Display">
															<button class="btn btn-danger" type="submit">查詢</button>
														</div>
													</div>
												</form>
												
												<form action="<%=request.getContextPath()%>/gro_order/gro_order.do" method="post">
													<div class="input-group mb-3">
														<div class="input-group-prepend">
															<span class="input-group-text" id="basic-addon1"><i class="fas fa-search"></i></span>
														</div>
														<select class="custom-select" name="ord_id">
															<c:forEach var="gro_orderVO" items="${gro_orderSvc.all}">
																<option value="${gro_orderVO.ord_id}">${gro_orderVO.ord_id}</option>
															</c:forEach>
														</select>
														<div class="input-group-append">
															<input type="hidden" name="from" value="back-end">
															<input type="hidden" name="action" value="getOne_For_Display">
															<button class="btn btn-danger" type="submit">查詢</button>
														</div>
													</div>
												</form>
												
												<form action="<%=request.getContextPath()%>/gro_order/gro_order.do" method="post">
													<label for="gro_id">以達標的團購查詢訂單</label>
													<div class="input-group mb-3">
														<div class="input-group-prepend">
															<span class="input-group-text" id="basic-addon1"><i class="fas fa-search"></i></span>
														</div>
														<select class="custom-select" name="gro_id" id="gro_id">
															<c:forEach var="gro_id" items="${gro_orderSvc.group}">
																<option value="${gro_id}">${gro_id}</option>
															</c:forEach>
														</select>
														<div class="input-group-append">
															<input type="hidden" name="from" value="back-end">
															<input type="hidden" name="action" value="getByGroup">
															<button class="btn btn-danger" type="submit">查詢</button>
														</div>
													</div>
												</form>												
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
            
        </main>
    </div>


</body>

</html>