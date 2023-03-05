<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script type="text/javascript" src="./resources/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Page Error</title>
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
	<fmt:bundle basename="bundle.exceptionNoPage">

		<div class="jumbotron">
			<div class="container my-3 text-center">
				<h2 class="rounded-3 bg-danger bg-gradient px-3 py-5 text-white">
					<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-emoji-dizzy-fill" viewBox="0 0 16 16">
  					<path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zM4.146 5.146a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 1 1 .708.708l-.647.646.647.646a.5.5 0 1 1-.708.708L5.5 7.207l-.646.647a.5.5 0 1 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 0-.708zm5 0a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708.708l-.647.646.647.646a.5.5 0 0 1-.708.708l-.646-.647-.646.647a.5.5 0 1 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 0-.708zM8 13a2 2 0 1 1 0-4 2 2 0 0 1 0 4z" />
				</svg>
					<fmt:message key="errorcomment" />
					<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-emoji-dizzy-fill" viewBox="0 0 16 16">
  					<path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zM4.146 5.146a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 1 1 .708.708l-.647.646.647.646a.5.5 0 1 1-.708.708L5.5 7.207l-.646.647a.5.5 0 1 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 0-.708zm5 0a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708.708l-.647.646.647.646a.5.5 0 0 1-.708.708l-.646-.647-.646.647a.5.5 0 1 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 0-.708zM8 13a2 2 0 1 1 0-4 2 2 0 0 1 0 4z" />
				</svg>
				</h2>
			</div>
		</div>
		<div class="container">
			<p class="text-warning"><%=request.getRequestURL()%></p>
			<p>
				<a href="mainpage.jsp" class="btn btn-warning">
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height=20 " fill="currentColor" class="bi bi-sign-turn-right" viewBox="0 0 16 16">
  					<path d="M5 8.5A2.5 2.5 0 0 1 7.5 6H9V4.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L9.41 8.658A.25.25 0 0 1 9 8.466V7H7.5A1.5 1.5 0 0 0 6 8.5V11H5V8.5Z" />
  					<path fill-rule="evenodd" d="M6.95.435c.58-.58 1.52-.58 2.1 0l6.515 6.516c.58.58.58 1.519 0 2.098L9.05 15.565c-.58.58-1.519.58-2.098 0L.435 9.05a1.482 1.482 0 0 1 0-2.098L6.95.435Zm1.4.7a.495.495 0 0 0-.7 0L1.134 7.65a.495.495 0 0 0 0 .7l6.516 6.516a.495.495 0 0 0 .7 0l6.516-6.516a.495.495 0 0 0 0-.7L8.35 1.134Z" />
				</svg>
					<fmt:message key="mainpage" />
				</a>
			</p>
		</div>

		<%@ include file="./footer.jsp"%>
	</fmt:bundle>
</body>
</html>
