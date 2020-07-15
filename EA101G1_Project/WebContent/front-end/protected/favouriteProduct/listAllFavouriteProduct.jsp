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
  #p_image>img{
  width:200px;
  }
   hr.class-1 { 
            border-top: 5px solid #8c8b8b; 
            width:2000;
        } 
    font{
		font-family:Microsoft JhengHei;
		}    
	.p_price{
			color: #ff5353;
    		font-size: 1.5em;
		}	 
</style>

</head>
<body bgcolor='white'>
<!-- navbar -->
    <%@ include file="../../../files/header.jsp" %>
    <!-- navbar end -->
    <section class="blank0"></section>
    
    <!-- 內容 -->
    <section class="blank1">
 <div class="container">

 <div class="row"><font style="color:#E0E0E0;font-size:40px"><%=memVO.getMem_name()%></font ><font style="font-size:40px">的最愛</font><hr class="class-1" /> </div>
 	 
 	 <%if (list != null && (list.size() > 0)) {%>
 	<%@ include file="pages/page1.file" %>
 	<c:forEach var="favpVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
 <div class="row justify-content mb-2  rounded" style="background-color:rgb(209, 209, 209,0.5);">
 	<div class="col-2 "></div>
 	<div class="col-3 align-self-center" id="p_image"><img src="<%=request.getContextPath()%>/product/proPic.do?p_id=${favpVO.p_id}"></div>
 	<div class="col-3 align-self-center"><a href="<%=request.getContextPath()%>/front-end/product/listOneProduct.jsp?p_id=${favpVO.p_id}"><font class="p_name" style="font-size:24px">${proSvc.getOnePro(favpVO.p_id).p_name}</font></a></div>
 	<div class="col-2 align-self-center"><div class="p_price">$${proSvc.getOnePro(favpVO.p_id).p_price}</div></div>
 	<div class="col-2 align-self-center">
 	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/favouriteProduct/favp.do" style="margin-bottom: 0px;">
		<input type="submit" class="btn btn-light" value="取消">
		<input type="hidden" name="p_id"  value="${favpVO.p_id}">
		<input type="hidden" name="mem_id"  value="${favpVO.mem_id}">
		<input type="hidden" name="action"	value="delete">
	</FORM>
 	</div>
 </div>
 </c:forEach>
<%@ include file="pages/page2B.file" %>
	<%}else{%>
	<div class="shopee-search-empty-result-section" style="text-align:center;"><img src="<%=request.getContextPath()%>/front-end/protected/favouriteProduct/images/wind.png" class="shopee-search-empty-result-section__icon"style="width:150px"><div class="shopee-search-empty-result-section__title" style="opacity: 0.5; font-size:20px">未收藏商品</div><div class="shopee-search-empty-result-section__hint" style="opacity: 0.5; font-size:20px;">拜託收藏加三連</div></div>
<%}%>   
 </div>

</section>
<%@ include file="../../../files/footer.jsp" %>
</body>
</html>