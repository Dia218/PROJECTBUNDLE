<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<script type="text/javascript" src="../resources/js/bootstrap.bundle.min.js"></script>
<title>sign in</title>
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
	<%@ include file="../menu.jsp"%>
	<fmt:bundle basename="bundle.login">

		<div class="container bg-warning bg-opacity-25 rounded-3 my-5 pt-5 d-flex flex-column align-items-center">
			<h1 class="display-3">
				<fmt:message key="signin" />
			</h1>

			<div class="col-md-4 col-md-offset-4 py-3">
				<%
				String error = request.getParameter("error");
				if (error != null) {
				%>
				<div class='alert alert-danger'>
					<fmt:message key="errorcheck" />
				</div>
				<%
				}
				%>
				<form class="form-signin" action="./processLoginMember.jsp" method="post">
					<div class="form-group my-3">
						<label for="inputUserName" class="sr-only">ID</label>
						<input type="text" class="form-control" placeholder="ID" name='id' required autofocus>
					</div>

					<div class="form-group my-3">
						<label for="inputPassword" class="sr-only">Password</label>
						<input type="password" class="form-control" placeholder="Password" name='password' required>
					</div>

					<button class="btn btn btn-lg btn-warning btn-block my-3" type="submit">
						<fmt:message key="signin" />
					</button>
				</form>
			</div>
		</div>

		<%@ include file="../footer.jsp"%>
	</fmt:bundle>
</body>
</html>