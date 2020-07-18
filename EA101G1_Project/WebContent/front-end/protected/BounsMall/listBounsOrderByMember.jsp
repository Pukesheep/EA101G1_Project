<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.*" %>
<%@ page import="com.BounsOrder.model.*" %>
<%@ page import="com.BounsMall.model.*" %>
<%@ page import="com.member.model.*" %>

<%
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
	BOService boSvc = new BOService();
	List<BOVO> list = (List<BOVO>) boSvc.getByMem(memberVO.getMem_id());
	pageContext.setAttribute("list", list);
%>

<jsp:useBean id="bmSvc" scope="page" class="com.BounsMall.model.BMService" />
<jsp:useBean id="bsSvc" scope="page" class="com.BounsState.model.BSService"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>紅利訂單查詢</title>
    <!-- TODO: 換title 的icon -->
    <link rel="icon shortcut" href="<%=request.getContextPath()%>/front-end/img/ICON.ico">
    <!-- Bootstrap官方網站 https://getbootstrap.com/ -->
    <!-- 連結Bootstrap.min.css -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- 使用font awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
        integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
    <!-- 使用google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Sedgwick+Ave+Display&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lakki+Reddy&display=swap" rel="stylesheet">

    <!-- 使用style.css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">

    <!-- 連結Bootstrap所需要的js -->
    <!-- jquery.min.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- popper.min.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <!-- bootstrap.min.js -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
        
    <!-- SweetAlert2 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<!-- CKEditor -->
	<script src="<%=request.getContextPath()%>/files/ckeditor/ckeditor.js"></script>
	<!-- post.css -->
	
	<style>
	img.boImg {
		width: 150px;
		height: 150px;	
	}
	</style>
</head>

<body bgcolor='white'>
	
<!-- 	錯誤列表 -->
	<c:if test="">
		<font style="color:red">請修正以下錯誤：</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	
	 <!-- navbar -->
	<%@ include file="../../../files/header.jsp" %>
    <!-- navbar end -->
    <section class="blank0"></section>
    <!-- 內容 -->
    
    <div class="container">
    	<div class="card alert alert-primary">
    		<div class="card-header">
    			<div align="center">
    				<h4>"${sessionScope.memberVO.mem_name}"的紅利訂單</h4>
    			</div>
    		</div>
    		<%@ include file="../../../files/page1.file" %>
    		<div class="card-body">
    			<div class="row">
    				<c:forEach var="boVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>" >
    					<c:if test="${boVO.bs_id!='BS002'}">
	    					<div class="col-12">
	    						<div class="card alert alert-light mb-3 p-4">
	    							<div class="media alert alert-success">
		    							<img class="boImg" src="<%=request.getContextPath()%>/BounsMall/ImageServlet.do?bon_id=${boVO.bon_id}">
		    							<div class="media-body">
		    								<div class="media justify-content-around align-items-center">
			    								<div class="col-6">
			    									<div align="center">
			    										<h4>紅利商品名稱</h4>
			    										<h4>${bmSvc.getByPK(boVO.bon_id).bon_name}</h4>
			    									</div>
			    								</div>
			    								<div class="col-3">
			    									<div align="center">
			    										<h4>下定日期</h4>
			    										<h4>${boVO.ord_Date}</h4>
			    									</div>
			    								</div>
			    								<div class="col-3">
			    									<div align="center">
			    										<h4>訂單狀態</h4>
			    										<h4>${bsSvc.getOneBS(boVO.bs_id).bs_stat}</h4>
			    									</div>
			    								</div>
		    								</div>
		    							</div>
	    							</div>
	    							<c:choose>
	    								<c:when test="${boVO.bs_id=='BS001'}">
	    									<div align="center">
				    							<form method="post" action="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do" style="margin-bottom: 0px;">
													<input type="hidden" name="ord_id" value="${boVO.ord_id}">
													<input type="hidden" name="mem_id" value="${boVO.mem_id}">
													<input type="hidden" name="bon_id" value="${boVO.bon_id}">
													<input type="hidden" name="action" value="cancel">
													<button type="submit" class="btn btn-warning float-center">取消訂單</button>
												</form>
											</div>
	    								</c:when>
	    								<c:when test="${boVO.bs_id=='BS003'}">
	    									<div align="center">
	    										<div class="col-8">
			    									<div class="row">
			    										<div class="col-6">
							    							<form method="post" action="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do" style="margin-bottom: 0px;">
																<input type="hidden" name="ord_id" value="${boVO.ord_id}">
																<input type="hidden" name="mem_id" value="${boVO.mem_id}">
																<input type="hidden" name="bs_id" value="BS004">
																<input type="hidden" name="action" value="updateBSFront">
																<button type="submit" class="btn btn-success float-center">完成訂單</button>
															</form>
														</div>
														<div class="col-6">
								    						<form method="post" action="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do" style="margin-bottom: 0px;">
																<input type="hidden" name="ord_id" value="${boVO.ord_id}">
																<input type="hidden" name="mem_id" value="${boVO.mem_id}">
																<input type="hidden" name="bs_id" value="BS005">
																<input type="hidden" name="action" value="updateBSFront">
																<button type="submit" class="btn btn-danger float-center">我要退貨</button>
															</form>
														</div>
													</div>
												</div>
											</div>
	    								</c:when>
	    							</c:choose>
	    						</div>
	    					</div>
	    				</c:if>
    				</c:forEach>
    			</div>
    		</div>
    		<%@ include file="../../../files/page2C.file" %>
    	</div>
    </div>

	<!-- 內容 -->
	<!-- footer -->
	<%@ include file="../../../files/footer.jsp" %>
	<!-- footer -->

</body>
</html>