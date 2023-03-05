<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
System.out.println(id);
%>

<sql:setDataSource var="dataSource" url="jdbc:mysql://localhost:3306/MyProjectBundleDB" driver="com.mysql.jdbc.Driver" user="root" password="0218" />
<sql:setDataSource var="dataSource" url="jdbc:mysql://localhost:3306/MyProjectBundleDB" driver="com.mysql.jdbc.Driver" user="root" password="0218" />
<sql:query dataSource="${dataSource}" var="resultSet">
   							SELECT id FROM member WHERE id='';
						</sql:query>
