<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.FavoriteBouns.model.*" %>

<%
	List<FBVO> list = (List<FBVO>) request.getAttribute("list");
%>

<jsp:useBean id="bmSvc" scope="page" class="com.BounsMall.model.BMService"/>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>�|�����Q�̷R�d��</title>
    <!-- TODO: ��title ��icon -->
    <link rel="icon shortcut" href="<%=request.getContextPath()%>/front-end/img/ICON.ico">
    <!-- Bootstrap�x����� https://getbootstrap.com/ -->
    <!-- �s��Bootstrap.min.css -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- �ϥ�font awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
        integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
    <!-- �ϥ�google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Sedgwick+Ave+Display&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lakki+Reddy&display=swap" rel="stylesheet">

    <!-- �ϥ�style.css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">

    <!-- �s��Bootstrap�һݭn��js -->
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
	
</head>
<body bgcolor='white'>
	
<!-- 	���~�C�� -->
	<c:if test="">
		<font style="color:red">�Эץ��H�U���~�G</font>
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
    <!-- ���e -->
    
	<!-- ���e -->
        <!-- footer -->
			<%@ include file="../../../files/footer.jsp" %>
        <!-- footer -->
	
	<table>
		<tr>
			<th>���Q�ӫ~</th>
			<th>�ӫ~���A</th>
			<th>�����̷R</th>
		</tr>
		
		<%@ include file="../../../files/page1.file" %>
		<c:forEach var="fbVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
			<tr>
				<td>${bmSvc.getByPK(fbVO.bon_id).bon_name}</td>
				<td>${bmSvc.getByPK(fbVO.bon_id).bon_status==0? "�W�[":"�U�["}</td>
				<td>
					<form method="post" action="<%=request.getContextPath()%>/FavoriteBouns/FBServlet.do" style="margin-bottom: 0px;">
						<input type="hidden" name="mem_id" value="${fbVO.mem_id}">
						<input type="hidden" name="bon_id" value="${fbVO.bon_id}">
						<input type="hidden" name="action" value="cancel">
						<input type="submit" value="����" >
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="../../../files/page2.file" %>
	
</body>
</html>