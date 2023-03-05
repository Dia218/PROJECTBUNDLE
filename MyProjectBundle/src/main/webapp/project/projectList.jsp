<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
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
<title>Project List</title>
</head>

<body>
	<%
	if (request.getParameter("language") != null) {
		session.setAttribute("language", request.getParameter("language"));
	}
	if (session.getAttribute("language") == null)
		session.setAttribute("language", "ko");
	%>
	<fmt:setLocale value='<%=session.getAttribute("language")%>' />
	<%@ include file="../menu.jsp"%>
	<fmt:bundle basename="bundle.projectList">

		<%@ include file="../connDB.jsp"%>
		<%
		String developerId = request.getParameter("developerId");
		boolean chooseDeveloper;

		if (developerId != null) {
			chooseDeveloper = true;

			PreparedStatement pstmt = null;
			ResultSet developerInfo = null;
			String sql = "select * from member where memberId='" + developerId + "'";
			pstmt = conn.prepareStatement(sql);
			developerInfo = pstmt.executeQuery();

			if (!developerInfo.next()) {
		%>
		<jsp:forward page="exceptionNoPage.jsp" />
		<%
		}
		%>

		<main class="container">
			<!-- 상단 -->

			<div class="nav-scroller bg-body shadow-sm">
				<nav class="nav" aria-label="Secondary navigation">
					<a class="nav-link active" aria-current="page" href="./projectList.jsp">
						<fmt:message key="allList" />
					</a>
				</nav>
			</div>

			<div class="d-flex justify-content-center p-3 my-3 bg-purple rounded shadow-sm">
				<h3 class="pb-2 mb-0 text-center text-warning"><%=developerInfo.getString("nickname")%></h3>
			</div>
			<%
			if (developerInfo != null)
				developerInfo.close();

			} else {

			chooseDeveloper = false;
			%>
			<main class="container">
				<!-- 상단 -->

				<%
				if (MemberId != null) {
				%>
				<div class="nav-scroller bg-body shadow-sm">
					<nav class="nav" aria-label="Secondary navigation">
						<a class="nav-link active" aria-current="page" href="./projectList.jsp?developerId=<%=(String) session.getAttribute("memberId")%>">
							<fmt:message key="myList" />
						</a>
					</nav>
				</div>
				<%
				}
				%>

				<div class="d-flex justify-content-center p-3 my-3 bg-purple rounded shadow-sm">
					<h3 class="pb-2 mb-0 text-center text-warning">
						<fmt:message key="allProject" />
					</h3>
				</div>
				<%
				}
				%>

				<!-- 중간 / 최근 3개 -->
				<div class="container">
					<div class="row" align="center">
						<%
						PreparedStatement pstmt = null;
						ResultSet projects = null;

						String sql;
						if (chooseDeveloper == true)
							sql = "SELECT * FROM project WHERE developerId='" + developerId + "' ORDER BY releaseDate DESC";
						else
							sql = "SELECT * FROM project ORDER BY releaseDate DESC";

						pstmt = conn.prepareStatement(sql);
						projects = pstmt.executeQuery();

						if (!projects.next()) {
						%>
						<jsp:forward page="exceptionNoProjects.jsp" />
						<%
						}
						for (int i = 0; i < 3; i++) {
						%>
						<div class="col-md-4">
							<h3><%=projects.getString("projectName")%></h3>
							<p><%=projects.getString("projectNameEn")%></p>
							<p><%=projects.getString("releaseDate")%></p>
							<p><%=projects.getString("condition")%></p>
							<p><%=projects.getString("category")%></p>
							<a href="./projectDetail.jsp?projectId=<%=projects.getString("projectId")%>" class="btn btn-secondary mb-3" role="button">
								<fmt:message key="detail" />
								&raquo;
							</a>
						</div>
						<%
						if(!projects.next())
							break;
						}
						%>
					</div>
					<hr>
				</div>

				<!-- 하단 / 전체 목록 -->
				<div class="my-3 p-3 bg-body rounded shadow-sm">
					<h6 class="border-bottom pb-2 my-2">
						<fmt:message key="allList" />
					</h6>
					<%
					pstmt = null;
					projects = null;

					if (chooseDeveloper == true)
						sql = "SELECT * FROM project WHERE developerId='" + developerId + "' ORDER BY projectIndex DESC";
					else
						sql = "SELECT * FROM project ORDER BY releaseDate DESC";
					
					pstmt = conn.prepareStatement(sql);
					projects = pstmt.executeQuery();

					while (projects.next()) {
					%>
					<div class="d-flex text-muted pt-3">
						<div class="d-flex mx-3 align-items-center">
							<svg class="bd-placeholder-img flex-shrink-0 me-2 mb-2 rounded" width="16" height="16" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false">
							<title>Placeholder</title><rect width="100%" height="100%" fill="#fd7e14" /></svg>
						</div>

						<div class="d-flex justify-content-between py-3 px-3 mb-0 small lh-sm border-bottom w-100">
							<div class="col col-md-2 flex-column">
								<strong class="text-gray-dark"><%=projects.getString("projectName")%></strong>
								<span class="d-block"><%=projects.getString("projectNameEn")%></span>
							</div>
							<div class="d-flex flex-row flex-grow-1 px-5 my-auto d-md-block d-none">
								<div class="mx-2">
									<fmt:message key="category" />
									<%=projects.getString("category")%>
									<fmt:message key="date" />
									<%=projects.getString("releaseDate")%>
									<fmt:message key="condition" />
									<%=projects.getString("condition")%></div>
							</div>
							<div class="col col-md-2 mt-auto">
								<p>
									<a href="./projectDetail.jsp?id=<%=projects.getString("projectId")%>" class="btn btn-secondary" role="button">
										<fmt:message key="detail" />
										&raquo;
									</a>
							</div>
						</div>
					</div>
					<%
					}
					if (projects != null)
					projects.close();
					if (pstmt != null)
					pstmt.close();
					if (conn != null)
					conn.close();
					%>
				</div>

			</main>
			<%@ include file="../footer.jsp"%>
	</fmt:bundle>
</body>
</html>