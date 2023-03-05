<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Date"%>

<footer class="container my-3">
	<div class="text-end text-warning" id="clock">
		<%
		response.setIntHeader("Refresh", 60);

		Date day = new java.util.Date();
		String am_pm;
		int hour = day.getHours();
		int minute = day.getMinutes();

		if (hour / 12 == 0) {
			am_pm = "AM";
		} else {
			am_pm = "PM";
			hour = hour - 12;
		}

		String CT = am_pm + " " + hour + ":" + minute;
		out.println(CT + "\n");
		%>
	</div>
	<hr>

	<div class="d-flex justify-content-between">
		<div class="d-flex align-items-center text-warning">&copy; 201912101 이상은</div>

		<div class="btn-group dropup">
			<button type="button" class="btn btn-outline-warning dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">Language</button>
			<ul class="dropdown-menu">
				<li>
					<a class="dropdown-item" href="?language=en">English</a>
				</li>
				<li>
					<hr class="dropdown-divider">
				</li>
				<li>
					<a class="dropdown-item" href="?language=ko">한국어</a>
				</li>
			</ul>
		</div>
	</div>
</footer>