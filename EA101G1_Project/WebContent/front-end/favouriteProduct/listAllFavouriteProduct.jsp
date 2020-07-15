<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.product.model.*"%>
<%@ page import="com.favouriteProduct.model.*"%>
<%@ page import="com.member.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    FavpService favpSvc = new FavpService();
    MemberVO memVO = (MemberVO) session.getAttribute("memberVO");
    String mem_id = memVO.getMem_id();
    List<FavpVO> list = favpSvc.getProductByMem(mem_id);
    pageContext.setAttribute("list",list);
%>
<%=memVO==null %>
<%=memVO.getMem_id() %>
<jsp:useBean id="proSvc" scope="page" class="com.product.model.ProService" />
<jsp:useBean id="ptSvc" scope="page" class="com.productType.model.PtService" />

<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>最愛商品 </title>
 <!-- TODO: 換title 的icon -->
    <link rel="icon shortcut" href="./img/ICON.ico">
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
<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 800px;
	background-color: white;
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
  td>img{
  width:200px;
  }
</style>

</head>
<body bgcolor='white'>
<!-- navbar -->
    <%@ include file="../../files/header.jsp" %>
    <!-- navbar end -->
    <section class="blank0"></section>
    
    <!-- 內容 -->
    <section class="blank1">
    
<table id="table-1">
	<tr><td>
		 <h3>最愛商品</h3>
		 <h4><a href="<%=request.getContextPath()%>/front-end/favouriteproduct/select_page.jsp"><img src="<%=request.getContextPath()%>/images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>


<table>
	<tr>
		<th>商品名稱</th>
		<th>商品價格</th>
		<th>商品圖片</th>
		<th>修改</th>
	</tr>
	<%@ include file="../../files/page1.file" %> 
	<c:forEach var="favpVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
	
		<tr>
			<td>${proSvc.getOnePro(favpVO.p_id).p_name}</td>
			<td>${proSvc.getOnePro(favpVO.p_id).p_price}</td>
			<td><img src="<%=request.getContextPath()%>/product/proPic.do?p_id=${favpVO.p_id}"></td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/favouriteProduct/favp.do" style="margin-bottom: 0px;">
			     <input type="submit" value="取消">
			     <input type="hidden" name="p_id"  value="${favpVO.p_id}">
			     <input type="hidden" name="mem_id"  value="${favpVO.mem_id}">
			     <input type="hidden" name="action"	value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="../../files/page2.file" %>
</section>
</body>
</html>