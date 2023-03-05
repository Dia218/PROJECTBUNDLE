<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Project"%>
<%@ page import="dao.ProjectRepository"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<script type="text/javascript" src="../resources/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Project Detail</title>
</head>

<body>
	<%
	if (request.getParameter("language") != null) {
		session.setAttribute("language", request.getParameter("language"));
	}
	if (session.getAttribute("language") == null)
		session.setAttribute("language", "ko");
	%>
	<fmt:setLocale value='<%=request.getParameter("language")%>' />
	<%@ include file="../menu.jsp"%>
	<fmt:bundle basename="bundle.projectList">

		<%@ include file="../connDB.jsp"%>

		<%
		String projectId = request.getParameter("projectId");
		
		PreparedStatement pstmt = null;
		ResultSet projectInfo = null;
		String sql = "SELECT * FROM project WHERE projectId="+projectId;
		pstmt = conn.prepareStatement(sql);
		projectInfo = pstmt.executeQuery();

		if (!projectInfo.next()) {
		%>
		<jsp:forward page="exceptionNoPage.jsp" />
		<%
		} else {
		%>

		<main>
			<!-- 캐러셀 -->
			<div style="background-color: #585858">
				<div id="myCarousel" class="carousel carousel-dark slide py-5" data-bs-ride="carousel">
					<div class="carousel-indicators">

						<!-- 하단 버튼 -->
						<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
						<%
						for (int i = 0; i < subImages.size(); i++) {
						%>
						<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="<%=i + 1%>" class="active" aria-current="true" aria-label="Slide <%=i + 2%>"></button>
						<%
						}
						%>
					</div>

					<!-- 이미지 -->
					<div class="carousel-inner">
						<div class="carousel-item active">
							<%
							if (project.getInitialImage() != null) {
							%>
							<img src="../resources/images/upload/<%=project.getInitialImage()%>" class="d-block w-100" alt="대표이미지">
							<%
							} else {
							%>
							<img src="../resources/images/page_component/NoImg.png" class="d-block w-100" alt="대표이미지">
							<%
							}
							%>
						</div>

						<%
						for (int i = 0; i < subImages.size(); i++) {
						%>
						<div class="carousel-item">
							<img src="../resources/images/upload/<%=subImages.get(i)%>" class="d-block w-100" alt="서브이미지">
						</div>
						<%
						}
						%>
					</div>

					<!-- 양쪽 버튼 -->
					<button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>

			<!--  ================================================== -->

			<div class="container marketing my-5">
				<hr class="featurette-divider">

				<!-- 본문 -->
				<div class="row g-5">

					<!-- 왼쪽(메인) -->
					<div class="col-md-8">
						<article class="blog-post">
							<h2 class="blog-post-title mb-1"><%=project.getProjectName()%></h2>
							<h4 class="blog-post-title mb-1"><%=project.getProjectNameEn()%></h4>
							<p class="blog-post-meta my-3"><%=project.getCategory()%></p>
							<hr>
							<div style="min-height: 200px">
								<p><%=project.getDescription()%></p>
							</div>
						</article>

						<nav class="blog-pagination my-5" aria-label="Pagination">
							<a href="./projectList.jsp" class="btn btn-outline-secondary rounded-pill">목록으로</a>
						</nav>
					</div>

					<!-- 오른쪽(사이드) -->
					<div class="col-md-4">
						<div class="position-sticky" style="top: 2rem;">
							<div class="p-4 mb-3 bg-light rounded">
								<h4 class="fst-italic"><%=project.getDeveloper()%></h4>
								<p class="mb-0">(개발자 페이지 이름)</p>
								<a href="#">개발자 페이지 링크</a>
							</div>

							<div class="p-4">
								<p>
									제작일<br><%=project.getReleaseDate()%></p>
								<p>
									상태<br><%=project.getCondition()%></p>
								<h4 class="fst-italic">GitHub</h4>
								<a href="<%=project.getGithub()%>"><%=project.getGithub()%></a>
							</div>
						</div>
					</div>

				</div>

				<!--  ================================================== -->

				<!-- 사진 & 설명 -->
				<hr class="featurette-divider">
				<div class="row featurette">
					<div class="col-md-8">
						<img src="../resources/images/upload/<%=project.getInitialImage()%>" class="d-block w-100" alt="대표이미지">
					</div>
					<div class="col-md-4">
						<h2 class="featurette-heading fw-normal lh-1">00.</h2>
						<p class="lead">getImgInfo</p>
					</div>
				</div>

				<%
				for (int i = 0; i < subImages.size(); i++) {
				%>
				<hr class="featurette-divider">
				<div class="row featurette">
					<div class="col-md-8">
						<img src="../resources/images/upload/<%=subImages.get(i)%>" class="d-block w-100" alt="서브이미지">
					</div>
					<div class="col-md-4">
						<h2 class="featurette-heading fw-normal lh-1">
							0<%=i%>.
						</h2>
						<p class="lead">getImgInfo</p>
					</div>
				</div>
				<%
				}
				%>

			</div>
		</main>
		<%
		}
		%>

		<%@ include file="../footer.jsp"%>
	</fmt:bundle>
</body>
</html>