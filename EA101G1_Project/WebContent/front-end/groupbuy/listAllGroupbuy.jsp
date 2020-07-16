<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.*" %>
<%@ page import="com.groupbuy.model.*" %>
<%@ page import="com.product.model.*" %>
<%@ page import="com.rebate.model.*" %>

<%
	GroupbuyService groupbuySvc = new GroupbuyService();
	List<GroupbuyVO> list = groupbuySvc.getAll();
	pageContext.setAttribute("list", list);
%>

<jsp:useBean id="productSvc" scope="page" class="com.product.model.ProService" />
<jsp:useBean id="rebateSvc" scope="page" class="com.rebate.model.RebateService" />

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>團購列表</title>
    <%@ include file="../../files/HeaderCssLink" %>
        
    <!-- SweetAlert2 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
 
	<!-- groupbuy.css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/groupbuy.css"> 	

	
	
</head>
<body>
    <!-- navbar -->
		<%@ include file="../../files/header.jsp" %>
    <!-- navbar end -->
    <section class="blank0"></section>
    <!-- 內容 -->
    
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
		<li class="breadcrumb-item"><a class="bread" href="<%=request.getContextPath()%>/front-end/index.jsp">前台首頁</a></li>
		<li class="breadcrumb-item active text-warning" aria-current="page">團購列表</li>
	</ol>
</nav>



<div class="container-fluid">
	<div class="row justify-content-center">
		<div class="col">
			<div class="card bg-info">
				<div class="card-header bg-dark">
					<ul class="nav float-right mr-1 mt-1 text-dark">
						<li class="nav-item">
							<a class="nav-link active h5" href="<%=request.getContextPath()%>/front-end/groupbuy/listAllGroupbuy.jsp">團購列表</a>
						</li>
						<li class="nav-item">
							<a class="nav-link active h5" href="<%=request.getContextPath()%>/front-end/protected/groupbuy/listAllGromem.jsp">我的團購</a>
						</li>
						<li class="nav-item">
							<a class="nav-link active h5" href="<%=request.getContextPath()%>/front-end/protected/groupbuy/listAllGro_order.jsp">團購訂單</a>
						</li>
					</ul>
					<h1 class="text-white">團購列表</h1>
				</div>
				<div class="row m-3">
					<c:forEach var="groupbuyVO" items="${list}">
						<c:if test="${groupbuyVO.status eq 1}">
							<div class="col-4">
								<div class="card-group">
									<c:forEach var="productVO" items="${productSvc.all}">
										<c:if test="${productVO.p_id eq groupbuyVO.p_id}">
											<div class="card bg-success ml-2 mr-2">
												<img class="card-display" alt="" src="<%=request.getContextPath()%>/product/proPic.do?p_id=${groupbuyVO.p_id}" onclick="location.href='<%=request.getContextPath()%>/groupbuy/groupbuy.do?action=getOne_For_Display&from=front-end&gro_id=${groupbuyVO.gro_id}';">
												<div class="card-header text-dark">
													<a href="<%=request.getContextPath()%>/groupbuy/groupbuy.do?action=getOne_For_Display&from=front-end&gro_id=${groupbuyVO.gro_id}" class="groupbuydetail"><h2>${productVO.p_name}</h2></a>
												</div>
												<div class="card-body">
													<h4>原價： $<fmt:formatNumber pattern="#" value="${productVO.p_price}" /></h4>
													<h6>截止時間： <fmt:formatDate value="${groupbuyVO.end_date}" pattern="yyyy-MM-dd HH:mm:ss" /></h6>
												</div>
											</div>
										</c:if>	
									</c:forEach>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>






    <!-- 內容 ---end  -->


        <!-- footer -->
			<%@ include file="../../files/footer.jsp" %>
        <!-- footer -->
</body>



</html>