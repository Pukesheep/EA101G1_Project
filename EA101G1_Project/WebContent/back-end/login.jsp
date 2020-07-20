<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%@ include file="/back-end/css/BackHeaderCssLink"%>
<title>S.F.G 後台管理</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/back-end/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<style>
h1, h3 {
	padding: 10px;
	text-align: center;
	background-color: #22AA99;
}

div.container {
	margin-top: 20px;
}

div.input {
	padding: 10px;
	text-align: center;
}

body {
	background-color: #446688;
}

div #button {
	margin-top: 10px;
	text-align: center;
}
</style>


</head>

<body>

	<!-- header -->

	<%@ include file="/back-end/css/header.jsp"%>
	<!-- header -->

	<div class="content d-md-flex">

		<!-- aside -->
		<%@ include file="/back-end/css/aside.jsp"%>
		<!-- aside -->

		<%-- 錯誤訊息 --%>
		<c:if test="${not empty errorMsgs }">
			<%
				List<String> errorMsgs = (List<String>) request.getAttribute("errorMsgs");
					String error = "";
					for (String er : errorMsgs) {
						error += er + "\\n";
					}
			%>
			<script>
	Swal.fire({
		icon: 'error',
		title: '<%=error%>
				'
				});
			</script>
		</c:if>
		<%-- 錯誤訊息 --%>

		<main>
			<div class="container">
				<FORM METHOD="post"
					ACTION="<%=request.getContextPath()%>/loginhandler">
					<div class="row justify-content-center">
						<div class="col-10">

							<h3>員工登入系統</h3>
						</div>
					</div>
					<div class="row justify-content-center">



						<div class="input col-10">
							帳號: <input type="text" name="adm_acco" value=""
								placeholder="請輸入帳號">
						</div>
					</div>

					<div class="input row justify-content-center">
						<div class="input col-10">
							密碼: <input type="password" name="adm_pass" value=""
								placeholder="請輸入密碼">
						</div>
					</div>
					<div id="button" class="row" style=" padding-left: 160px;">
						<div class="input col-10">
							<input type="hidden" name="action" value="login"> 
							<input type="submit" class="btn btn-warning" value="登入">
						</div>
					</div>
				</form>
			</div>

		</main>
	</div>

</body>

</html>