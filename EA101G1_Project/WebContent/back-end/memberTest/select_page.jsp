<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.member.model.*" %>

<jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService" />

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/back-end/css/bootstrap.min.css">
    <!-- Include Favicon ico-->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/back-end/css/ICON.ico">
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
    
    <title>會員查詢</title>
	
	<!-- SweetAlert2 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	
	<!-- member.css -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member.css">	
</head>

<body>
<!-- header -->
	<%@ include file="../css/header.jsp" %>
<!-- header -->

    <div class="content d-md-flex">

<!-- aside -->
	<%@ include file="../css/aside.jsp" %>
<!-- aside -->

        <main>
<%-- 內容 --%>           

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

<div class="container">
	<div class="row justify-content-center">
		<div class="col">
			<div class="card text-white back-end-form">
				<div class="card-body">
					<h2 class="card-title">會員查詢</h2>
					<form action="<%=request.getContextPath()%>/member/member.do" method="post">
						<div class="input-group mb-3">
							<input type="text" class="form-control" name="mem_id" id="inlineFormInputGroup" placeholder="請輸入會員編號 ex: M000001">
							<div class="input-group-append">
								<input type="hidden" name="action" value="getOne_For_Display-back">
								<button class="btn btn-outline-warning" type="submit">單筆查詢</button>
							</div>
						</div>
					</form>

					<form action="<%=request.getContextPath()%>/member/member.do" method="post">
						<div class="input-group mb-3">
							<select class="custom-select" id="mem_idQuery" name="mem_id">
								<c:forEach var="memberVO" items="${memberSvc.all}">
									<option value="${memberVO.mem_id}">${memberVO.mem_id}</option>
								</c:forEach>
							</select>
							<div class="input-group-append">
								<input type="hidden" name="action" value="getOne_For_Display-back">
								<button class="btn btn-outline-warning" type="submit">單筆查詢</button>
							</div>
						</div>
					</form>				
				<br>
				
					<form action="<%=request.getContextPath()%>/member/member.do" method="post">
					
						<div class="form-group">
							<input type="text" class="form-control" id="mem_id" name="mem_id" placeholder="請輸入會員編號 ex: M000001" autocomplete="off">
						</div>
						
						<div class="form-group">
							<input type="text" class="form-control" id="mem_name" name="mem_name" placeholder="請輸入會員名稱 ex: 早餐店大冰奶" autocomplete="off">
						</div>
						
						<div class="form-group">
							<input type="text" class="form-control" id="mem_email" name="mem_email" placeholder="請輸入會員信箱 ex: servereDiarrhea@gmail.com" autocomplete="off">
							<label for="mem_autho">會員權限</label>
							<div class="input-group mb-3">
								<select class="custom-select" id="mem_autho" name="mem_autho">
									<option></option>
									<option value="0">停權會員</option>
									<option value="1">一般會員</option>
									<option value="2">賣家資格會員</option>
									<option value="99">平台管理員</option>
								</select>
							</div>	
						</div>
						<input type="hidden" name="action" value="listMembers_ByCompositeQuery">
						<button type="submit" class="btn btn-outline-warning float-right">複合查詢</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>   
    
<%-- 內容 --%>   



            
        </main>
    </div>


</body>

</html>