<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login page</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            min-width: 480px;
            max-width: 40%;
        }
        .jumbotron {
            margin-top: 20px;
            background-color: rgba(0, 128, 0, 0.10);
        }
        .btn {
            margin-top: 2%;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="jumbotron well">
        <c:url value="/j_spring_security_check" var="loginUrl" />
        <form role="form" action="${loginUrl}" method="post" >
            <div>
                <h4 align="center">Войдите в вашу учетную запись</h4>
            </div>
            <div class="form-group" style="margin-top: 20px;">
                <label for="login">
                    Логин
                </label>
                <input type="text" class="form-control" id="login" placeholder="Login" name="j_username"/>
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">
                    Пароль
                </label>
                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="j_password"/>
            </div>
            <button type="submit" class="btn btn-default btn-block btn-success">
                Открыть телефонную книгу
            </button>
        </form>
    </div>
    <div class="row">
        <div class="col-md-12">
            <h5>
                Вы еще не зарегестрированы?
            </h5>
            <a type="button" class="btn btn-default btn-block" href="registration.jsp">
                Регистрация
            </a>
        </div>
    </div>
</div>
</body>
</html>