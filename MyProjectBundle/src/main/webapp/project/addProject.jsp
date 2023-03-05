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
if ((String) session.getAttribute("memberId") == null) {
	response.sendRedirect("../member/loginMember.jsp");
}
%>
<title>Add Project</title>

<style>
#aside-right {
	width: 4.5rem;
	hight: 100vh;
	position: fixed;
	right: 0;
}

#sidebar-right {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	justify-content: center;
}

#sidebar-right a, #sidebar-right button {
	display: flex;
	flex-grow: 1;
	justify-content: center;
}

#main {
	margin-right: 4.5rem;
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	height: 3rem;
	background-color: #ffc107;
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: #fd7e14;
}

.nav {
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}

.form-check-input {
	margin-right: 1rem;
}
</style>
</head>

<body>

	<fmt:setLocale value='<%=session.getAttribute("language")%>' />
	<fmt:bundle basename="bundle.addProject">

		<form id="addProject" name="addProject" action="./processAddProject.jsp" method="post" enctype="multipart/form-data" novalidate>
			<script>
				var regExp = /^[가-힣a-zA-Z]+$/;

				function nameCheck() {
					if (!regExp
							.test(document.getElementById('projectName').value)) {
						document.validModal.modal('show');
					} else {
						//document.validModal.modal('hide');
						document.addProject.submit();
					}
				}
			</script>

			<!-- 사이드바 구역 -->
			<aside id="aside-right">
				<div id="sidebar-right" class="navbar nav-pills bg-light sticky-top p-0">
					<a href="#main" class="navbar-brand nav-item nav-link border-bottom rounded-0 py-3 mx-auto" title="Home" aria-current="page" data-bs-toggle="tooltip" data-bs-placement="right">
						<svg xmlns="http://www.w3.org/2000/svg" width="45" height="auto" fill="currentColor" class="bi bi-ui-checks-grid" viewBox="0 0 16 16" style="color: orange;">
  							<path d="M2 10h3a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1v-3a1 1 0 0 1 1-1zm9-9h3a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-3a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zm0 9a1 1 0 0 0-1 1v3a1 1 0 0 0 1 1h3a1 1 0 0 0 1-1v-3a1 1 0 0 0-1-1h-3zm0-10a2 2 0 0 0-2 2v3a2 2 0 0 0 2 2h3a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2h-3zM2 9a2 2 0 0 0-2 2v3a2 2 0 0 0 2 2h3a2 2 0 0 0 2-2v-3a2 2 0 0 0-2-2H2zm7 2a2 2 0 0 1 2-2h3a2 2 0 0 1 2 2v3a2 2 0 0 1-2 2h-3a2 2 0 0 1-2-2v-3zM0 2a2 2 0 0 1 2-2h3a2 2 0 0 1 2 2v3a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm5.354.854a.5.5 0 1 0-.708-.708L3 3.793l-.646-.647a.5.5 0 1 0-.708.708l1 1a.5.5 0 0 0 .708 0l2-2z" />
					</svg>
					</a>
					<ul class="nav nav-pills">
						<li class="nav-item">
							<a href="#section1" class="nav-link border-bottom rounded-0 py-3" title="name" data-bs-toggle="tooltip" data-bs-placement="right">
								<svg xmlns="http://www.w3.org/2000/svg" width="32" height="auto" fill="currentColor" class="bi bi-1-circle" viewBox="0 0 16 16">
  									<path d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8Zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0ZM9.283 4.002V12H7.971V5.338h-.065L6.072 6.656V5.385l1.899-1.383h1.312Z" />
							</svg>
							</a>
						</li>
						<li class="nav-item">
							<a href="#section2" class="nav-link border-bottom rounded-0 py-3" title="description" data-bs-toggle="tooltip" data-bs-placement="right">
								<svg xmlns="http://www.w3.org/2000/svg" width="32" height="auto" fill="currentColor" class="bi bi-2-circle" viewBox="0 0 16 16">
  										<path d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8Zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0ZM6.646 6.24v.07H5.375v-.064c0-1.213.879-2.402 2.637-2.402 1.582 0 2.613.949 2.613 2.215 0 1.002-.6 1.667-1.287 2.43l-.096.107-1.974 2.22v.077h3.498V12H5.422v-.832l2.97-3.293c.434-.475.903-1.008.903-1.705 0-.744-.557-1.236-1.313-1.236-.843 0-1.336.615-1.336 1.306Z" />
								</svg>
							</a>
						</li>
						<li class="nav-item">
							<a href="#section3" class="nav-link border-bottom rounded-0 py-3" title="image" data-bs-toggle="tooltip" data-bs-placement="right">
								<svg xmlns="http://www.w3.org/2000/svg" width="32" height="auto" fill="currentColor" class="bi bi-3-circle" viewBox="0 0 16 16">
  										<path d="M7.918 8.414h-.879V7.342h.838c.78 0 1.348-.522 1.342-1.237 0-.709-.563-1.195-1.348-1.195-.79 0-1.312.498-1.348 1.055H5.275c.036-1.137.95-2.115 2.625-2.121 1.594-.012 2.608.885 2.637 2.062.023 1.137-.885 1.776-1.482 1.875v.07c.703.07 1.71.64 1.734 1.917.024 1.459-1.277 2.396-2.93 2.396-1.705 0-2.707-.967-2.754-2.144H6.33c.059.597.68 1.06 1.541 1.066.973.006 1.6-.563 1.588-1.354-.006-.779-.621-1.318-1.541-1.318Z" />
  										<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0ZM1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8Z" />
								</svg>
							</a>
						</li>
						<li class="nav-item">
							<a href="#section4" class="nav-link border-bottom rounded-0 py-3" title="type" data-bs-toggle="tooltip" data-bs-placement="right">
								<svg xmlns="http://www.w3.org/2000/svg" width="32" height="auto" fill="currentColor" class="bi bi-4-circle" viewBox="0 0 16 16">
  									<path d="M7.519 5.057c.22-.352.439-.703.657-1.055h1.933v5.332h1.008v1.107H10.11V12H8.85v-1.559H4.978V9.322c.77-1.427 1.656-2.847 2.542-4.265ZM6.225 9.281v.053H8.85V5.063h-.065c-.867 1.33-1.787 2.806-2.56 4.218Z" />
  									<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0ZM1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8Z" />
								</svg>
							</a>
						</li>
						<li class="nav-item">
							<a href="#section5" class="nav-link border-bottom rounded-0 py-3" title="add" data-bs-toggle="tooltip" data-bs-placement="right">
								<svg xmlns="http://www.w3.org/2000/svg" width="32" height="auto" fill="currentColor" class="bi bi-5-circle" viewBox="0 0 16 16">
  										<path d="M1 8a7 7 0 1 1 14 0A7 7 0 0 1 1 8Zm15 0A8 8 0 1 0 0 8a8 8 0 0 0 16 0Zm-8.006 4.158c-1.57 0-2.654-.902-2.719-2.115h1.237c.14.72.832 1.031 1.529 1.031.791 0 1.57-.597 1.57-1.681 0-.967-.732-1.57-1.582-1.57-.767 0-1.242.45-1.435.808H5.445L5.791 4h4.705v1.103H6.875l-.193 2.343h.064c.17-.258.715-.68 1.611-.68 1.383 0 2.561.944 2.561 2.585 0 1.687-1.184 2.806-2.924 2.806Z" />
								</svg>
							</a>
						</li>
					</ul>
					<button onclick="nameCheck()" class="nav-item nav-link bg-warning border-top rounded-0 py-3" title="submit" aria-current="page" data-bs-toggle="tooltip" data-bs-placement="right">
						<svg xmlns="http://www.w3.org/2000/svg" width="32" height="auto" fill="currentColor" class="bi bi-send-check" viewBox="0 0 16 16">
  							<path d="M15.964.686a.5.5 0 0 0-.65-.65L.767 5.855a.75.75 0 0 0-.124 1.329l4.995 3.178 1.531 2.406a.5.5 0 0 0 .844-.536L6.637 10.07l7.494-7.494-1.895 4.738a.5.5 0 1 0 .928.372l2.8-7Zm-2.54 1.183L5.93 9.363 1.591 6.602l11.833-4.733Z" />
  							<path d="M16 12.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0Zm-1.993-1.679a.5.5 0 0 0-.686.172l-1.17 1.95-.547-.547a.5.5 0 0 0-.708.708l.774.773a.75.75 0 0 0 1.174-.144l1.335-2.226a.5.5 0 0 0-.172-.686Z" />
					</svg>
					</button>
				</div>
			</aside>

			<!-- 모달 -->
			<div class="modal fade" id="validModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">

					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5 text-danger" id="exampleModalLabel">
								<fmt:message key="nosubmit" />
							</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>

						<div class="modal-body">
							<p>
								<fmt:message key="nameValid" />
							</p>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						</div>
					</div>

				</div>
			</div>
			<!--  ================================================== -->
			<!--  ================================================== -->

			<!-- 본문 구역 -->
			<main id="main" class="px-3">

				<!--  ================================================== -->

				<!-- 첫번째 구역 -->
				<section id="section1">
					<div class="b-example-divider"></div>

					<ul class="list-group">
						<li class="list-group-item list-group-item-action">
							<h6>
								<fmt:message key="projectName" />
							</h6>
							<span class="input-group-text">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pen" viewBox="0 0 16 16">
  									<path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001zm-.644.766a.5.5 0 0 0-.707 0L1.95 11.756l-.764 3.057 3.057-.764L14.44 3.854a.5.5 0 0 0 0-.708l-1.585-1.585z" />
								</svg>
								<input type="text" name="projectName" id="projectName" class="form-control">
							</span>
						</li>
						<li class="list-group-item list-group-item-action">
							<h6>
								<fmt:message key="projectNameEn" />
							</h6>
							<span class="input-group-text">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pen" viewBox="0 0 16 16">
  									<path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001zm-.644.766a.5.5 0 0 0-.707 0L1.95 11.756l-.764 3.057 3.057-.764L14.44 3.854a.5.5 0 0 0 0-.708l-1.585-1.585z" />
								</svg>
								<input type="text" name="projectNameEn" id="projectNameEn" class="form-control">
							</span>
						</li>
					</ul>
				</section>

				<!--  ================================================== -->

				<!-- 두번째 구역 -->
				<section id="section2">
					<div class="b-example-divider"></div>

					<div class="list-group">
						<label for="description" class="form-label list-group-item">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle-fill" viewBox="0 0 16 16">
									  <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z" />
							</svg>
							<fmt:message key="description" />
							<textarea name="description" id="description" class="form-control" rows="8"></textarea>
						</label>
					</div>
				</section>

				<!--  ================================================== -->

				<!-- 세번째 구역 -->
				<section id="section3">
					<div class="b-example-divider"></div>
					<script>
						let idNum = 0;

						function addImgform() {

							const imgform = document.getElementById('imgform');
							const newImgform = imgform.cloneNode(true);
							idNum++;
							var newId = 'copyNode' + idNum;
							newImgform.id = newId;
							imgform.after(newImgform);

							//자식 요소 수정
							var childList = document.getElementById(newId).childNodes;
							for (var i = 0; i < childList.length; i++) {
								if (childList[i].nodeName.toLowerCase() == "textarea") {
									var newInfo = 'subImgInfo' + idNum;
									childList[i].setAttribute("id", newInfo);
									childList[i].setAttribute("name", newInfo);
								} else if (childList[i].nodeName.toLowerCase() == "input") {
									var newImg = 'subImage' + idNum;
									childList[i].setAttribute("id", newImg);
									childList[i].setAttribute("name", newImg);
								}
							}

						}
					</script>

					<ul class="list-group">
						<li class="list-group-item">
							<h6>
								<fmt:message key="initImg" />
							</h6>
							<span class="d-block small opacity-50">
								<fmt:message key="initimgInfo" />
							</span>
							<textarea name="initialImgInfo" id="initialImgInfo" class="form-control" rows="8"></textarea>
							<br>
							<label class="form-label">
								<fmt:message key="initimgUp" />
							</label>
							<input type="file" name="initialImage" id="initialImage" class="form-control">
						</li>
						<li class="list-group-item" id="imgform">
							<h6>
								<fmt:message key="image" />
							</h6>
							<span class="d-block small opacity-50">
								<fmt:message key="imgInfo" />
							</span>
							<textarea name="subImgInfo1" id="subImgInfo1" class="form-control" rows="8"></textarea>
							<br>
							<label class="form-label">
								<fmt:message key="imgUp" />
							</label>
							<input type="file" name="subImage1" id="subImage1" class="form-control">
							<div class="d-flex justify-content-end">
								<button type="button" class="btn btn-outline-warning rounded-pill my-3" onclick="addImgform()">
									<fmt:message key="addimg" />
								</button>
							</div>
						</li>
					</ul>
				</section>

				<!--  ================================================== -->

				<!-- 네번째 구역 -->
				<section id="section4">
					<div class="b-example-divider"></div>

					<ul class="list-group">
						<li class="list-group-item list-group-item-action">
							<input class="form-check-input flex-shrink-0" name="category" type="checkbox" value="web" checked style="font-size: 1.375em;">
							<span class="pt-1 form-checked-content">
								<strong>WEB</strong>
							</span>
						</li>
						<li class="list-group-item list-group-item-action">
							<input class="form-check-input flex-shrink-0" name="category" type="checkbox" value="mobile" style="font-size: 1.375em;">
							<span class="pt-1 form-checked-content">
								<strong>MOBILE</strong>
							</span>
						</li>
						<li class="list-group-item list-group-item-action">
							<input class="form-check-input flex-shrink-0" name="category" type="checkbox" value="game" style="font-size: 1.375em;">
							<span class="pt-1 form-checked-content">
								<strong>GAME</strong>
							</span>
						</li>
						<li class="list-group-item list-group-item-action">
							<input class="form-check-input flex-shrink-0" name="category" type="checkbox" value="embeded" style="font-size: 1.375em;">
							<span class="pt-1 form-checked-content">
								<strong>EMBEDED</strong>
							</span>
						</li>
						<li class="list-group-item list-group-item-action">
							<input class="form-check-input flex-shrink-0" name="category" type="checkbox" value="security" style="font-size: 1.375em;">
							<span class="pt-1 form-checked-content">
								<strong>SECURITY</strong>
							</span>
						</li>
						<li class="list-group-item list-group-item-action d-flex">
							<input class="form-check-input flex-shrink-0" name="category" type="checkbox" value="custom" style="font-size: 1.375em;"> <input name="customCategory" type="text" class="form-control" aria-label="Text input with checkbox">
						</li>
					</ul>

					<div class="input-group">
						<label class="input-group-text" for="inputGroupSelect01">
							<fmt:message key="condition" />
						</label>
						<select name="condition" class="form-select" id="inputGroupSelect01">
							<option selected value="complete"><fmt:message key="complete" /></option>
							<option value="continue"><fmt:message key="continue" /></option>
							<option value="fix"><fmt:message key="fix" /></option>
							<option value="incomplete"><fmt:message key="insufficient" /></option>
						</select>
					</div>
				</section>

				<!--  ================================================== -->

				<!-- 다섯번째 구역 -->
				<section id="section5">
					<div class="b-example-divider"></div>

					<ul class="list-group">
						<li class="list-group-item list-group-item-action">
							<label for="date">Release Date</label>
							<input name="releaseDate" type="date" id="date">
						</li>
						<li class="list-group-item list-group-item-action">
							<label for="floatingInputValue">Github URL</label>
							<input name="github" type="text" class="form-control" placeholder="name@example.com" value="https://github.com/..." id="floatingInputValue"></input>
						</li>
					</ul>
				</section>

			</main>
		</form>
	</fmt:bundle>
</body>
</html>