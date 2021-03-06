<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.productOrder.model.*"%>
<%@ page import="com.member.model.*" %>
<%@ page import="com.product.model.*" %>

<%
//     ProVO proVO = (ProVO)request.getAttribute("proVO");
	ProService ProSvc = new ProService();
	String p_id = request.getParameter("p_id");
	ProVO proVO = ProSvc.getOnePro(p_id);
	pageContext.setAttribute("proVO",proVO);
%>
<%= proVO==null%>
<jsp:useBean id="proSvc" scope="page" class="com.product.model.ProService" />
<jsp:useBean id="favpSvc" scope="page" class="com.favouriteProduct.model.FavpService" />
<jsp:useBean id="ptSvc" scope="page" class="com.productType.model.PtService" />
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>所有商品資料 - listAllPro.jsp</title>
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

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<style type="text/css" media="screen">
	div.container-fluid{
/*   border: 1px solid red; */
  height:750px;
  width:1500px;
}
div.row{
/*   border: 1px solid green; */
  height:100%;
}
div.col-6{
  border: 1px solid blue;
}

/* div.col-5, div.col-7{ */
/*   border: 1px solid orange; */
/* } */

div.p_img{
  border: 3px solid #D0D0D0;
  display:block;
  height:620px;
  width:550px;
  margin-left:30px;
  margin-top:69px;
  border-radius:10px
}

div.col-7{
  margin-botton:10px;
}
img.rounded{
	width:auto;
	height:auto;
	max-width:100%;
	max-height:100%;
	border-radius:10px;
	margin-top: 35px;
}

	.p_love{
/* 			border:1px solid yellow; */
			/*相對於.word的位置*/
			position: absolute;
			right: 80px;
			bottom: 10px;

			width: 50px;
			height: 50px;

			background-size: cover;
		}
		.p_car{
/* 			border:1px solid deeppink; */
			/*相對於.word的位置*/
			position: absolute;
			right: 20px;
			bottom: 10px;

			width: 50px;
			height: 50px;

			background-size: cover;
		}
		.img-icon {
			width: 90%;
			height: 90%;
			float: right;
			margin: 0 2px;
		}
		.img-icon:hover {
			cursor:pointer;
		}
		.p_price{
		color: #ff5353;
    	font-size: 1.5em;
		}
		button{
		width
		}
		body {
/* 			background-image: url('https://pixabay.com/get/51e3d34b4257b108f5d08460da293277113ddee4515973_1280.jpg'); */
			background-color: #216583;
		}
		
		front{
		font-family:Microsoft JhengHei;
		}
	
	</style>


</head>
<body>
<%@ include file="../../files/header.jsp" %>

<section class="blank0"></section>
<section class="blank1">
	<!-- sm 以上範圍，三欄均分 -->
<div>	
<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/front-end/index.jsp">首頁</a></li>
    <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/front-end/product/listAllProduct.jsp">商城</a></li>
    <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/front-end/product/listAllProductByPt.jsp?pt_id=${proVO.pt_id}">${ptSvc.getOneProductType(proVO.pt_id).typename}</a></li>
    <li class="breadcrumb-item active" aria-current="page"><%=proVO.getP_name()%></li>
  </ol>
</nav>
</div>

<div class="container-fluid" style="background-color:white">
  <div class="row" style="border-radius:10px">
    
    <div class="col-5">
     <div class="p_img">
     <img class="rounded" src="<%=request.getContextPath()%>/product/proPic.do?p_id=${proVO.p_id}">
     </div>
    </div>
    
    <div class="col-7">
      <div class="row"style="height:10%"><div class="col align-self-center"><div class="p_name"><font style="font-size:30px">${proVO.p_name}</font></div></div></div>
      
      <div class="row"style="height:10%">
        <div class="col-4 align-self-center"><div class="p_type"><a href="<%=request.getContextPath()%>/front-end/product/listAllProductByPt.jsp?pt_id=${proVO.pt_id}"><font style="font-size:20px">${ptSvc.getOneProductType(proVO.pt_id).typename}</font></a></div></div>
        <div class="col-8 align-self-center"></div>
        <HR width=850 SIZE=5 color="#D0D0D0">
      </div>
      
      <div class="row"style="height:60%">
        <div class="col"><div class="p_info"><pre><font style="font-size:24px;font-family:Microsoft JhengHei;">${proVO.p_info}</font></pre></div></div>
        
      </div>
      
      <div class="row"style="height:10%">
      <HR width=850 SIZE=5 color="#D0D0D0">
      	<div class="col-8 align-self-center"><div class="p_price">NT$<fmt:formatNumber pattern="#" value="${proVO.p_price}" /></div></div>
        <div class="col-4 align-self-center"><div class="p_stock">庫存:${proVO.p_stock}</div></div>
        <HR width=850 SIZE=5 color="#D0D0D0">
      </div>
      
      <div class="row"style="height:10%">
        <div class="col-4 align-self-center">
        	<div class="quantity">
				數量:
				<button id="minus" type="botton" class="btn btn-outline-dark" style="height:40px;width:40px;margin-bottom:6px"><i class="fas fa-minus"></i></button>
				<input type="text" class="quantity" name="quantity" value="1" style="width:100px; height:38px;margin-top:6px;text-align:center">
				<button id="plus" type="botton" class="btn btn-outline-dark" style="width:40px;height:40px;margin-bottom:6px"><i class="fas fa-plus"></i></button>
			</div>
		</div>
			
		<div class="col-4 align-self-center">
					<input type="hidden" id="p_id" name="p_id" value="${proVO.p_id}">
      				<input type="hidden" id="p_name" name="p_name" value="${proVO.p_name}">
      				<input type="hidden" id="quantity" name="quantity" class="quantity" value="1">
      				<input type="hidden" id="p_price" name="p_price" value="${proVO.p_price}">
      				<input type="hidden" id="p_stock" name="p_stock" value="${proVO.p_stock}">
      				<input type="hidden" id="action" name="action" value="ADD">	
      				<input type="hidden" id="url" name="url" value="<%=request.getServletPath()%>?<%=request.getQueryString()%>">
      				<botton id="car"type="botton" class="btn btn btn-success" style="w">加入購物車</botton>
		</div>
        <div class="col-4">
		
        <div class="love"><div class="p_love" > 
			<c:choose>
			<c:when test="${favpSvc.getOne(proVO.p_id, sessionScope.memberVO.mem_id).p_id eq null}">
			<img class="img-icon" alt="" src="<%=request.getContextPath()%>/front-end/product/images/icons/empty.png" id="${proVO.p_id}${sessionScope.memberVO.mem_id}" title="加入最愛">
			</c:when>
			<c:otherwise>
			<img class="img-icon" alt="" src="<%=request.getContextPath()%>/front-end/product/images/icons/full.png" id="${proVO.p_id}${sessionScope.memberVO.mem_id}" title="取消最愛">
			</c:otherwise>
			</c:choose>
			</div></div>
		</div>
      </div>
      
    </div>
    
  </div>
