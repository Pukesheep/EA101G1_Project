<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.member.model.*" %>

<jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService" />

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/back-end/css/bootstrap.min.css">
    <!-- Include Favicon ico-->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/back-end/css/ICON.ico">
    <!-- Font-awesome CSS -->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.13.0/css/all.css">
    <!--GoogleFont-->
    <link href="https://fonts.googleapis.com/css2?family=Sedgwick+Ave+Display&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lakki+Reddy&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap" rel="stylesheet">
    <!-- Include style.css-->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/back-end/css/style.css">
    
     <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
        integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
        integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
        crossorigin="anonymous"></script>   
    
    <title>會員查詢</title>
	
	<!-- SweetAlert2 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	
	<!-- member.css -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member.css">	
</head>

<body>
<!-- header -->
    <header class="navbar navbar-expand-md navbar-dark fixed-top">
        <a class="navbar-brand" href="#">
            <span class="logo"><i class="fas fa-bomb"></i></span>
            <span class="logo2">S.F.G</span>
            <sub><span class="logo3">Dashboard</span></sub>
        </a>

        <div class="navbar-nav ml-auto  mr-4 mr-md-0">
            <a class="nav-link login_color" href="login.html">
                <i class="fas fa-user-cog"></i> <span class="ml-2">管理員登入</span> 
            </a>
        </div>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    </header>
<!-- header -->

    <div class="content d-md-flex">

<!-- aside -->
        <aside class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ">
                <li class="nav-item">
                    <div class="nav-link" data-toggle="collapse" data-target="#sideNavColl01">
                        <i class="fas fa-user-edit ml-3"></i> 會員管理</div>
                    <ul class="collapse navbar-nav" id="sideNavColl01" data-parent="#navbarNav">
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="#">會員權限管理</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="#">會員資料管理</a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <div class="nav-link" data-toggle="collapse" data-target="#sideNavColl02">
                        <i class="fas fa-home-alt ml-3 mr-2"></i>商城管理</div>
                    <ul class="collapse navbar-nav" id="sideNavColl02" data-parent="#navbarNav">
                        <li class="nav-item ">
                            <a class="nav-link pl-4" href="#">商品上下架</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link pl-4" href="#">商成訂單管理</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link pl-4" href="#">限時專案管理</a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item ">
                    <div class="nav-link" data-toggle="collapse" data-target="#sideNavColl03">
                        <i class="fas fa-gift ml-3 mr-2"></i>紅利商城管理</div>
                    <ul class="collapse navbar-nav" id="sideNavColl03" data-parent="#navbarNav">
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="#">紅利商品上下架</a>
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
                        <i class="fas fa-users-class  ml-3 mr-1"></i>團購管理</div>
                    <ul class="collapse navbar-nav pt-2" id="sideNavColl04" data-parent="#navbarNav">
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
                    <ul class="collapse navbar-nav" id="sideNavColl05" data-parent="#navbarNav">
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="#">交易管理</a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item ">
                    <div class="nav-link" data-toggle="collapse" data-target="#sideNavColl06">
                        <i class="fas fa-exclamation-triangle ml-3 mr-1"></i>檢舉管理</div>
                    <ul class="collapse navbar-nav" id="sideNavColl06" data-parent="#navbarNav">
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="#">商品檢舉管理</a>
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
                    <ul class="collapse navbar-nav" id="sideNavColl07" data-parent="#navbarNav">
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="#">客服訊息管理</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="#">Q&A管理</a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item ">
                    <div class="nav-link" data-toggle="collapse" data-target="#sideNavColl08">
                        <i class="fas fa-address-card ml-3 mr-2"></i>員工管理</div>
                    <ul class="collapse navbar-nav" id="sideNavColl08" data-parent="#navbarNav">
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="#">員工帳號管理</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="#">員工權限管理</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </aside>
<!-- aside -->

        <main>

            <div class="container-fluid">
                <div class="row">
                
