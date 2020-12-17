<%-- 
    Document   : onlineStore
    Created on : Jul 11, 2020, 10:15:05 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Store</title>
    </head>
    <body>
        <h1>Online Shopping Cart</h1>
        <form action="cart">
            Choose item <select name="cboBook">
                <c:forEach var="title" items="${applicationScope.LIST_ITEM}">
                    <option value="${title.key}">${title.key}</option>
                </c:forEach>
            </select> </br>
            Enter quantity <input type="number" name="txtQuantity" value="" pattern="[0-9]{1,30}"/>
            <br/>
            <input type="submit" name="btAction" value="Add Book to Your Cart" />
            <input type="submit" name="btAction" value="View Your Cart" />
        </form>
        <c:if test="${not empty requestScope.ERROR_QUANTITY}">
            <font color="red">
                ${requestScope.ERROR_QUANTITY}
            </font>
        </c:if>
    </body>
</html>
