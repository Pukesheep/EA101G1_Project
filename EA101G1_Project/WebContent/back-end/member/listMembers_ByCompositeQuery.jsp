<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.member.model.*" %>

<jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService" />
<jsp:useBean id="listMembers_ByCompositeQuery" scope="request" type="java.util.List<MemberVO>" />

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <%@ include file="/back-end/css/BackHeaderCssLink" %>   
 	<!-- SweetAlert2 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	
	<!-- member.css -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member.css">	
	
	<title>會員列表</title>   

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
<%-- 錯誤表列 --%>

</c:if>

<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-10">
			<div class="card text-white back-end-form">
				<div class="col">
					<h2 class="card-title">會員列表</h2>
				</div>
				<ul class="list-unstyled mr-3">
					<%@ include file="../../files/page1_ByCompositeQueryMember.file" %>
					<c:forEach var="memberVO" items="${listMembers_ByCompositeQuery}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
						<li class="media ${(memberVO.mem_id == param.mem_id) ? 'bg-success' : '' }">
							<a href="<%=request.getContextPath()%>/member/member.do?action=getOne_For_Display-back&mem_id=${memberVO.mem_id}">
								<img src="<%=request.getContextPath()%>/member/ShowMemberPic.do?mem_id=${memberVO.mem_id}" class="rounded-circle align-self-center ml-3 mr-3 listAllMember" alt="">
							</a>
							<div class="media-body">
								<form action="<%=request.getContextPath()%>/member/member.do" method="post">
									<input type="hidden" name="requestURL" value="<%=request.getServletPath()%>">
									<input type="hidden" name="whichPage" value="<%=whichPage%>">
									<input type="hidden" name="mem_id" value="${memberVO.mem_id}">
									<input type="hidden" name="action" value="getOne_For_Update-back">
									<button type="submit" class="btn btn-outline-warning float-right d-inline-block">修改</button>
								</form>
								<h5 class="mt-0 mb-1">${memberVO.mem_id} - ${memberVO.mem_name}</h5>
								<h6 class="mt-0 mb-1">${memberVO.mem_email} - ${memberVO.mem_phone}</h6>
								${memberVO.mem_addr}
							</div>
						</li>
					</c:forEach>
				</ul>
				<%@ include file="../../files/page2_ByCompositeQueryMember.file" %>
			</div>
		</div>
	</div>
</div>
    
<%-- 內容 --%>  


            
        </main>
    </div>


</body>

</html>