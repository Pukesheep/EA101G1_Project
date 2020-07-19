<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="com.BounsMall.model.*" %>


<%
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
	MemberService memberSvc = new MemberService();
	BMService bmSvc = new BMService();
	List<BMVO> list = bmSvc.getAll();
	pageContext.setAttribute("list",list);
	MemberVO memberVOgg = (MemberVO) memberSvc.getOneMember(memberVO.getMem_id());
	pageContext.setAttribute("memberVOgg", memberVOgg);
%>


<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>紅利商城</title>
    <%@ include file="../../../files/HeaderCssLink" %>
        
    <!-- SweetAlert2 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<!-- CKEditor -->
	<script src="<%=request.getContextPath()%>/files/ckeditor/ckeditor.js"></script>
	<!-- post.css -->
	
	<style>
		div.card {
			margin: 5px auto;
		}
	</style>
	
	
	
</head>
<body>
	
	<!--新增成功-->
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
	<!--新增成功-->
		
    <!-- navbar -->
		<%@ include file="../../../files/header.jsp" %>
    <!-- navbar end -->
    <section class="blank0"></section>
    <!-- 內容 -->
		
		<div class="container">
			<div class="card alert alert-primary">
				<div class="card-header" >
					<div class="row">
						<div class="col-8">
							<h4>"${sessionScope.memberVO.mem_name}"所持有的紅利：<i class="fas fa-clock text-warning"></i>${memberVOgg.mem_bonus}</h4>
						</div>
						<div class="col-4">
							<div class="row">
								<div class="col-6">
								<form action="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do" method="post">
									<input type="hidden" name="mem_id" value="${sessionScope.memberVO.mem_id}">
									<input type="hidden" name="action" value="getAllByMemberFront">
									<button type="submit" class="btn btn-light float-left" >查詢紅利訂單</button>
								</form>
								</div>
								<div class="col-6">
								<form action="<%=request.getContextPath()%>/FavoriteBouns/FBServlet.do" method="post">
									<input type="hidden" name="mem_id" value="${sessionScope.memberVO.mem_id}">
									<input type="hidden" name="action" value="getAllByMemberFront">
									<button type="submit" class="btn btn-light float-left" >查詢紅利最愛</button>
								</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="card-body">
					<div class="row">
						<c:forEach var="bmVO" items="${list}">
							<c:if test="${(bmVO.bon_status==0)}">
								<div class="col">
									<div class="card" style="width: 18rem;">
										<img src="<%=request.getContextPath()%>/BounsMall/ImageServlet.do?bon_id=${bmVO.bon_id}" class="card-img-top" alt="...">
										<div class="card-body">
											<p class="card-text">
												<div align="center">
													${bmVO.bon_name}<br>
													<i class="fas fa-clock text-warning"></i>${bmVO.bon_price}
												</div>
											</p>
											<div class="row">
												<div class="col-6">
													<form class="" action="<%=request.getContextPath()%>/BounsMall/BounsMall.do" method="post">
														<input type="hidden" name="BON_ID" value="${bmVO.bon_id}">
														<input type="hidden" name="action" value="getOne_For_Display">
														<button type="submit" class="btn btn-primary">商品詳情</button>
													</form>
												</div>
												<div class="col-6">
													<form class="exchange" action="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do" method="post">
														<input type="hidden" name="mem_id" value="${sessionScope.memberVO.mem_id}">
														<input type="hidden" name="bon_id" value="${bmVO.bon_id}">
														<input type="hidden" name="action" value="exchangeListAll">
														<button type="submit" class="btn btn-danger float-right" >我要兌換</button>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>	
					</div>
				</div>
			</div>
		</div>
		
	<!-- 內容 -->
        <!-- footer -->
			<%@ include file="../../../files/footer.jsp" %>
        <!-- footer -->
</body>



</html>