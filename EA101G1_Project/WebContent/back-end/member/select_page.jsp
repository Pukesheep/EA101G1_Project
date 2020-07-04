<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.member.model.*" %>

<jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService" />

<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <!-- Font-awesome CSS -->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.13.0/css/all.css">
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"> -->
    
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>

    <title>會員查詢</title>
	<!-- back-end.css -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/back-end.css">
	
	<!-- SweetAlert2 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	
	<!-- member.css -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member.css">	
	
	
</head>

<body>

    <header class="navbar navbar-expand-lg navbar-light bd-navbar">
        <a class="navbar-brand " href="#"><img src="<%=request.getContextPath()%>/images/ICON.ico" alt=""></a>
        <div> 遊戲買賣平台 後台管理 </div>
        <button class="navbar-toggler ml-auto" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <!-- <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 30 30" width="30" height="30" focusable="false"
                role="img">
                <title>Menu</title>
                <path stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-miterlimit="10"
                    d="M4 7h22M4 15h22M4 23h22"></path>
            </svg> -->
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse ">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">
                        <i class="fal fa-people-arrows"></i>
                        Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" href="#">Disabled</a>
                </li>
            </ul>
        </div>

    </header>
    <!-- <nav class="navbar navbar-expand-md navbar-light bg-light">
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
      
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled" href="#">Disabled</a>
            </li>
          </ul>
          <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
          </form>
        </div>
      </nav> -->

    <!-- <nav class="nav">
        <a class="nav-link active" href="#">Active</a>
        <a class="nav-link" href="#">Link</a>
        <a class="nav-link" href="#">Link</a>
        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
    </nav> -->

    <div class="container-fluid main">
        <div class="row">
            <div class=" col-lg-2  col-xl-2 px-0 ">
                <div class="collapse navbar-collapse side-nav accordion" id="navbarSupportedContent">
                    <ul class="navbar-nav ">
                        <li class="nav-item">
                            <div class="nav-link active" data-toggle="collapse" data-target="#sideNavColl01">
                                <i class="fas fa-user-edit ml-3 mr-"></i> 會員管理</div>
                            <ul class="nav collapse" id="sideNavColl01" data-parent="#navbarSupportedContent">
                                <li class="nav-item">
                                    <a class="nav-link active pl-4" href="#">會員權限管理</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link pl-4" href="<%=request.getContextPath()%>/back-end/member/select_page.jsp">會員資料管理</a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <div class="nav-link" data-toggle="collapse" data-target="#sideNavColl02">
                                <i class=" fas fa-home-alt ml-3 mr-2"></i>商城管理</div>
                            <ul class="nav collapse" id="sideNavColl02" data-parent="#navbarSupportedContent">
                                <li class="nav-item ">
                                    <a class="nav-link pl-4" href="#">商品上下架</a>
                                </li>
                                <li class="nav-item ">
                                    <a class="nav-link  pl-4" href="#">商成訂單管理</a>
                                </li>
                                <li class="nav-item ">
                                    <a class="nav-link  pl-4" href="#">限時專案管理</a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item ">
                            <div class="nav-link" data-toggle="collapse" data-target="#sideNavColl03">
                                <i class="fas fa-gift ml-3 mr-2"></i>紅利商城管理</div>
                            <ul class="nav collapse " id="sideNavColl03" data-parent="#navbarSupportedContent">
                                <li class="nav-item">
                                    <a class="nav-link active pl-4" href="#">紅利商品上下架</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link pl-4" href="#">紅利商品訂單管理</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link pl-4" href="#">紅利商品商品管理</a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item ">
                            <div class="nav-link" data-toggle="collapse" data-target="#sideNavColl04">
                                <i class="fas fa-users-class  ml-3 mr-2"></i>團購管理</div>
                            <ul class="nav collapse pt-2" id="sideNavColl04" data-parent="#navbarSupportedContent">
                                <li class="nav-item">
                                    <a class="nav-link pl-4" href="#">團購訂單管理</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link pl-4" href="#">團購商品管理</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link pl-4" href="#">團購商品上下架</a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item ">
                            <div class="nav-link" data-toggle="collapse" data-target="#sideNavColl05">
                                <i class="fas fa-hand-pointer ml-3 mr-2"></i>交易區管理</div>
                            <ul class="nav collapse" id="sideNavColl05" data-parent="#navbarSupportedContent">
                                <li class="nav-item">
                                    <a class="nav-link pl-4" href="#">交易管理</a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item ">
                            <div class="nav-link" data-toggle="collapse" data-target="#sideNavColl06">
                                <i class="fas fa-exclamation-triangle ml-3 mr-2"></i>檢舉管理</div>
                            <ul class="nav collapse" id="sideNavColl06" data-parent="#navbarSupportedContent">
                                <li class="nav-item">
                                    <a class="nav-link active pl-4" href="#">商品檢舉管理</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link pl-4" href="#">會員檢舉管理</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link pl-4" href="#">文章檢舉管理</a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item ">
                            <div class="nav-link" data-toggle="collapse" data-target="#sideNavColl07">
                                <i class="far fa-envelope-open-text ml-3 mr-2"></i>客服中心</div>
                                <ul class="nav collapse" id="sideNavColl07" data-parent="#navbarSupportedContent">
                                    <li class="nav-item">
                                        <a class="nav-link active pl-4" href="#">客服訊息管理</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link pl-4" href="#">Q&A管理</a>
                                    </li>
                                </ul>
                        </li>
                        <li class="nav-item ">
                            <div class="nav-link" data-toggle="collapse" data-target="#sideNavColl08">
                                <i class="fas fa-address-card ml-3 mr-2"></i>員工管理</div>
                                <ul class="nav collapse" id="sideNavColl08" data-parent="#navbarSupportedContent">
                                    <li class="nav-item">
                                        <a class="nav-link active pl-4" href="#">員工帳號管理</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link pl-4" href="#">員工權限管理</a>
                                    </li>
                                </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-10 col-xl-10 px-0">
            	<div class="mask">
            		
            		
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
		<div class="col-8">
		<div class="card text-white back-end-form">
				<div class="card-body">
					<h2 class="card-title">會員查詢</h2>
					<form action="<%=request.getContextPath()%>/member/member.do" method="post">
						<div class="input-group mb-3">
							<input type="text" class="form-control" name="mem_id" id="inlineFormInputGroup" placeholder="請輸入會員編號 ex: M000001">
							<div class="input-group-append">
								<input type="hidden" name="action" value="getOne_For_Display-back">
								<button class="btn btn-outline-warning" type="submit">單筆查詢</button>
							</div>
						</div>
					</form>

					<form action="<%=request.getContextPath()%>/member/member.do" method="post">
						<div class="input-group mb-3">
							<select class="custom-select" id="mem_idQuery" name="mem_id">
								<c:forEach var="memberVO" items="${memberSvc.all}">
									<option value="${memberVO.mem_id}">${memberVO.mem_id}</option>
								</c:forEach>
							</select>
							<div class="input-group-append">
								<input type="hidden" name="action" value="getOne_For_Display-back">
								<button class="btn btn-outline-warning" type="submit">單筆查詢</button>
							</div>
						</div>
					</form>				
				<br>
				
					<form action="<%=request.getContextPath()%>/member/member.do" method="post">
					
						<div class="form-group">
