<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Results</title>
<style>
table {
  border-collapse: collapse;
  width: 100%;
}
th, td {
  text-align: left;
  padding: 8px;
}
th {
  background-color: #ddd;
}
tr:nth-child(even) {
  background-color: #f2f2f2;
}
</style>
</head>
<body>
    <h2>Search Results</h2>
    <c:if test="${not empty courses}">
        <table>
            <thead>
                <tr>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Category</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${courses}" var="course">
                    <tr>
                        <td><img src="${course.image}" alt="${course.name}" width="100"></td>
                        <td>${course.name}</td>
                        <td>${course.description}</td>
                        <td>${course.price}</td>
                        <td>${course.category}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
    <c:if test="${empty courses}">
        <p>No results found.</p>
    </c:if>
</body>
</html>
