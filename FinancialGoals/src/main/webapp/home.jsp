<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Financial Goals</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

label{
	font-weight: bold;
}
/* Firefox */
input[type=number] {
  -moz-appearance: textfield;
  padding: 6px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border: 3px solid #ccc;
  -webkit-transition: 0.5s;
  transition: 0.5s;
  outline: none;
}
input[type=number]:focus {
-moz-appearance: textfield;
  border: 3px solid #555;
}
input[type=text] {
  padding: 6px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border: 3px solid #ccc;
  -webkit-transition: 0.5s;
  transition: 0.5s;
  outline: none;
}

input[type=text]:focus {
  border: 3px solid #555;
}
.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 6px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 8px 0;
  transition-duration: 0.4s;
  cursor: pointer;
}

.button1 {
  background-color: white; 
  color: black; 
  border: 2px solid #4CAF50;
}

.button1:hover {
  background-color: #4CAF50;
  color: white;
}

.form{
	border: 2px solid black;	
}

table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
  background-color: #4CAF50;
  color: white;
}
</style>
</head>
<body>
<h1 align="center">MANAGE FINANCIAL GOALS</h1><br />
<div align="center">
<div class="form">
<h3>Add Financial Goal</h3>
<form action="add" method="post">
<label for="name">Financial Goal Name:</label>
<input type="text" name="name" required="required" />
&nbsp;&nbsp;&nbsp;
<label for="targetAmount">Target Amount:</label>
<input type="number" min="100" name="targetAmount" required="required"/>
<input type='hidden' name="contribute" value="0" />
<input type="hidden" name="time" value="<%= (new java.util.Date()).toLocaleString()%>" /> 
&nbsp;&nbsp;&nbsp;
<input type="submit" class="button button1" value="Add" />
</form>
${r}
</div>
<br /><br />
<table>
 <tr>
    <th>ID</th>
    <th>Financial Goal Name</th>
    <th>Target Amount</th>
    <th>Contribution (in %)</th>
    <th>Add Contribution</th>
  </tr>
  <c:forEach var="goal" items="${list}">
  <tr>
  <td><c:out value="${goal.getId()}" /></td>
  <td><c:out value="${goal.getName()}" /></td>
  <td><c:out value="${goal.getTargetAmount()}" /></td>
  <fmt:parseNumber var = "i" type = "number" integerOnly="true" value = "${goal.getContribute()/goal.getTargetAmount()*100}" />
  <c:choose>
  <c:when test="${i==100}">
  <c:set var="rate" value="Completed" />
  </c:when>
  <c:otherwise>
  <c:set var="rate" value="${i}%" />
  </c:otherwise>
  </c:choose>
  <td><c:out value="${rate}" /></td>
  <c:choose>
  <c:when test="${goal.getContribute()!=goal.getTargetAmount()}">
  <td><a href="view?gid=${goal.getId()}">Click Here</a></td>
  </c:when>
  <c:otherwise><td><a href="delete?gid=${goal.getId()}">Delete It</a></td></c:otherwise>
  </c:choose>
  
  </tr>
  
  </c:forEach>
</table>
</div>
</body>
</html>