<!-- 							<label for="mem_id">會員編號</label> -->
							<input type="text" class="form-control" id="mem_id" name="mem_id" placeholder="請輸入會員編號 ex: M000001" autocomplete="off">
						</div>
						
						<div class="form-group">
<!-- 							<label for="mem_name">會員名稱</label> -->
							<input type="text" class="form-control" id="mem_name" name="mem_name" placeholder="請輸入會員名稱 ex: 早餐店大冰奶" autocomplete="off">
						</div>
						
						<div class="form-group">
<!-- 							<label for="mem_email">會員信箱</label> -->
							<input type="text" class="form-control" id="mem_email" name="mem_email" placeholder="請輸入會員信箱 ex: servereDiarrhea@gmail.com" autocomplete="off">
							
							<label for="mem_autho">會員權限</label>
							<div class="input-group mb-3">
								<select class="custom-select" id="mem_autho" name="mem_autho">
									<option></option>
									<option value="0">停權會員</option>
									<option value="1">一般會員</option>
									<option value="2">賣家資格會員</option>
									<option value="99">平台管理員</option>
								</select>
							</div>	
						</div>
						<input type="hidden" name="action" value="listMembers_ByCompositeQuery">
						<button type="submit" class="btn btn-outline-warning float-right">複合查詢</button>
						
					</form>

				</div>
		</div>
</div>
		

		
		
		
		

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    <%-- 內容 --%>   
        
            		
            		
            		
            		
            		
            		
            		
            		
            		
            		
            		
            		
            		
            		
            		
            		
            		
            		
            		
            		
            		
            		</div>
            		</div>
            		
            	</div>
            </div>
        </div>

        
        
        
        
        
        
        
        
        
        
    </div>
    

</body>

</html></html>