</div>
</section>
<%@ include file="../../files/footer.jsp" %>
    <!-- body 結束標籤之前，載入Bootstrap 的 JS 及其相依性安裝(jQuery、Popper) -->
    <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    
    <script>
    $('img.img-icon').click(function(){
    	var source = $(this).attr('src');
    	if (source.includes('empty')){
    		// empty 為 空心愛心圖案, 代表收藏文章功能, 按下後置換圖片, 並且以AJAX方式送出請求
    		if(${sessionScope.memberVO ne null}) {
    		var thisID = this.id;
    		var p_id = thisID.substring(0, 4);
    		var mem_id = thisID.substring(4, 11);
    		$(this).attr('src', '<%=request.getContextPath()%>/front-end/product/images/icons/full.png');
    		$(this).attr('title', '取消最愛');
    		$.ajax({
    			url: '<%=request.getContextPath()%>/favouriteProduct/favp.do',
    			type: 'POST',
    			data: {
    				p_id: p_id,
    				mem_id: mem_id,
    				action: 'insert2'
    			},
    			success: function(){
    				Swal.fire({
    					icon: 'info',
    					title: '加入成功',
    					showConfirmButton: false,
    					timer: 750
    				})
    			}
    		});
    		}else{
    			<%session.setAttribute("location", request.getRequestURI()+"?"+request.getQueryString());%>	
    			document.location.href = '<%=request.getContextPath()%>/front-end/member/login.jsp';
    		}
    	}
    	else if (source.includes('full')){
    		if(${sessionScope.memberVO ne null}) {
    		var thisID = this.id;
    		var p_id = thisID.substring(0, 4);
    		var mem_id = thisID.substring(4, 11);
    		$(this).attr('src', '<%=request.getContextPath()%>/front-end/product/images/icons/empty.png');
    		$(this).attr('title', '加入最愛');
    		$.ajax({
    			url: '<%=request.getContextPath()%>/favouriteProduct/favp.do',
    			type: 'POST',
    			data: {
    				p_id: p_id,
    				mem_id: mem_id,
    				action: 'delete2'
    			},
    			success: function(){
    				Swal.fire({
    					icon: 'info',
    					title: '已取消',
    					showConfirmButton: false,
    					timer: 750
    				})
    			}
    	});
    	}else{
    		<%session.setAttribute("location", request.getRequestURI()+"?"+request.getQueryString());%>	
    		document.location.href = '<%=request.getContextPath()%>/front-end/member/login.jsp';
    	}
    	}
    	});
    //加入購物車	
    $('#car').click(function(){
    	$.ajax({
    		url: '<%=request.getContextPath()%>/shopCart/Shopping.do',
    		type: 'POST',
    		data: {
    			p_id:$('#p_id').val(),
          		p_name:$('#p_name').val(),
          		quantity:$('#quantity').val(),
          		p_price:$('#p_price').val(),
          		p_stock:$('#p_stock').val(),
          		action:$('#action').val(),
          		url:$('url').val()
    		}
    	})
    	Swal.fire({
    				icon: 'info',
    				title: '加入'+$('#quantity').val()+'項商品',
    				showConfirmButton: false,
    				timer: 750
    			})
    });
    //控制加入數量
    $(document).ready(function() {
    	var quantity = 1;
    	var maxquantity = ${proVO.p_stock};
    	$("#minus").click(function(){
    		if(quantity > 1)
    			$("input.quantity").attr("value", --quantity);
    	})

    	$("#plus").click(function(){
    		if(maxquantity>quantity)
    			$("input.quantity").attr("value", ++quantity);
    	})

    });
    
    $("input.quantity").change(function() {
		quantity = $("input.quantity").val();
		if ($(this).val() > maxquantity) {
			quantity = 1;
			swal({
				text : "數量不夠"
			});
		} else {
			$(".input.quantity").attr("value", quantity);
		}
		$(".input.quantity").attr("value", quantity);

	})
	</script>

</body>
</html>