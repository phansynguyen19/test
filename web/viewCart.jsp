<%-- 
    Document   : viewCart
    Created on : Jun 19, 2020, 10:39:56 AM
    Author     : Admin
--%>

<%@page import="java.util.Map"%>
<%@page import="nguyenps.cart.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Store</title>
    </head>
    <body>
        <h1>Your Cart</h1>
        <c:if test="${sessionScope != null}">
            <c:set var="cart" value="${sessionScope.CART}"/>
            <c:set var="cart2" value="${applicationScope.LIST_ITEM}"/>
            <c:if test="${cart != null}">
                <c:set var="items" value="${cart.getItems()}"/>
                <c:if test="${items != null}">
                    <form action="removeItemFromCart">
                        <table border="1">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Title</th>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                    <th>Action</th>

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
                                                    <input type="checkbox" name="chkItem" value="${title}" />
                                                </td>
                                            </tr>
                                        </c:if>


                                    </c:forEach>

                                </c:forEach>
                                <tr>
                                    <td colspan="4">
                                        <a href="onlineStore">Add More Books To Your Cart</a>
                                    </td>
                                    <td>
                                        <input type="submit" value="Remove Selected Book" name="btAction" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                    <!--                    <form action="checkOut">
                                            <input type="submit" name="btAction" value="Check Out" />
                                        </form>-->
                    <a href="checkOut">Click Here to Check Out</a>
                </c:if>
            </c:if>
        </c:if>
        <c:if test="${sessionScope == null or sessionScope.CART == null or items == null}">
            <h2>
                No cart is existed!!!
            </h2>
            <a href="store">Go To Store</a>
        </c:if>
        
    </body>
</html>
