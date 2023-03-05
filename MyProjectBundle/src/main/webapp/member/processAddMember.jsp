<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String name = request.getParameter("name");
String nickname = request.getParameter("nickname");
String password = request.getParameter("password");
String email = request.getParameter("email");
String github = request.getParameter("github");

Date currentDatetime = new Date(System.currentTimeMillis());
java.sql.Date sqlDate = new java.sql.Date(currentDatetime.getTime());
java.sql.Timestamp timestamp = new java.sql.Timestamp(currentDatetime.getTime());
%>

<sql:setDataSource var="dataSource" url="jdbc:mysql://localhost:3306/MyProjectBundleDB" driver="com.mysql.jdbc.Driver" user="root" password="0218" />

<sql:update dataSource="${dataSource}" var="resultSet">
   INSERT INTO member VALUES (?, ?, ?, ?, ?, ?, ?)
   <sql:param value="<%=id%>" />
	<sql:param value="<%=name%>" />
	<sql:param value="<%=nickname%>" />
	<sql:param value="<%=password%>" />
	<sql:param value="<%=email%>" />
	<sql:param value="<%=github%>" />
	<sql:param value="<%=timestamp%>" />
</sql:update>

<c:redirect url="./loginMember.jsp" />
