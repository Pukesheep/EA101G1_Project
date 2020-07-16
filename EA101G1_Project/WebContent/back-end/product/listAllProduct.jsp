<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.product.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
    ProService proSvc = new ProService();
    List<ProVO> list = proSvc.getAll();
    pageContext.setAttribute("list",list);
%>
<jsp:useBean id="ptSvc" scope="page" class="com.productType.model.PtService" />

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%@ include file="/back-end/css/BackHeaderCssLink" %>
<title>�ӫ~�C��</title>

<style>
	img.img-product-icon {
		width: 100px;
		height: 100px;
	}
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
		<li class="breadcrumb-item active text-warning" aria-current="page">�ӫ~�C��</li>
	</ol>
</nav>
 
<div class="container">
	<div class="row justify-content-center">
		<div class="col-10">
			<div class="card alert alert-success">
				<div class="card-header bg-dark">
					<h1 class="text-white">�ӫ~�C��</h1>
				</div>
				<div class="card-body alert alert-warning">
					<%@ include file="/files/page1.file" %>
					<div class="row mt-3">
						<c:forEach var="proVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
							<div class="col-6 mb-1">
								<div class="card">
									<div class="card-header">
										<h4>${proVO.p_name}</h4>
									</div>
									<div class="card-body alert alert-info mb-0">
										<div class="media alert alert-secondary">
											<img alt="" src="<%=request.getContextPath()%>/product/proPic.do?p_id=${proVO.p_id}" class="img-product-icon">
											<div class="media-body">
												<ul>
													<li>�ӫ~����G <fmt:formatNumber pattern="#" value="${proVO.p_price}" /></li>
													<li>
														�ӫ~���A�G 
														<c:choose>
															<c:when test="${proVO.p_stat eq 0}">
																�U�[
															</c:when>
															<c:when test="${proVO.p_stat eq 1}">
																�W�[
															</c:when>
														</c:choose>
													</li>
													<li>�ӫ~�w�s�G ${proVO.p_stock}</li>
													<li>�ӫ~�P�q�G ${proVO.p_sales}</li>
												</ul>
											</div>
										</div>
										<div class="row">
											<div class="col-8">
												<h6 class="mt-1">�W�[����G <fmt:formatDate value="${proVO.p_add_date}" pattern="yyyy-MM-dd" /></h6>
											</div>
											<div class="col-4">
												<form action="<%=request.getContextPath()%>/product/pro.do" method="post" class="mb-0 mt-0">
													<input type="hidden" name="p_id" value="${proVO.p_id}">
													<input type="hidden" name="action" value="getOne_For_Update">
													<button type="submit" class="btn btn-outline-dark btn-sm btn-block">�ק�</button>
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




            
        </main>
    </div>


</body>

</html>