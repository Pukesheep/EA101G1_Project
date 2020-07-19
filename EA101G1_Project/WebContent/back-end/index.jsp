<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.adm.model.*"%>
<%@ page import="java.util.*"%>
<%
	AdmVO admVO = (AdmVO) request.getAttribute("admVO");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<title></title>
<%@ include file="/back-end/css/BackHeaderCssLink"%>

<style>
div.card {
	background-color: rgba(0, 0, 0, 0.5) !important;
	color: white;
	height: 200px;
}

a:hover {
	text-decoration: none;
}

div.status_row {
	/* 	margin-top: 50px; */
	
}

div.chart_row {
	margin-top: 30px;
}

body {
	background-image:
		url('http://getwallpapers.com/wallpaper/full/a/e/e/7532.jpg');
	background-size: cover;
	backrgound-position: center center;
}
</style>

</head>

<body>
	<%-- 成功訊息 --%>
<c:if test="${not empty successMsgs }">
<%
	List<String> successMsgs = (List<String>) request.getAttribute("successMsgs");
	String success = "";
	for (String su : successMsgs) {
		success += su+"\\n";
	}
%>
<script>
	Swal.fire({
		icon: 'success',
		title: '<%=success%>'
	});
</script>
</c:if>
<%-- 成功訊息 --%>

<!-- header -->

	<%@ include file="/back-end/css/header.jsp"%>
	<!-- header -->

	<div class="content d-md-flex">

		<!-- aside -->
		<%@ include file="/back-end/css/aside.jsp"%>
		<!-- aside -->

		<main>
			<div class="container-fluid contentListOne h-100">

				<div class="row justify-content-around h-50 align-items-center">
					<div class="col-lg-3">
						<a
							href="<%=request.getContextPath()%>/back-end/member/select_page.jsp">
							<div class="card">
								<div class="card-body d-flex align-items-center">
									<div class="fas fa-user-cog fa-4x mr-2 d-none d-sm-block"></div>
									<div class="text-center w-100">
										<div class="h2">會員管理</div>
									</div>
								</div>
							</div>
						</a>
					</div>

					<div class="col-lg-3">
						<a
							href="<%=request.getContextPath()%>/back-end/product/listAllProduct.jsp">
							<div class="card">
								<div
									class="card-body d-flex align-items-center h-50 align-items-center">
									<div class="fas fa-store fa-4x mr-2 d-none d-sm-block"></div>
									<div class="text-center w-100">
										<div class="h2">商城管理</div>
									</div>
								</div>
							</div>
						</a>
					</div>

					<div class="col-lg-3">
						<a
							href="<%=request.getContextPath()%>/back-end/BounsMall/ListAll.jsp">
							<div class="card">
								<div class="card-body d-flex align-items-center">
									<div class="fas fa-coins fa-4x mr-2 d-none d-sm-block"></div>
									<div class="text-center w-100">
										<div class="h2">紅利商城管理</div>
									</div>
								</div>
							</div>
						</a>
					</div>
				</div>

				<div class="row justify-content-around mt-3 mt-lg-0">
					<div class="col-lg-3">
						<a
							href="<%=request.getContextPath()%>/back-end/protected/groupbuy/select_page.jsp">
							<div class="card">
								<div class="card-body d-flex align-items-center">
									<div class="fas fa-object-ungroup fa-4x mr-2 d-none d-sm-block"></div>
									<div class="text-center w-100">
										<div class="h2">團購管理</div>
									</div>
								</div>
							</div>
						</a>
					</div>

					<div class="col-lg-3">
						<a
							href="<%=request.getContextPath()%>/back-end/immed/listAllImmed.jsp">
							<div class="card">
								<div class="card-body d-flex align-items-center">
									<div
										class="fas fa-shopping-basket fa-4x mr-2 d-none d-sm-block"></div>
									<div class="text-center w-100">
										<div class="h2">交易區管理</div>
									</div>
								</div>
							</div>
						</a>
					</div>

					<div class="col-lg-3">
						<a
							href="<%=request.getContextPath()%>/back-end/psac/select_page.jsp">
							<div class="card">
								<div class="card-body d-flex align-items-center">
									<div class="fas fa-paste fa-4x mr-2 d-none d-sm-block"></div>
									<div class="text-center w-100">
										<div class="h2">檢舉管理</div>
									</div>
								</div>
							</div>
						</a>
					</div>
				</div>

			</div>
		</main>
	</div>

</body>

</html>