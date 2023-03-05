<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<script type="text/javascript" src="../resources/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Sign Up</title>

<style>
.bi {
	vertical-align: -.125em;
	fill: #fd7e14;
}

.duplecheck-custom {
	display: none;
	width: 100%;
	margin-top: 0.25rem;
	font-size: 0.875em;
	color: #dc3545;
}

.feedback-custom {
	display: block;
	width: 100%;
	margin-top: 0.25rem;
	font-size: 0.875em;
	color: #dc3545;
}

.feedback-normal {
	display: block;
	width: 100%;
	margin-top: 0.25rem;
	font-size: 0.875em;
	color: #adb5bd;
}

.custom-invalid {
	border-color: #dc3545;
	padding-right: calc(1.5em + 0.75rem);
	background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 12 12' width='12' height='12' fill='none' stroke='%23dc3545'%3e%3ccircle cx='6' cy='6' r='4.5'/%3e%3cpath stroke-linejoin='round' d='M5.8 3.6h.4L6 6.5z'/%3e%3ccircle cx='6' cy='8.2' r='.6' fill='%23dc3545' stroke='none'/%3e%3c/svg%3e");
	background-repeat: no-repeat;
	background-position: right calc(0.375em + 0.1875rem) center;
	background-size: calc(0.75em + 0.375rem) calc(0.75em + 0.375rem);
}

.custom-valid {
	border-color: #198754;
	padding-right: calc(1.5em + 0.75rem);
	background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 8 8'%3e%3cpath fill='%23198754' d='M2.3 6.73.6 4.53c-.4-1.04.46-1.4 1.1-.8l1.1 1.4 3.4-3.8c.6-.63 1.6-.27 1.2.7l-4 4.6c-.43.5-.8.4-1.1.1z'/%3e%3c/svg%3e");
	background-repeat: no-repeat;
	background-position: right calc(0.375em + 0.1875rem) center;
	background-size: calc(0.75em + 0.375rem) calc(0.75em + 0.375rem);
}
</style>
</head>

<body class="bg-light">
	<%
	if (request.getParameter("language") != null) {
		session.setAttribute("language", request.getParameter("language"));
	}
	if (session.getAttribute("language") == null)
		session.setAttribute("language", "ko");
	%>
	<fmt:setLocale value='<%=session.getAttribute("language")%>' />
	<%@ include file="../menu.jsp"%>
	<fmt:bundle basename="bundle.signup">

		<div class="container">
			<main>

				<!-- 제목 -->
				<div class="py-5 text-center">
					<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
  					<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
  					<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
				</svg>
					<h2 class="text-warning mt-3"><fmt:message key="signup" /></h2>
				</div>

				<!-- 폼 -->
				<div class="row g-5">
					<form class="signup-form" name="signup" action="./processAddMember.jsp" method="post" novalidate>
						<h5 class="text-warning">&#42;<fmt:message key="essential" /></h5>
						<hr class="my-3 text-warning">

						<div class="row g-3">
							<div class="col-sm-6">
								<label for="name" class="form-label">&#42;<fmt:message key="name" /></label>
								<input type="text" name="name" class="form-control custom-invalid invalid-name" id="name" placeholder="name" value="" required>
								<div class="feedback-custom invalid-name"><fmt:message key="nameValid" /></div>
							</div>

							<div class="col-sm-6">
								<label for="nickname" class="form-label">&#42;<fmt:message key="nick" /></label>
								<input type="text" name="nickname" class="form-control custom-invalid invalid-nickname" id="nickname" placeholder="nickname" value="" required>
								<div class="feedback-custom invalid-nickname"><fmt:message key="nickValid" /></div>
							</div>

							<div class="col-12">
								<label for="id" class="form-label">&#42;<fmt:message key="id" /></label>
								<div class="input-group">
									<span class="input-group-text">@</span>
									<input type="text" name="id" class="form-control custom-invalid invalid-id" id="id" placeholder="ID" required>
									<div class="feedback-custom invalid-id"><fmt:message key="idValid" /></div>
								</div>
							</div>

							<div class="col-sm-6">
								<label for="password" class="form-label">&#42;<fmt:message key="pw" /></label>
								<input type="password" name="password" class="form-control custom-invalid invalid-password" id="password" placeholder="" value="" required>
								<div class="feedback-custom invalid-password"><fmt:message key="pwValid" /></div>
							</div>

							<div class="col-sm-6">
								<label for="pwcheck" class="form-label">&#42;<fmt:message key="pwcheck" /></label>
								<input type="password" class="form-control custom-invalid invalid-pwcheck" id="pwcheck" placeholder="" value="" required>
								<div class="feedback-custom invalid-pwcheck"><fmt:message key="pwcheckValid" /></div>
							</div>

							<div class="col-12">
								<label for="email" class="form-label">
									<fmt:message key="email" />
									<span class="text-muted">&#40;<fmt:message key="choice" />&#41;</span>
								</label>
								<input type="email" name="email" class="form-control custom-valid invalid-email" id="email" placeholder="(you)@example.com">
								<div class="invalid-email feedback-normal"><fmt:message key="emailValid" /></div>
							</div>

							<div class="col-12">
								<label for="github" class="form-label">
									<fmt:message key="github" />
									<span class="text-muted">&#40;<fmt:message key="choice" />&#41;</span>
								</label>
								<input type="text" name="github" class="form-control custom-valid invalid-github" id="github" placeholder="https://github.com/(you)">
								<div class="invalid-github feedback-normal"><fmt:message key="githubValid" /></div>
								<!-- 'https://github.com/(깃허브아이디)'  -->
							</div>
						</div>

						<hr class="my-4 text-warning">
						<button class="w-100 btn btn-warning btn-lg" id="form-submit" type="submit" disabled><fmt:message key="submit" /></button>
					</form>
				</div>

			</main>
		</div>

	</fmt:bundle>
</body>
<script src="../resources/js/signupValidation.js"></script>
</html>