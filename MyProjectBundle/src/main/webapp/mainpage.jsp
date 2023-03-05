<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script type="text/javascript" src="./resources/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>MyProjectBundle</title>
</head>

<body>
	<%
	if(request.getParameter("language") != null) {
		session.setAttribute("language", request.getParameter("language"));	
	}
	if (session.getAttribute("language") == null)
		session.setAttribute("language", "ko");
	%>
	<fmt:setLocale value='<%=session.getAttribute("language")%>' />
	<%@ include file="./menu.jsp"%>
	<fmt:bundle basename="bundle.mainpage">

		<main>
			<div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-warning bg-opacity-75">
				<div class="col-md-5 p-lg-5 mx-auto my-5">
					<svg xmlns="http://www.w3.org/2000/svg" width="160" height="160" fill="currentColor" class="bi bi-folder-check" viewBox="0 0 16 16">
  					<path d="m.5 3 .04.87a1.99 1.99 0 0 0-.342 1.311l.637 7A2 2 0 0 0 2.826 14H9v-1H2.826a1 1 0 0 1-.995-.91l-.637-7A1 1 0 0 1 2.19 4h11.62a1 1 0 0 1 .996 1.09L14.54 8h1.005l.256-2.819A2 2 0 0 0 13.81 3H9.828a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 6.172 1H2.5a2 2 0 0 0-2 2zm5.672-1a1 1 0 0 1 .707.293L7.586 3H2.19c-.24 0-.47.042-.683.12L1.5 2.98a1 1 0 0 1 1-.98h3.672z" />
  					<path d="M15.854 10.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.707 0l-1.5-1.5a.5.5 0 0 1 .707-.708l1.146 1.147 2.646-2.647a.5.5 0 0 1 .708 0z" />
				</svg>
					<h1 class="display-4 fw-normal">
						<fmt:message key="introduce1" />
					</h1>
				</div>
			</div>

			<div class="d-md-flex flex-md-equal w-100 my-md-3 ps-md-3">
				<div class="text-bg-dark me-md-3 pt-3 px-3 pt-md-5 px-md-5 w-100 w-md-50 text-center overflow-hidden">
					<div class="py-3 mt-3 mb-3 mb-md-5">
						<h2 class="display-5">
							<fmt:message key="introduce2-1" />
						</h2>
					</div>
					<img src="./resources/images/page_component/github.png" width="90%" height="auto" class="rounded mx-auto my-0 my-md-5 d-block" alt="github">
				</div>
				<div class="bg-light me-md-3 pt-3 px-3 pt-md-5 px-md-5 w-100 w-md-50 text-center overflow-hidden">
					<div class="my-3 p-3">
						<h2 class="display-5">
							<fmt:message key="introduce2-2" />
						</h2>
					</div>
					<svg xmlns="http://www.w3.org/2000/svg" width="80%" height="80%" fill="currentColor" class="bi bi-images" viewBox="0 0 16 16">
  					<path d="M4.502 9a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z" />
  					<path d="M14.002 13a2 2 0 0 1-2 2h-10a2 2 0 0 1-2-2V5A2 2 0 0 1 2 3a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v8a2 2 0 0 1-1.998 2zM14 2H4a1 1 0 0 0-1 1h9.002a2 2 0 0 1 2 2v7A1 1 0 0 0 15 11V3a1 1 0 0 0-1-1zM2.002 4a1 1 0 0 0-1 1v8l2.646-2.354a.5.5 0 0 1 .63-.062l2.66 1.773 3.71-3.71a.5.5 0 0 1 .577-.094l1.777 1.947V5a1 1 0 0 0-1-1h-10z" />
				</svg>
				</div>
			</div>

			<div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-secondary bg-opacity-25">
				<div class="col-md-5 p-lg-5 mx-auto my-5">
					<h1 class="display-4 fw-normal">
						<fmt:message key="suggestion" />
					</h1>

					<%
					if ((String) session.getAttribute("memberId") == null) {
					%>
					<a class="btn btn-outline-secondary btn-lg mt-5" href="./member/addMember.jsp">
						<fmt:message key="signup" />
					</a>
					<%
					} else {
					%>
					<a class="btn btn-outline-secondary btn-lg mt-5" href="./project/projectList.jsp">
						<fmt:message key="allList" />
					</a>
					<%
					}
					%>
				</div>
			</div>

			<div class="position-relative overflow-hidden p-5 p-md-5 m-md-3 text-center bg-warning bg-opacity-25">
				<%!String greeting = "프로젝트 꾸러미";
	String tagline = "My Project Bundle!";%>
				<div class="my-5 text-warning">
					<h1 class="display-3"><%=greeting%></h1>
					<h3><%=tagline%></h3>
				</div>
				<svg xmlns="http://www.w3.org/2000/svg" width="160" height="160" fill="currentColor" class="bi bi-archive-fill" viewBox="0 0 16 16" style="color: orange;">
  				<path d="M12.643 15C13.979 15 15 13.845 15 12.5V5H1v7.5C1 13.845 2.021 15 3.357 15h9.286zM5.5 7h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1 0-1zM.8 1a.8.8 0 0 0-.8.8V3a.8.8 0 0 0 .8.8h14.4A.8.8 0 0 0 16 3V1.8a.8.8 0 0 0-.8-.8H.8z" />
			</svg>
			</div>
		</main>

		<%@ include file="./footer.jsp"%>
	</fmt:bundle>
</body>
</html>