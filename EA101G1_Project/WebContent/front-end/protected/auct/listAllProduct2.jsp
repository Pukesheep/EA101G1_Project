<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.product.model.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.shopCart.model.PRODUCT" %>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%	
    ProService proSvc = new ProService();
    List<ProVO> list = proSvc.getAllFront();
    session.setAttribute("keyWordlist",list);
    pageContext.setAttribute("list",list); 
%>

<jsp:useBean id="ptSvc" scope="page" class="com.productType.model.PtService" />
<jsp:useBean id="favpSvc" scope="page" class="com.favouriteProduct.model.FavpService" />
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>�Ҧ��ӫ~��� - listAllPro.jsp</title>
 <!-- TODO: ��title ��icon -->
    <link rel="icon shortcut" href="./img/ICON.ico">
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
/*     border: 1px solid #CCCCFF; */
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
  td>img{
  width:200px;
  }
  
  front{
		font-family:Microsoft JhengHei;
		font-family:"�L�n������";
		}
</style>

<style type="text/css" media="screen">
		 
		 body{
		 	/*�S�@��*/
		 	margin: 0;
		 }

		.card{
			position: relative;
			width: 750px;
			height: 200px;
			
			margin-bottom:5px;
		}
		.p_img{
			width: 200px;
/* 			border:1px solid blue; */
			position: absolute;
			height: 200px;

			background-size: cover;
			
		}
		.p_img>img{
			width: 90%;
			hieight:90%;
			
			 position:absolute;
			 left:5%;
			 top:5%;
		}
		.p_word{
/* 			border:1px solid red; */
			width: 68%;
			height: 100%;
			position:absolute;
			right: 10px;
		}
		.p_tital{
/* 			border:1px solid green; */
			/*�۹��.word����m*/
			position: absolute;
			top:10px;
			left: 0;
			/*���left width�]�n�� ���M�|�Y�X�h*/
			height: 30%;
			width: 100%;
		}
		.p_price{
/* 			border:1px solid yellow; */
			/*�۹��.word����m*/
			position: absolute;
			top:110px;
			left:0;
			/*���left width�]�n�� ���M�|�Y�X�h*/
			height:30%;
			width: 100%;
		}
		.p_love{
/* 			border:1px solid yellow; */
			/*�۹��.word����m*/
			position: absolute;
			right: 80px;
			bottom: 10px;

			width: 50px;
			height: 50px;

			background-size: cover;
		}
		.p_car{
/* 			border:1px solid deeppink; */
			/*�۹��.word����m*/
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
		front.p_name:hover {
			cursor:pointer;
			color:red;
		}
		
		a {
    	text-decoration:none;
			}
			
		section.blank1 div.container {
   			 background: hsla(0, 0%, 100%, .5);
			}
			
		font{
			color:white;
			}
		.p_amont>font{
			color: #ff5353;
			}
		.btn{
			height:100%;
			}		
	</style>

</head>
<body>
<!-- navbar -->
    <%@ include file="../../files/header.jsp" %>
    <!-- navbar end -->
    <section class="blank0"></section>
    
    <!-- ���e -->
    <section class="blank1">
    
<div class="container main">

<div class="row">
<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/front-end/index.jsp">����</a></li>
    <li class="breadcrumb-item active" aria-current="page">�ӫ�</li>
  </ol>
 </nav> 
</div>

<div class="row">
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="<%=request.getContextPath() %>/front-end/product/images/front1.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="<%=request.getContextPath() %>/front-end/product/images/front2.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="<%=request.getContextPath() %>/front-end/product/images/front3.jpg" class="d-block w-100" alt="...">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</div>

<div class="row">

<div class="ptlist" style="margin-top:10px;margin-right:60px;width:170px">

<div class="Now block" style="width:170px;height:170px;display: flex;background-color:#c6d4df;margin-bottom:4px;border-radius:10px">
	<div style="text-align:center; margin-top:70px;width:100%"><font style="font-weight:bold;font-size:20px;font-family:Microsoft JhengHei;">�����ӫ~</font></div>
	</div>
	
<div class="list-group">
	<div class="list-group-item active">
		<h4 class="list-group-item-heading">
			Switch
		</h4>
	</div>
	<a href="<%=request.getContextPath()%>/front-end/product/listAllProductByPt.jsp?pt_id=PT001" class="list-group-item">
		<h4 class="list-group-item-heading">
			Switch�D��
		</h4>
	</a>
	<a href="<%=request.getContextPath()%>/front-end/product/listAllProductByPt.jsp?pt_id=PT002" class="list-group-item">
		<h4 class="list-group-item-heading">
			Switch�C��
		</h4>
	</a>
	<a href="<%=request.getContextPath()%>/front-end/product/listAllProductByPt.jsp?pt_id=PT003" class="list-group-item">
		<h4 class="list-group-item-heading">
			Switch�P��
		</h4>
	</a>
	
</div>

<div class="list-group">
	<div class="list-group-item active">
		<h4 class="list-group-item-heading">
			PS4
		</h4>
	</div>
	<a href="<%=request.getContextPath()%>/front-end/product/listAllProductByPt.jsp?pt_id=PT004" class="list-group-item">
		<h4 class="list-group-item-heading">
			PS4�D��
		</h4>
	</a>
	<a href="<%=request.getContextPath()%>/front-end/product/listAllProductByPt.jsp?pt_id=PT005" class="list-group-item">
		<h4 class="list-group-item-heading">
			PS4�C��
		</h4>
	</a>
	<a href="<%=request.getContextPath()%>/front-end/product/listAllProductByPt.jsp?pt_id=PT006" class="list-group-item">
		<h4 class="list-group-item-heading">
			PS4�P��
		</h4>
	</a>
</div> 

<div class="list-group">
	<div class="list-group-item active">
		<h4 class="list-group-item-heading">
			XBOX
		</h4>
	</div>
	<a href="<%=request.getContextPath()%>/front-end/product/listAllProductByPt.jsp?pt_id=PT007" class="list-group-item">
		<h4 class="list-group-item-heading">
			XBOX�D��
		</h4>
	</a>
	<a href="<%=request.getContextPath()%>/front-end/product/listAllProductByPt.jsp?pt_id=PT008" class="list-group-item">
		<h4 class="list-group-item-heading">
			XBOX�C��
		</h4>
	</a>
	<a href="<%=request.getContextPath()%>/front-end/product/listAllProductByPt.jsp?pt_id=PT009" class="list-group-item">
		<h4 class="list-group-item-heading">
			XBOX�P��
		</h4>
	</a>
	
</div>

</div>

<div id="productShow" style="margin-top:10px">

</div>
</div>
</div>
</section>
<%@ include file="../../files/footer.jsp" %>
<br>

<script>
// �[�J�̷R
$('img.img-icon').click(function(){
	var source = $(this).attr('src');
	if (source.includes('empty')){
		// empty �� �Ť߷R�߹Ϯ�, �N���ä峹�\��, ���U��m���Ϥ�, �åB�HAJAX�覡�e�X�ШD
		if(${sessionScope.memberVO ne null}) {
		var thisID = this.id;
		var p_id = thisID.substring(0, 4);
		var mem_id = thisID.substring(4, 11);
		$(this).attr('src', '<%=request.getContextPath()%>/front-end/product/images/icons/full.png');
		$(this).attr('title', '�����̷R');
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
					icon: 'success',
					title: '�[�J���\',
					showConfirmButton: false,
					timer: 750
				})
			}
		});
		}else{
			<%
				session.setAttribute("location", request.getRequestURI()+"?"+request.getQueryString());
			%>
			Swal.fire({
				icon: 'info',
				title: '�еn�J�|��',
				showConfirmButton: false,
				timer: 1500
			})
			var timer = setTimeout(function(){
				document.location.href = '<%=request.getContextPath()%>/front-end/member/login.jsp';
			}, 1500);
				
			
		}
	}
	else if (source.includes('full')){
		if(${sessionScope.memberVO ne null}) {
		var thisID = this.id;
		var p_id = thisID.substring(0, 4);
		var mem_id = thisID.substring(4, 11);
		$(this).attr('src', '<%=request.getContextPath()%>/front-end/product/images/icons/empty.png');
		$(this).attr('title', '�[�J�̷R');
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
					icon: 'error',
					title: '�w����',
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
	
$('input.img-icon').click(function(){
	Swal.fire({
		icon: 'success',
		title: '�[�J���\',
		showConfirmButton: false,
		timer: 750
	})
	});
	
//�s���ܰӫ~
// $('front.p_name').click(function(){
// 	var index =$('front.p_name').index(this);
// 	console.log(index);
// $(".p_nameform").eq(index).submit()
// 	});
</script>



</body>
</html>