<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="java.io.File"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*"%>
<%@ include file="../connDB.jsp"%>

<%
request.setCharacterEncoding("UTF-8");

String filename = "";
String realFolder = "D:\\dia\\CODE\\2022-3-2\\JSPweb\\MyProjectBundle\\src\\main\\webapp\\resources\\images\\upload";
String encType = "utf-8";
int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb

MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

//================================================== //

//get parameter (input data)
String projectName = multi.getParameter("projectName");
String projectNameEn = multi.getParameter("projectNameEn");
String description = multi.getParameter("description");
String[] categories = multi.getParameterValues("category");
String condition = multi.getParameter("condition");
String releaseDateStr = multi.getParameter("releaseDate");
String github = multi.getParameter("github");

//================================================== //

//developerId
String developerId = (String) session.getAttribute("memberId");

//category
String category = String.join(",", categories);

//releaseDate
String releaseDateformat;
java.sql.Date releaseDate;

if (releaseDateStr == null) {
	LocalDate currentDate = LocalDate.now();
	releaseDate = java.sql.Date.valueOf(currentDate);
} else {
	releaseDate = java.sql.Date.valueOf(releaseDateStr);
}

//projectId = 개발자id + P + projectIndex
PreparedStatement pstmt = null;
ResultSet projectStock = null;
int projectIndex = 0;

String sql = "SELECT projectIndex FROM project WHERE developerId='" + developerId + "' ORDER BY projectIndex DESC";
pstmt = conn.prepareStatement(sql);
projectStock = pstmt.executeQuery();

if (projectStock.next()) {
	projectIndex = projectStock.getInt("projectIndex");
} else {
	projectIndex = 0;
}
projectIndex++;
String projectId = developerId + "P" + projectIndex;

// ================================================== //

//input project table
pstmt = null;
sql = "insert into project values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
pstmt = conn.prepareStatement(sql);

pstmt.setString(1, projectId);
pstmt.setString(2, developerId);
pstmt.setString(3, projectName);
pstmt.setString(4, projectNameEn);
pstmt.setString(5, description);
pstmt.setString(6, category);
pstmt.setString(7, condition);
pstmt.setDate(8, releaseDate);
pstmt.setString(9, github);
pstmt.setInt(10, projectIndex);

pstmt.executeUpdate();

//================================================== //

//이미지 데이터 처리
String imgPath = "../resources/images/upload";
DiskFileUpload uploadManager = new DiskFileUpload();
List imgitemList = uploadManager.parseRequest(request);
Iterator imgItems = imgitemList.iterator();

String forProject = projectId;
int index = 0;

while (imgItems.hasNext()) {
	FileItem imgItem = (FileItem) imgItems.next();

	if (!imgItem.isFormField()) {
		//이미지 업로드
		String imgName = imgItem.getName();
		imgName = imgName.substring(imgName.lastIndexOf("\\") + 1);
		File uploadfile = new File(imgPath + "/" + imgName);
		imgItem.write(uploadfile);

		String imgType = "sub";
		String imgInfo = "";
		int indexIn = 1;

		//대표 이미지
		if (imgItem.getFieldName() == "initialImage") {
	imgType = "init";
	imgInfo = request.getParameter("initialImgInfo");
	indexIn = 0;
		}
		//서브 이미지
		else {
	imgInfo = request.getParameter("");
	indexIn = ++index;
		}

		//imgID = 프로젝트id + I index
		String imgID = forProject + "I" + indexIn;

		//================================================== //

		//input projectimage table
		pstmt = null;
		sql = "insert into projectimage values(?, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, imgID);
		pstmt.setString(2, imgName);
		pstmt.setString(3, imgType);
		pstmt.setString(4, imgInfo);
		pstmt.setInt(5, indexIn);
		pstmt.setString(6, forProject);

		pstmt.executeUpdate();

	}
}

response.sendRedirect("./projectList.jsp");
%>