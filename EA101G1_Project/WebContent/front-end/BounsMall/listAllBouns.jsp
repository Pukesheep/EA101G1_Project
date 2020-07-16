<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="com.BounsMall.model.*" %>


<%
	BMService bmSvc = new BMService();
	List<BMVO> list = bmSvc.getAll();
	pageContext.setAttribute("list",list);
%>


<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>紅利商城</title>
    <%@ include file="../../files/HeaderCssLink" %>
        
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
		
    <!-- navbar -->
		<%@ include file="../../files/header.jsp" %>
    <!-- navbar end -->
    <section class="blank0"></section>
    <!-- 內容 -->
    	
    	<div class="container">
    		<div class="row">
    			
    			
    		</div>
    	</div>
    	<form action="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do" method="post">
			<input type="hidden" name="mem_id" value="${sessionScope.memberVO.mem_id}">
			<input type="hidden" name="action" value="getAllByMemberFront">
			<button type="submit" class="btn btn-danger float-left" >查詢紅利訂單</button>
		</form>
		<form action="<%=request.getContextPath()%>/FavoriteBouns/FBServlet.do" method="post">
			<input type="hidden" name="mem_id" value="${sessionScope.memberVO.mem_id}">
			<input type="hidden" name="action" value="getAllByMemberFront">
			<button type="submit" class="btn btn-danger float-left" >查詢紅利最愛</button>
		</form>
		
		<div class="container">
			<div class="row">
				<c:forEach var="bmVO" items="${list}">
					<c:if test="${(bmVO.bon_status==0)}">
						<div class="col">
							<div class="card" style="width: 18rem;">
								<img src="<%=request.getContextPath()%>/BounsMall/ImageServlet.do?bon_id=${bmVO.bon_id}" class="card-img-top" alt="...">
								<div class="card-body">
									<p class="card-text">
										${bmVO.bon_name} － <i class="fas fa-clock"></i>${bmVO.bon_price}
									</p>
									<a href="<%=request.getContextPath()%>/BounsMall/BounsMall.do?action=getOne_For_Display&BON_ID=${bmVO.bon_id}" class="btn btn-primary">商品詳情</a>
									<a href="<%=request.getContextPath()%>/Bouns"></a>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>	
			</div>
		</div>
		
	<!-- 內容 -->
        <!-- footer -->
			<%@ include file="../../files/footer.jsp" %>
        <!-- footer -->
</body>



</html>