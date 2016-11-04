<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            min-width: 480px;
            max-width: 40%;
        }
        .jumbotron {
            margin-top: 2%;
        }
        .btn-block {
            margin-top: 1%;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="jumbotron well">
        <h2 align="center">Сервис “Телефонная книга”</h2><br>
        <sec:authorize access="!isAuthenticated()">
            <form action="<c:url value="/login" />">
                <button type="submit" class='btn btn-lg btn-success btn-block'>
                    Войти
                </button>
            </form>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <div class="row">
                <h4>Ваш логин: <sec:authentication property="principal.username" /></h4>
            </div>
            <form action="<c:url value="/home" />">
                <button type="submit" class='btn-lg btn-block btn-success'>
                    Ваша телефонная книга
                </button>
            </form>
            <form action="<c:url value="/logout" />">
                <button type="submit" class='btn-lg btn-block btn-warning'>
                    Выйти
                </button>
            </form>
        </sec:authorize>
    </div>
    
    <div class="footer">
        <p align="right">© Viktor Gevel 2016</p>
    </div>
</div>
</body>
</html>