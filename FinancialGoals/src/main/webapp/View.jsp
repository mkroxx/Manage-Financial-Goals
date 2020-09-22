<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${goal.getName()}</title>
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
<h1 align="center">${goal.getName()}</h1>
<div>
<table>
 <tr>
    <th>ID</th>
    <th>Financial Goal Name</th>
    <th>Target Amount</th>
    <th>Total Contribution</th>
  </tr>
  <tr>
  <td>${goal.getId()}</td>
  <td>${goal.getName()}</td>
  <td>${goal.getTargetAmount()}</td>
  <td>${goal.getContribute()}</td>
  </tr>
</table>
</div>
<br/><br/><br/>
<div>
<table>
 <tr>
    <th>ID</th>
    <th>Transaction Amount</th>
    <th>Time</th>
    <th>Amount Left</th>
  </tr>
  <c:forEach var="trx" items="${transaction}">
  <tr>
  <td><c:out value="${trx.getTrxid()}" /></td>
  <td><c:out value="${trx.getAmount()}" /></td>
  <td><c:out value="${trx.getTime()}" /></td>
  <c:set var="total" value="${total+trx.getAmount()}"></c:set>
  <td><c:out value="${goal.getTargetAmount()-total}" /></td>
  </tr>
  </c:forEach>
</table>
</div>
<br/><br/><br/>
<div class="form" align="center">
<form action="update" method="post">
<label for="contribute">Contribute Amount:</label>
<input type="number" min="100" step="100" max="500" name="amount" required="required"/>
&nbsp;&nbsp;&nbsp;
<input type="hidden" name="goalID" value="${goal.getId()}" />
<input type="hidden" name="goalName" value="${goal.getName()}" />
<input type="hidden" name="time" value="<%= (new java.util.Date()).toLocaleString()%>" />
<input type="submit" class="button button1" value="Contribute Amount" />
</form>
${r}
</div>


</body>
</html>
