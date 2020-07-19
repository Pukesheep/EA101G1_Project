<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="com.member.model.*" %>
<%@ page import="com.groupbuy.model.*" %>
<%@ page import="com.product.model.*" %>
<%@ page import="com.rebate.model.*" %>
<%@ page import="com.gro_order.model.*" %>
<%@ page import="com.ordstat.model.*" %>

<%
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
	Gro_orderService gro_orderSvc = new Gro_orderService();
	List<Gro_orderVO> list = gro_orderSvc.getAllByMem_id(memberVO.getMem_id());
	pageContext.setAttribute("list", list);
%>

<jsp:useBean id="groupbuySvc" scope="page" class="com.groupbuy.model.GroupbuyService" />
<jsp:useBean id="productSvc" scope="page" class="com.product.model.ProService" />
<jsp:useBean id="rebateSvc" scope="page" class="com.rebate.model.RebateService" />
<jsp:useBean id="ordstatSvc" scope="page" class="com.ordstat.model.OrdstatService" />

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>團購訂單</title>
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

<%-- 成功表列 --%>
<c:if test="${not empty successMsgs }">
<%
	java.util.List<String> successMsgs = (java.util.List<String>) request.getAttribute("successMsgs");
	String message = "";
	for (String msg : successMsgs) {
		message += msg;
		message += "\\n";
	}
%>
<script>
	Swal.fire({
		icon: 'success',
		title: '<%=message%>'
	});
</script>
</c:if>
<%-- 成功表列 --%>

<nav aria-label="breadcrumb">
	<ol class="breadcrumb bg-transparent">
		<li class="breadcrumb-item"><a class="bread" href="<%=request.getContextPath()%>/front-end/index.jsp">前台首頁</a></li>
		<li class="breadcrumb-item"><a class="bread" href="<%=request.getContextPath()%>/front-end/groupbuy/listAllGroupbuy.jsp">團購列表</a></li>
		<li class="breadcrumb-item active text-warning" aria-current="page">團購訂單</li>
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
					<h1 class="text-white">團購訂單</h1>
					</div>
					<%@ include file="../../../files/page1B.file" %>
					<div class="row m-3">
						<c:forEach var="gro_orderVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
							<c:forEach var="groupbuyVO" items="${groupbuySvc.all}">
								<c:if test="${groupbuyVO.gro_id eq gro_orderVO.gro_id}">
									<div class="col-6 mt-2">
										<div class="card bg-success">
											<div class="card-header">
												<h3 class="text-white">${productSvc.getOnePro(groupbuyVO.p_id).p_name}</h3>
												</div>
											<div class="card-body">
												<div class="media bg-secondary p-2">
													<img alt="" src="<%=request.getContextPath()%>/product/proPic.do?p_id=${groupbuyVO.p_id}" class="align-self-center mr-3 img-listAll">
													<div class="media-body">
														<h4 class="mt-3">訂單編號： ${gro_orderVO.ord_id}</h4>
														<c:forEach var="ordstatVO" items="${ordstatSvc.all}">
															<c:if test="${ordstatVO.ordstat_id eq gro_orderVO.ordstat_id}">
																<h4>訂單狀態： ${ordstatVO.ordstat}</h4>
															</c:if>
														</c:forEach>
														<h4>訂單金額： $<fmt:formatNumber pattern="#" value="${gro_orderVO.ord_price}" /></h4>
														<h4>商品原價： $<fmt:formatNumber pattern="#" value="${productSvc.getOnePro(groupbuyVO.p_id).p_price}" /></h4>
														<h5 class="mt-5">訂單成立時間： <fmt:formatDate value="${gro_orderVO.ord_date}" pattern="yyyy-MM-dd hh:mm:ss" /></h5>
													</div>
												</div>
												<div class="row mt-2">
													<div class="col-6">
														<c:if test="${gro_orderVO.ordstat_id eq '002'}">
															<form action="<%=request.getContextPath()%>/gro_order/gro_order.do" method="post">
																<input type="hidden" name="ord_id" value="${gro_orderVO.ord_id}">
																<input type="hidden" name="from" value="front-end">
																<input type="hidden" name="action" value="getOne_For_Payment">
																<button type="submit" class="btn btn-danger btn-block">付款</button>
															</form>
														</c:if>
													</div>
													<div class="col-6">
														<form action="<%=request.getContextPath()%>/gro_order/gro_order.do" method="post">
															<input type="hidden" name="ord_id" value="${gro_orderVO.ord_id}">
															<input type="hidden" name="from" value="front-end">
															<input type="hidden" name="action" value="getOne_For_Display">
															<button type="submit" class="btn btn-warning btn-block">查看訂單詳情</button>
														</form>
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