<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.immed.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%	request.setCharacterEncoding("UTF-8");
	String immedName = request.getParameter("immed_search"); 
	ImmedService immedSvc = new ImmedService();
	List<ImmedVO> list = immedSvc.findByImmedName(immedName);
	pageContext.setAttribute("list", list);
%>

<html>
<head>
<title>�Ҧ��ӫ~��� - listAllImmed.jsp</title>
<link rel="icon shortcut" href="./img/ICON.ico">
<!-- Bootstrap�x����� https://getbootstrap.com/ -->
<!-- �s��Bootstrap.min.css -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<!-- �ϥ�font awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">
<!-- �ϥ�google Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Sedgwick+Ave+Display&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Lakki+Reddy&display=swap"
	rel="stylesheet">

<!-- �ϥ�style.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/css/style.css">

<style>
table {
	border-collapse: collapse;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 5px;
	text-align: center;
}

table#table-1 {
	width: 100%;
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

table#table-2 img.immed_pic {
	width: 100px;
}

table#table-2 p.immed_name {
	width: 130px;
}

table#table-2 p.immed_desc {
	width: 250px;
	height: 200px;
	overflow: auto;
	text-align: justify;
}

table#table-2 p.rcpt_add {
	width: 100px;
}

h4 {
	color: blue;
	display: inline;
}
</style>
</head>
<body>
	<!-- navbar -->
	<!-- �ϥ�Boostrap Navbar -->
	<!-- �]�wNavbar��K�e���W�t -->
	<!-- b4-navbar-default �w��Bootstrap�~��,�i�H�ϥΧֱ����O -->
	<nav class="navbar navbar-expand-md navbar-dark fixed-top">
		<a class="navbar-brand" href="index.html"> <span class="logo"><i
				class="fas fa-bomb"></i></span> <span class="logo2">S.F.G</span> <span
			class="logo3">{{{</span>
		</a>
		<!-- ��������s -->
		<button class="navbar-toggler d-lg-none" type="button"
			data-toggle="collapse" data-target="#collapsibleNavId"
			aria-controls="collapsibleNavId" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="navbar2 navbar-dark">
			<div class="row">
				<div class="item col-md-2">
					<a href="#"></a>�ӫ�
				</div>
				<div class="item col-md-2">
					<a href="#"></a>����
				</div>
				<div class="item col-md-2">
					<a href="#"></a>���
				</div>
				<div class="item col-md-2">
					<a href="#"></a>�Q�װ�
				</div>
				<div class="item col-md-2">
					<a href="#"></a>���Q
				</div>
				<div class="item col-md-2">
					<a href="#"></a>Q&A
				</div>
			</div>
		</div>

		<div class="collapse navbar-collapse" id="collapsibleNavId">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="#">�n�J</a></li>
				<li class="nav-item"><a class="nav-link" href="#">���U</a></li>
				<li class="nav-item"><a class="nav-link" href="#">�|������</a></li>
				<li class="nav-item"><a class="nav-link" href="#">�ڪ��̷R</a></li>
				<li class="nav-item"><a class="nav-link" href="#">�ʪ���</a></li>

			</ul>
		</div>


	</nav>
	<!-- navbar end -->
	<section class="blank0"></section>
	<!-- ���e -->
	<section class="blank1">
		<div class="container">
			<!-- 			<div class="row mb-1"> -->
			<!-- 				<table id="table-1"> -->
			<!-- 					<tr> -->
			<!-- 						<td> -->
			<!-- 							<h3>�Ҧ��ӫ~��� - listAllImmed.jsp</h3> -->
			<!-- 							<h4> -->
			<!-- 								<a -->
			<%-- 									href="<%=request.getContextPath()%>/front-end/immed/select_page.jsp"><img --%>
			<%-- 									src="<%=request.getContextPath()%>/front-end/immed/images/back1.gif" --%>
			<!-- 									width="100" height="32" border="0">�^����</a> -->
			<!-- 							</h4> -->
			<!-- 						</td> -->
			<!-- 					</tr> -->
			<!-- 				</table> -->
			<!-- 			</div> -->

			<!-- 			<div class="row"> -->
			<%-- 				���~��C --%>
			<%-- 				<c:if test="${not empty errorMsgs}"> --%>
			<!-- 					<font style="color: red">�Эץ��H�U���~:</font> -->
			<!-- 					<ul> -->
			<%-- 						<c:forEach var="message" items="${errorMsgs}"> --%>
			<%-- 							<li style="color: red">${message}</li> --%>
			<%-- 						</c:forEach> --%>
			<!-- 					</ul> -->
			<%-- 				</c:if> --%>
			<!-- 			</div> -->
			<div class="row mb-4">
				<%@ include file="../../files/page1.file"%>
			</div>

			<form method="post" action="<%=request.getContextPath()%>/immed/immed.do">
				<input type="text" name="immed_search"> <input
					type="hidden" name="action" value="findByImmedName"> <input
					type="submit" value="�j�M">
			</form>
			
			<div class="row mb-4">
				<c:forEach var="immedVO" items="${list}" begin="<%=pageIndex%>"
					end="<%=pageIndex+rowsPerPage-1%>">
					<div class="col-6 col-md-3">
						<div class="card mb-4 px-2 pt-2">
							<a
								href="<%=request.getContextPath()%>/immed/immed.do?action=getOne_For_Display&immed_id=${immedVO.immed_id}"
								title="${immedVO.immed_name}"><img
								src="<%=request.getContextPath()%>/immed/ImmedPicRead?ID=${immedVO.immed_id}"
								class="card-img-top" alt="..."></a>
							<div class="card-body">
								<a
									href="<%=request.getContextPath()%>/front-end/immed/immed.do?immed=${immedVO.immed_id}"
									title="${immedVO.immed_name}"><h5 class="card-title">${immedVO.immed_name}</h5></a>
								<p class="card-price">$${immedVO.immed_prc}</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="row">
				<%@ include file="../../files/page2.file"%>
			</div>
			<!-- 			<table id="table-1"> -->
			<!-- 				<tr> -->
			<!-- 					<td> -->
			<!-- 						<h3>�Ҧ��ӫ~��� - listAllImmed.jsp</h3> -->
			<!-- 						<h4> -->
			<!-- 							<a -->
			<%-- 								href="<%=request.getContextPath()%>/front-end/immed/select_page.jsp"><img --%>
			<%-- 								src="<%=request.getContextPath()%>/front-end/immed/images/back1.gif" --%>
			<!-- 								width="100" height="32" border="0">�^����</a> -->
			<!-- 						</h4> -->
			<!-- 					</td> -->
			<!-- 				</tr> -->
			<!-- 			</table> -->

			<%-- ���~��C --%>
			<%-- 			<c:if test="${not empty errorMsgs}"> --%>
			<!-- 				<font style="color: red">�Эץ��H�U���~:</font> -->
			<!-- 				<ul> -->
			<%-- 					<c:forEach var="message" items="${errorMsgs}"> --%>
			<%-- 						<li style="color: red">${message}</li> --%>
			<%-- 					</c:forEach> --%>
			<!-- 				</ul> -->
			<%-- 			</c:if> --%>

			<!-- 			<table id="table-2"> -->
			<!-- 				<tr> -->
			<!-- 					<th>�ӫ~�s��</th> -->
			<!-- 					<th>��a�s��</th> -->
			<!-- 					<th>�R�a�s��</th> -->
			<!-- 					<th>�ӫ~�����s��</th> -->
			<!-- 					<th>�ӫ~�W��</th> -->
			<!-- 					<th>�ӫ~�W�[�ɶ�</th> -->
			<!-- 					<th>�ӫ~����</th> -->
			<!-- 					<th>�ӫ~�Ϥ�</th> -->
			<!-- 					<th>�ӫ~�y�z</th> -->
			<!-- 					<th>�ӫ~��X���A</th> -->
			<!-- 					<th>�ӫ~�U�[���A</th> -->
			<!-- 					<th>�q��ɶ�</th> -->
			<!-- 					<th>�q�檬�A�s��</th> -->
			<!-- 					<th>����H�m�W</th> -->
			<!-- 					<th>����H�q��</th> -->
			<!-- 					<th>����H�a�}</th> -->
			<!-- 					<th>�ק�</th> -->
			<!-- 					<th>�R��</th> -->
			<!-- 				</tr> -->

			<%-- 							<%@ include file="../file/page1.file"%> --%>
			<%-- 				<c:forEach var="immedVO" items="${list}" begin="<%=pageIndex%>" --%>
			<%-- 					end="<%=pageIndex+rowsPerPage-1%>"> --%>
			<!-- 					<tr> -->
			<%-- 						<td>${immedVO.immed_id}</td> --%>
			<%-- 						<td>${immedVO.sale_id}</td> --%>
			<%-- 						<td>${immedVO.buy_id}</td> --%>
			<%-- 						<td>${immedVO.pt_id}</td> --%>
			<%-- 						<td><p class="immed_name">${immedVO.immed_name}</p></td> --%>
			<%-- 						<td><fmt:formatDate value="${immedVO.immed_start}" --%>
			<%-- 								pattern="yyyy-MM-dd HH:mm:ss" /></td> --%>
			<!-- 						<td>$${immedVO.immed_prc}</td> -->
			<!-- 						<td><img class="immed_pic" -->
			<%-- 							src="<%=request.getContextPath()%>/front-end/immed/ImmedPicRead?ID='${immedVO.immed_id}'"></td> --%>
			<%-- 						<td><p class="immed_desc">${immedVO.immed_desc}</p></td> --%>
			<%-- 						<td>${immedVO.immed_sold eq 1 ? "�w��X" : "����X"}</td> --%>
			<%-- 						<td>${immedVO.immed_down eq 1 ? "�w�U�[" : "���U�["}</td> --%>
			<%-- 						<td><fmt:formatDate value="${immedVO.ord_time}" --%>
			<%-- 								pattern="yyyy-MM-dd HH:mm:ss" /></td> --%>
			<%-- 						<td>${immedVO.ordstat_id}</td> --%>
			<%-- 						<td>${immedVO.rcpt_name}</td> --%>
			<%-- 						<td>${immedVO.rcpt_cell}</td> --%>
			<%-- 						<td><p class="rcpt_add">${immedVO.rcpt_add}</p></td> --%>
			<!-- 						<td> -->
			<!-- 							<FORM METHOD="post" -->
			<%-- 								ACTION="<%=request.getContextPath()%>/front-end/immed/immed.do" --%>
			<!-- 								style="margin-bottom: 0px;"> -->
			<!-- 								<input type="submit" value="�ק�"> <input type="hidden" -->
			<%-- 									name="immed_id" value="${immedVO.immed_id}"> <input --%>
			<!-- 									type="hidden" name="action" value="getOne_For_Update"> -->
			<!-- 							</FORM> -->
			<!-- 						</td> -->
			<!-- 						<td> -->
			<!-- 							<FORM METHOD="post" -->
			<%-- 								ACTION="<%=request.getContextPath()%>/front-end/immed/immed.do" --%>
			<!-- 								style="margin-bottom: 0px;"> -->
			<!-- 								<input type="submit" value="�R��"> <input type="hidden" -->
			<%-- 									name="immed_id" value="${immedVO.immed_id}"> <input --%>
			<!-- 									type="hidden" name="action" value="delete"> -->
			<!-- 							</FORM> -->
			<!-- 						</td> -->
			<!-- 					</tr> -->
			<%-- 				</c:forEach> --%>
			<!-- 			</table> -->
			<%-- 						<%@ include file="../file/page2.file"%> --%>
	</section>
	<!-- ���e ---end  -->


	<!-- footer -->
	<footer id="footer" class="pt-5 ">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-6 footer-list">
					<h5>
						�ֳt�s��
						</h4>
						<ul>
							<li><a class="footer-link" href="">S.F.G����</a></li>
							<li><a class="footer-link" href="">���U�|��</a></li>
							<li><a class="footer-link" href="">�ӫ�</a></li>
							<li><a class="footer-link" href="">����</a></li>
						</ul>
				</div>
				<div class="col-md-3 col-sm-6 footer-list">
					<h5 class="text-uppercase">�|������</h5>
					<ul>
						<li><a class="footer-link" href="">�v�а�</a></li>
						<li><a class="footer-link" href="">���ʰ�</a></li>
						<li><a class="footer-link" href="">�Q�װ�</a></li>
						<li><a class="footer-link" href="">��ѫ�</a></li>
					</ul>
				</div>
				<div class="col-md-3 col-sm-6 footer-list">
					<h5 class="text-uppercase">����ڭ�</h5>
					<ul>
						<li><a class="footer-link" href="">����S.F.G</a></li>
						<li><a class="footer-link" href="">�̷s����</a></li>
						<li><a class="footer-link" href="">���p�v�F��</a></li>
					</ul>
				</div>
				<div class="col-md-3 col-sm-6 footer-list">
					<h5 class="text-uppercase">�޳N�䴩</h5>
					<ul>
						<li><a class="footer-link" href="">�s��W��</a></li>
						<li><a class="footer-link" href="">���U&�䴩</a></li>
						<li><a class="footer-link" href="">�A�ȱ���</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="footer-end bg-dark mt-5 py-2">
			<p class="text-center">&copy; Copy right 2020</p>
		</div>
	</footer>

	<button id="chatBtn" class="bg-primary">
		<i class="fas fa-comments"></i>
	</button>


	<!-- �s��Bootstrap�һݭn��js -->
	<!-- jquery.min.js -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- popper.min.js -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<!-- bootstrap.min.js -->
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>

</body>
</html>