<%-- 
    Document   : search
    Created on : Jun 10, 2020, 11:36:33 AM
    Author     : Admin
--%>

<%@page import="nguyenps.userdetail.UserDetailDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>
    </head>
    <body>
        <c:if test="${empty sessionScope.USER.fullname}">
            <c:redirect url=""/>
        </c:if>

        <font color="red">
        Welcome, ${sessionScope.USER.fullname}
        </font></br>

        <a href="logout">Logout</a>

        <h1>Search Page</h1>
        <form action="search">
            Search Value <input type="text" name="txtSearchValue" value="${param.txtSearchValue}" />
            <input type="submit" value="Search" name="btAction" />
        </form>
        <br/>
        <c:set var="searchValue" value="${param.txtSearchValue}"/>
        <c:if test="${not empty searchValue}">
            <c:set var="result" value="${requestScope.SEARCH_RESULT}"/>
            <c:if test="${not empty result}">
                <table border="1">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Full name</th>
                            <th>Role</th>
                            <th>Delete</th>
                            <th>Update</th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach var="dto" items="${result}" varStatus="counter">
                        <form action="updatePassRole">
                            <tr>
                                <td>
                                    ${counter.count}
                                    .</td>
                                <td>
                                    ${dto.username}
                                    <input type="hidden" name="txtUsername" value="${dto.username}" />
                                </td>
                                <td>
                                    <input type="text" name="txtPassword" value="${dto.password}" />
                                </td>
                                <td>
                                    <input type="text" name="txtFullName" value="${dto.fullname}" />
                                </td>
                                <td>
                                    <input type="checkbox" name="chkAdmin" value="ON" 
                                           <c:if test="${dto.role}">
                                               checked="checked"
                                           </c:if>
                                           />
                                </td>
                                <td>

                                    <c:if test="${sessionScope.USER.username != dto.username}">
                                        <c:url var="deleteLink" value="deleteAccount">
                                            <c:param name="pk" value="${dto.username}"/>
                                            <c:param name="lastSearchValue" value="${searchValue}"/>
                                        </c:url>
                                        <a href="${deleteLink}">Delete</a>
                                    </c:if>

                                </td>
                                <td>
                                    <input type="submit" value="Update" name="btAction"/>
                                    <input type="hidden" name="lastSearchValue" value="${searchValue}" />
                                </td>
                            </tr>
                        </form>
                    </c:forEach>

                </tbody>
            </table>
            <c:set var="error_password" value="${requestScope.INVALID_PASSWORD}"/>
            <c:set var="error_fullname" value="${requestScope.INVALID_FULLNAME}"/>
            <c:if test="${not empty error_password}">
                <font color="red">
                ${error_password}
                </font></br>
            </c:if>
            <c:if test="${not empty error_fullname}">
                <font color="red">
                ${error_fullname}
                </font>
            </c:if>

        </c:if>
        <c:if test="${empty result}">
            <h2>
                No record is matches!!!
            </h2>
        </c:if>
    </c:if>

</body>
</html>