<!--                     <div class="col"> Lorem ipsum dolor sit amet consectetur adipisicing elit. Exercitationem quia amet illum quidem praesentium omnis molestias voluptatum vero sapiente, maiores inventore? Enim ipsum fugiat impedit, labore eum reiciendis nostrum, facere nulla expedita iure dolorum in voluptatibus. Eius excepturi qui necessitatibus aliquam, quidem odio assumenda laboriosam nemo architecto voluptatum ut facilis blanditiis nisi natus similique quo pariatur, reprehenderit voluptatibus! Unde voluptates architecto aut at magnam nam exercitationem libero perferendis pariatur. Eaque distinctio dolores tenetur numquam odio, molestias nihil sapiente? Praesentium molestiae ad corrupti est repudiandae officiis vel pariatur exercitationem temporibus minima aut facere voluptate, consectetur ullam aspernatur quisquam deserunt, labore ex earum? Ut distinctio voluptas nisi harum. Distinctio nostrum doloremque, expedita possimus veniam itaque minus ipsa! Fugit eius quam repellat, quis possimus voluptas atque officia cumque quasi delectus omnis, illum dolor minima aspernatur optio iste molestiae consequatur inventore. Laborum at ducimus provident illo iusto qui perspiciatis libero aliquid, dicta, porro quo error aperiam officiis iure pariatur quas soluta eum! Nulla nobis corrupti, odio harum quis culpa aspernatur sint eius eligendi, incidunt laudantium excepturi. Nesciunt impedit atque suscipit. Libero voluptatibus animi, numquam quasi illum id aliquam quos sequi quod velit hic. Accusamus accusantium dolorem similique corporis sapiente iusto minus fuga. Molestias natus distinctio, vitae doloribus autem quod eius corporis voluptate quia veritatis aperiam modi, expedita voluptatibus ab quisquam nobis consequuntur cupiditate earum dolorum voluptates qui! Voluptas repudiandae earum ratione repellat quos explicabo doloremque dolor tempora illum molestiae magnam consequatur reiciendis ipsa amet, magni similique perspiciatis odit corporis expedita. Similique quod saepe optio aperiam consequuntur rerum corporis quae enim, dolorem quia necessitatibus molestias cupiditate porro animi nobis accusantium commodi magni debitis facilis, aspernatur, fuga laboriosam itaque quos. Similique explicabo asperiores, quasi omnis aliquid, iste sequi delectus aut facilis perspiciatis ea, odit nam repellendus esse quae illo hic harum magnam cum quam error culpa adipisci debitis. Iusto eveniet pariatur iste, nostrum nobis sint natus nulla et enim deserunt sapiente, blanditiis in delectus. Maiores aliquid praesentium molestiae atque eum! Aliquam voluptatum cupiditate maxime qui et optio sed sapiente, in nesciunt nam hic incidunt! Quasi quod nostrum aliquam minus, at dolore aut ea asperiores, consequuntur voluptas debitis beatae quidem. Voluptatem velit nihil illo obcaecati quis. Reprehenderit cumque quo quis, quas quam minus libero corporis debitis veniam consectetur odit laudantium dolorum sit fuga magni officia est esse, expedita in ipsam iusto. Iste quibusdam minima in architecto a? Voluptatum neque quas at eveniet, cupiditate ratione eum omnis aperiam similique consectetur quisquam labore vitae necessitatibus maiores, molestiae, est itaque! Fuga, at molestias, quis, magnam perferendis expedita voluptas velit inventore deserunt a quae repellendus numquam libero reprehenderit nisi impedit dicta quo aliquid. Ipsa facere molestias rerum nesciunt quam velit, libero porro, sint ratione quisquam, quaerat voluptates ad. Perferendis fuga inventore eveniet asperiores vel! Autem molestiae temporibus excepturi ullam, provident sunt aspernatur quis esse delectus non amet. Deserunt, minima voluptatibus fuga ea dignissimos dicta iusto tempora quisquam est officiis magni, iure hic asperiores. Tempore quaerat id ducimus doloremque quidem facere ut maiores voluptatum ad, facilis dignissimos non nihil magni veniam aut sed iste laboriosam quae nobis a voluptatem fugit rerum! Natus tenetur modi corrupti autem cum, unde vitae quas cupiditate nostrum placeat nemo aut ratione dolorum nesciunt! Aperiam cumque, aliquid dolores accusantium sunt nobis sed maiores, temporibus omnis velit quidem odit id quisquam eaque libero iste aut vel. Earum accusamus tempore blanditiis dolorem recusandae aliquid mollitia ipsam id omnis beatae quo atque voluptates consectetur ullam, voluptas eos cumque neque consequatur ipsum suscipit? Sit perferendis dolore alias? Delectus provident, rerum magnam ab rem obcaecati eius vitae illo sed soluta vero fugit, natus eligendi cum expedita error est itaque veniam enim cumque voluptatem necessitatibus amet aperiam! Dolore quaerat praesentium recusandae temporibus suscipit repudiandae soluta a beatae quis at reiciendis magnam consectetur nisi est incidunt impedit, vitae hic cumque nesciunt debitis tempora, autem et accusantium. Molestiae at quisquam minus, accusamus exercitationem nobis assumenda illum corporis distinctio veniam temporibus qui? Optio dolorum pariatur, accusantium consectetur quo delectus possimus porro culpa itaque similique, maiores at commodi ullam nam nostrum magni impedit ducimus recusandae omnis atque. Neque quibusdam, culpa blanditiis natus perferendis et voluptate ducimus quia officiis velit deleniti a porro. Blanditiis vitae assumenda quas quaerat? Facere eum nisi sed labore repellat adipisci ut recusandae architecto assumenda, error dicta minima blanditiis iure maxime eligendi quidem obcaecati praesentium sint ipsum quisquam unde? Eligendi, ullam ex. Aut optio deserunt commodi doloremque recusandae? Sit sed rerum sint impedit nobis. Nisi neque animi dolorum ipsa est inventore perspiciatis! Et placeat, quo sit libero omnis sunt, exercitationem facere aut saepe sequi debitis deserunt iure similique nulla modi aliquid at fuga sint pariatur illo alias corporis quos numquam enim! Obcaecati perferendis sint enim provident cupiditate hic est labore natus repellat ullam aliquid dolorem odit cumque nihil atque, nobis quos. Nihil vitae enim repellat harum incidunt explicabo architecto distinctio minima doloribus! Magnam modi autem maxime, dolore perspiciatis quisquam dolores ducimus repellat quo, vitae rerum fugit. Ad, hic itaque! Corporis consequatur tempore dolores ea nisi distinctio sequi architecto voluptate ab soluta ut velit neque, facere consectetur quos accusantium, ratione odio aspernatur vero mollitia quod eius. Ut eius deserunt a totam laboriosam nisi soluta dolores non voluptas ex explicabo consequuntur, asperiores adipisci accusamus animi sed itaque dolore tenetur qui! Quae, tenetur ab veniam id voluptas doloremque enim eius! Corrupti at nihil harum sequi iste quibusdam molestiae, voluptatibus sit repellat earum quidem distinctio quam neque beatae facilis dolor laboriosam illum nisi unde voluptas officia deserunt pariatur omnis aut? Nisi ab laborum harum reiciendis minima molestiae at odit alias illo consectetur in porro quaerat ut perspiciatis vero ducimus placeat, quae minus enim quasi necessitatibus impedit pariatur. At odit, aperiam sequi voluptatum fugiat fuga accusantium velit, deleniti maiores, ullam possimus magnam. Eveniet voluptates impedit eum adipisci veniam natus, sunt ipsum aliquid ea officia saepe repellat, facere, veritatis nihil! Architecto, repudiandae voluptatum cupiditate culpa numquam optio repellat consectetur tenetur placeat iusto ut dicta voluptatem fugit voluptates facilis id. Vero nobis, tempora eius quia itaque totam placeat eligendi fugiat at obcaecati, sint harum sapiente labore, ducimus iste velit dolorem est doloremque? </div> -->
<!--                     <div class="col"> Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eius aperiam voluptatem, voluptates nisi praesentium amet eaque earum culpa sint quam in, enim itaque placeat? Sapiente obcaecati eum nam nobis esse architecto explicabo sit sint, delectus impedit iste possimus harum voluptas ratione iusto enim quia, recusandae aperiam! Eveniet ex magni officia facilis? Ut totam accusamus ducimus ex, corporis dolores atque aliquid incidunt impedit, perspiciatis odio eligendi debitis, natus maiores ipsam? Consequuntur perferendis nobis, in hic nulla quidem magni officiis neque voluptatibus eos suscipit officia ex aliquam possimus quos accusantium est voluptas alias, voluptatum laboriosam tempora voluptates eum. Consequuntur quasi autem sapiente? </div> -->
               		
               		
               		
               		
                </div>
                        	<div class="container-fluid">
	<div class="row justify-content-center">
		<div class="col">
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
							<input type="text" class="form-control" id="mem_id" name="mem_id" placeholder="請輸入會員編號 ex: M000001" autocomplete="off">
						</div>
						
						<div class="form-group">
							<input type="text" class="form-control" id="mem_name" name="mem_name" placeholder="請輸入會員名稱 ex: 早餐店大冰奶" autocomplete="off">
						</div>
						
						<div class="form-group">
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
	</div>
</div>   
            </div>
        	<div class="container-fluid">
	<div class="row justify-content-center">
		<div class="col">
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
							<input type="text" class="form-control" id="mem_id" name="mem_id" placeholder="請輸入會員編號 ex: M000001" autocomplete="off">
						</div>
						
						<div class="form-group">
							<input type="text" class="form-control" id="mem_name" name="mem_name" placeholder="請輸入會員名稱 ex: 早餐店大冰奶" autocomplete="off">
						</div>
						
						<div class="form-group">
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
	</div>
</div>   
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


</c:if>
<%-- 錯誤表列 --%> 

<div class="container">
	<div class="row justify-content-center">
		<div class="col">
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
							<input type="text" class="form-control" id="mem_id" name="mem_id" placeholder="請輸入會員編號 ex: M000001" autocomplete="off">
						</div>
						
						<div class="form-group">
							<input type="text" class="form-control" id="mem_name" name="mem_name" placeholder="請輸入會員名稱 ex: 早餐店大冰奶" autocomplete="off">
						</div>
						
						<div class="form-group">
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
	</div>
</div>   
    
<%-- 內容 --%>   



            
        </main>
    </div>


</body>

</html>