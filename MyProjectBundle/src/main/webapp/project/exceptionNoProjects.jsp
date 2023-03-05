<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<script type="text/javascript" src="../resources/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<%
String MemberId = (String) session.getAttribute("memberId");
%>
<title>No Project</title>
</head>

<body>
	<%
	if(request.getParameter("language") != null) {
		session.setAttribute("language", request.getParameter("language"));	
	}
	if (session.getAttribute("language") == null)
		session.setAttribute("language", "ko");
	%>
	<fmt:setLocale value='<%=request.getParameter("language")%>' />
	<%@ include file="../menu.jsp"%>
	<fmt:bundle basename="bundle.exceptionNoProjects">

		<main>
			<div class="container bg-warning bg-opacity-25 rounded-3 my-5 pt-5 d-flex flex-column align-items-center">
				<h1 class="display-5 fw-normal">
					<fmt:message key="errorcomment" />
				</h1>
				<div class="col-sm-8 py-5 mx-auto">
					<a class="btn btn-warning" href="../mainpage.jsp" role="button">
						<fmt:message key="mainpage" />
					</a>
					<%
					if (MemberId != null) {
					%>
					<a class="btn btn-warning" href="./projectList.jsp?developerId=<%=MemberId%>" role="button">
						<fmt:message key="list" />
					</a>
					<%
					} else {
					%>
					<a class="btn btn-warning" href="../member/loginMember.jsp" role="button">
						<fmt:message key="signin" />
					</a>
					<%
					}
					%>
				</div>
			</div>

		</main>
		<%@ include file="../footer.jsp"%>
	</fmt:bundle>
</body>
</html>