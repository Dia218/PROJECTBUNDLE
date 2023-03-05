<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:bundle basename="bundle.menu">
	<nav class="navbar navbar-expand-md navbar-dark bg-dark sticky-top px-3">
		<div class="container-fluid">
			<%
			if ((String) session.getAttribute("memberId") == null) {
			%>
			<a class="navbar-brand" href="http://localhost:8080/MyProjectBundle/mainpage.jsp">Home</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto">
					<li class="nav-item mx-2">
						<a class="nav-link" href="http://localhost:8080/MyProjectBundle/project/projectList.jsp">
							<fmt:message key="allList" />
						</a>
					</li>
				</ul>
				
				<ul class="navbar-nav mb-2 mb-md-0 ms-auto">
					<li class="nav-item mx-2">
						<a class="nav-link" href="http://localhost:8080/MyProjectBundle/member/addMember.jsp">
							<fmt:message key="signup" />
						</a>
					</li>
					<li class="nav-item">
						<div class="d-flex justify-content-end mt-4 mt-md-0">
							<button class="btn btn-outline-light" type="button" onclick="location.href = 'http://localhost:8080/MyProjectBundle/member/loginMember.jsp'">
								<fmt:message key="signin" />
							</button>
						</div>
					</li>
				</ul>
			</div>
			<%
			} else {
			%>
			<a class="navbar-brand" href="http://localhost:8080/MyProjectBundle/mainpage.jsp">Home</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto">
					<li class="nav-item mx-2">
						<a class="nav-link" href="http://localhost:8080/MyProjectBundle/project/projectList.jsp">
							<fmt:message key="allList" />
						</a>
					</li>
				</ul>
				<ul class="navbar-nav mb-2 mb-md-0">
					<li class="nav-item dropdown mx-2">
						<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<fmt:message key="menu" />
						</a>
						<ul class="dropdown-menu">
							<li>
								<a class="dropdown-item flex-lg-fill" href="http://localhost:8080/MyProjectBundle/project/projectList.jsp?developerId=<%=(String) session.getAttribute("memberId")%>">
									<fmt:message key="list" />
								</a>
							</li>
							<li>
								<a class="dropdown-item flex-lg-fill" href="http://localhost:8080/MyProjectBundle/project/addProject.jsp">
									<fmt:message key="add" />
								</a>
							</li>
						</ul>
					</li>
					<li class="nav-item">
						<div class="d-flex justify-content-end mt-4 mt-md-0">
							<button class="btn btn-outline-light" type="button" onclick="location.href = 'http://localhost:8080/MyProjectBundle/member/logoutMember.jsp'">
								<fmt:message key="signout" />
							</button>
						</div>
					</li>
				</ul>
			</div>
			<%
			}
			%>
		</div>
	</nav>
</fmt:bundle>