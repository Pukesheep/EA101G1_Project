<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.productOrder.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
	PoService poSvc = new PoService();
	List<PoVO> list = poSvc.getOrder("003");
	pageContext.setAttribute("list", list);
%>
<jsp:useBean id="polSvc" scope="page"
	class="com.productOrderList.model.PolService" />
<jsp:useBean id="ordSvc" scope="page"
	class="com.ordstat.model.OrdstatService" />
<jsp:useBean id="proSvc" scope="page"
	class="com.product.model.ProService" />

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>���X�f�q��C��</title>
<%@ include file="../../css/BackHeaderCssLink"%>
<style>
	body {
		background-image: url('https://cdn.pixabay.com/photo/2017/08/07/22/10/bled-2608425_1280.jpg');
		background-size : cover;
		background-repeat: no-repeat;
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
<%-- ���~��C --%>
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
<%-- ���~��C --%>

<%-- ���\��C --%>
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
<%-- ���\��C --%> 		

<nav aria-label="breadcrumb">
	<ol class="breadcrumb bg-transparent">
		<li class="breadcrumb-item"><a class="bread" href="<%=request.getContextPath()%>/back-end/index.jsp">��x����</a></li>
		<li class="breadcrumb-item active text-warning" aria-current="page">���X�f�q��C��</li>
	</ol>
</nav>
 

<div class="container">
	<div class="row justify-content-center">
		<div class="col-10">
			<div class="card alert alert-success">
				<div class="card-header bg-dark">
					<h1 class="text-white">���X�f�q��C��</h1>
				</div>
				<div class="card-body alert alert-warning">
					<%@ include file="/files/page1.file" %>
					<div class="row mt-3">
						<c:forEach var="poVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
							<div class="col-12 mb-1">
								<div class="card">
									<div class="card-header">
										<div class="row">
											<div class="col-6">
												<h4>�q��s���G <p class="mt-1 mb-0">${poVO.po_id}</p></h4>
											</div>
											<div class="col-6">
												<h4>�q�檬�A�G <p class="mt-1 mb-0">${ordSvc.listOneOrdstat(poVO.ordstat_id).ordstat}</p></h4>
											</div>
										</div>
									</div>
									<div class="card-body alert alert-info mb-0">
										<div class="card mb-0">
											<div class="card-header bg-secondary mt-0 mb-0 text-center">
												<h4>�q��ӫ~</h4>
											</div>
											<div class="media alert alert-secondary mb-0">
												<div class="media-body">
													<c:forEach var="polVO" items="${polSvc.getPolbyPoId(poVO.po_id)}">
														<div class="row">
															<div class="col-7 mr-0">
																�~�W �G ${proSvc.getOnePro(polVO.p_id).p_name}
															</div>
															<div class="col-2">
																�ƶq�G ${polVO.order_qua}
															</div>
															<div class="col-3">����G <fmt:formatNumber pattern="#" value="${polVO.p_price}" /></div>
														</div>
													</c:forEach>
												</div>
											</div>
											<div class="card-footer">
												<h5 class="float-right mr-5">�q����B�G <fmt:formatNumber pattern="#" value="${poVO.amount}" /></h5>
												
											</div>
										</div>
										<div class="row mt-3">
											<div class="col-8">
												<h6 class="mt-1">�q�榨�߮ɶ��G <fmt:formatDate value="${poVO.add_date}" pattern="yyyy-MM-dd hh:mm:ss" /></h6>
											</div>
											<div class="col-4">
												<form action="<%=request.getContextPath()%>/productOrder/Po.do" method="post" class="mb-0 mt-0">
													<input type="hidden" name="po_id" value="${poVO.po_id}">
													<input type="hidden" name="ordstat_id" value="006">
													<input type="hidden" name="url" value="<%=request.getServletPath()%>?<%=request.getQueryString()%>">
													<input type="hidden" name="action" value="updateOrdStat">
													<button type="submit" class="btn btn-outline-dark btn-sm btn-block">�X�f</button>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<%@ include file="/files/page2.file" %>
				</div>
			</div>
		</div>
	</div>
</div>




</body>

</html>