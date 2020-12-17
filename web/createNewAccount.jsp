<%-- 
    Document   : createNewAccount
    Created on : Jun 26, 2020, 11:48:29 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Create New Account</h1>
        <form action="createCheck" method="POST">
            <c:set var="errors" value="${requestScope.CREATE_ERROR}"/>
            Username* <input type="text" name="txtUsername" value="${param.txtUsername}" /> (6-20 char)<br/>
            <c:if test="${not empty errors.usernameLengthErr}">
                <font color="red">
                ${errors.usernameLengthErr}
                </font></br>
            </c:if>
            Password* <input type="password" name="txtPassword" value="" /> (6-30 char)<br/>
            <c:if test="${not empty errors.passwordLengthErr}">
                <font color="red">
                ${errors.passwordLengthErr}
                </font></br>
            </c:if>
            Confirm* <input type="password" name="txtConfirm" value="" /> <br/>
            <c:if test="${not empty errors.confirmNotMatched}">
                <font color="red">
                ${errors.confirmNotMatched}
                </font></br>
            </c:if>
            Full name* <input type="text" name="txtFullName" value="${param.txtFullName}" /> (2-50 char)<br/>
            <c:if test="${not empty errors.fullNameLengthErr}">
                <font color="red">
                ${errors.fullNameLengthErr}
                </font></br>
            </c:if>
            <input type="submit" value="Create New Account" name="btAction" />
            <input type="reset" value="Reset" />
        </form> <br/>
        <c:if test="${not empty errors.usernameIsExisted}">
            <font color="red">
            ${errors.usernameIsExisted}
            </font></br>
        </c:if>
    </body>
</html>
