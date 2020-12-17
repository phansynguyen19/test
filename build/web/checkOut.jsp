<%-- 
    Document   : checkOut
    Created on : Jul 12, 2020, 11:16:35 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Out Page</title>
    </head>
    <body>
        <h1>Your Cart</h1>
        <c:if test="${sessionScope != null}">
            <c:set var="cart" value="${sessionScope.CART}"/>
            <c:set var="cart2" value="${applicationScope.LIST_ITEM}"/>
            <c:if test="${cart != null}">
                <c:set var="items" value="${cart.getItems()}"/>
                <c:if test="${items != null}">
                    <table border="1">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Title</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="title" items="${items.keySet()}" varStatus="counter">
                                <c:forEach var="price" items="${cart2.keySet()}">
                                    <c:if test="${title == price}">
                                        <tr>
                                            <td>
                                                ${counter.count}
                                                .</td>
                                            <td>
                                                ${title}
                                            </td>
                                            <td>
                                                ${items.get(title)}
                                            </td>
                                            <td>
                                                ${cart2.get(price)}
                                            </td>
                                            <td>
                                                ${cart2.get(price) * items.get(title)}
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                            <tr>
                                <td colspan="4">
                                    SUM OF TOTAL
                                </td>
                                <td>
                                    ${sessionScope.SUM}
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <form action="check" method="POST">
                        </br>
                        <h3>Enter Info </h3> </br>
                        Your Name:  <input type="text" name="txtCustomerName" value="${requestScope.CUSNAME}"  /> </br>
                        Your Address: <input type="text" name="txtCustomerAddress" value="${requestScope.ADDRESS}" /> </br>
                        <input type="submit" value="Buy" name="btAction" />
                    </form>
                </c:if>
            </c:if>
        </c:if>
        
        <c:if test="${sessionScope == null or sessionScope.CART == null or items == null}">
            <c:redirect url="onlineStore.jsp"/>
        </c:if>
        <c:if test="${not empty requestScope.INVALID_NAME}">
            <font color="red">
            ${INVALID_NAME}
            </font></br>
        </c:if>
        <c:if test="${not empty requestScope.INVALID_ADDRESS}">
            <font color="red">
            ${INVALID_ADDRESS}
            </font></br>
        </c:if>
    </body>
</html>
