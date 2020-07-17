<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<div>
	<header class="navbar navbar-expand-md navbar-dark fixed-top">
		<a class="navbar-brand" href="#"> <span class="logo"><i
				class="fas fa-bomb"></i></span> <span class="logo2">S.F.G</span> <sub><span
				class="logo3">Dashboard</span></sub>
		</a>

		<div class="navbar-nav ml-auto  mr-4 mr-md-0">
			<c:if test="${sessionScope.admVO eq null }">
				<a class="nav-link login_color"
					href="<%=request.getContextPath()%>/back-end/login.jsp"> <i
					class="fas fa-user-cog"></i> <span class="ml-2">管理員登入</span>
				</a>
			</c:if>
			<c:if test="${sessionScope.admVO ne null }">
				<a class="nav-link login_color"
					href="<%=request.getContextPath()%>/back-end/login.jsp"> <i class="fas fa-user-circle"></i> <span class="ml-2">${sessionScope.admVO.adm_name}
						您好</span>
				</a>
				<a class="nav-link login_color"
					href="<%=request.getContextPath()%>/adm/login.do?action=logout">
					<i class="fas fa-user-cog"></i> <span class="ml-2">登出</span>
				</a>
			</c:if>
		</div>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
	</header>
</div>