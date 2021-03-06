<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.*" %>
<%@ page import="com.groupbuy.model.*" %>
<%@ page import="com.product.model.*" %>
<%@ page import="com.rebate.model.*" %>
<%@ page import="com.gromem.model.*" %>
<%@ page import="com.member.model.*" %>

<%
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
	GromemService gromemSvc = new GromemService();
	List<GromemVO> list = gromemSvc.getAllByM(memberVO.getMem_id());
	pageContext.setAttribute("list", list);
%>

<jsp:useBean id="groupbuySvc" scope="page" class="com.groupbuy.model.GroupbuyService" />
<jsp:useBean id="productSvc" scope="page" class="com.product.model.ProService" />
<jsp:useBean id="rebateSvc" scope="page" class="com.rebate.model.RebateService" />

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>我的團購</title>
    <%@ include file="/files/HeaderCssLink" %>
        
    <!-- SweetAlert2 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
 
	<!-- groupbuy.css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/groupbuy.css"> 		
	
</head>
<body>
    <!-- navbar -->
		<%@ include file="/files/header.jsp" %>
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
		<li class="breadcrumb-item"><a class="bread" href="<%=request.getContextPath()%>/front-end/groupbuy/listAllGroupbuy.jsp">團購列表</a></li>
		<li class="breadcrumb-item active text-warning" aria-current="page">我的團購</li>
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
					<h1 class="text-white">我的團購</h1>
				</div>
				<%@ include file="../../../files/page1B.file" %>
				<div class="row m-3">
					<c:forEach var="gromemVO" items="${list}">
						<c:forEach var="groupbuyVO" items="${groupbuySvc.all}">
							<c:if test="${groupbuyVO.gro_id eq gromemVO.gro_id}">
								<div class="col-6 mt-2">
									<div class="card bg-success">
										<div class="card-header">
											<a href="<%=request.getContextPath()%>/groupbuy/groupbuy.do?action=getOne_For_Display&from=front-end&gro_id=${groupbuyVO.gro_id}">
												<h3 class="text-white">${productSvc.getOnePro(groupbuyVO.p_id).p_name}</h3>
											</a>
										</div>
										<div class="card-body">
											<div class="media bg-secondary p-2">
												<a href="<%=request.getContextPath()%>/groupbuy/groupbuy.do?action=getOne_For_Display&from=front-end&gro_id=${groupbuyVO.gro_id}">
													<img src="<%=request.getContextPath()%>/product/proPic.do?p_id=${groupbuyVO.p_id}" class="align-self-end mr-3 img-listAll" alt="">
												</a>
												<div class="media-body">
													<h4 class="mt-3">團購編號： ${groupbuyVO.gro_id}</h4>
													<c:choose>
														<c:when test="${groupbuyVO.status eq 0}">
															<h4>狀態： 下架</h4>
														</c:when>
														<c:when test="${groupbuyVO.status eq 1}">
															<h4>狀態： 上架</h4>
														</c:when>
														<c:when test="${groupbuyVO.status eq 2}">
															<h4>狀態： 已達標</h4>
														</c:when>
														<c:when test="${groupbuyVO.status eq 3}">
															<h4>狀態： 未達標</h4>
														</c:when>
														<c:when test="${groupbuyVO.status eq 4}">
															<h4>狀態：成立訂單</h4>
														</c:when>
													</c:choose>
													<h4>原價： $<fmt:formatNumber pattern="#" value="${productSvc.getOnePro(groupbuyVO.p_id).p_price}" /></h4>
													<h5 class="mt-5">截止時間： <fmt:formatDate value="${groupbuyVO.end_date}" pattern="yyyy-MM-dd hh:mm:ss" /></h5>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>




    <!-- 內容 ---end  -->


        <!-- footer -->
			<%@ include file="/files/footer.jsp" %>
        <!-- footer -->
</body>



</html>