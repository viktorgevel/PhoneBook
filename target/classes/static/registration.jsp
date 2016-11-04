<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registration page</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
        .body {
            background: rgba(0, 0, 240, 0.05);
        }
        .legend{
            margin-top: 5%;
            margin-bottom: 5%;
            border-bottom: solid;
            border-bottom-color: darkgreen;
            text-align: center;
        }
        .form-control {
            background: rgba(0, 0, 240, 0.1);
        }
        .btn-registration {
            background: cornflowerblue;
            margin-top: 2%;
            font: bold 140% djvu-sans;
        }
    </style>
</head>
<body class="body">
<div class="container">
    <h3 class="legend">
        Заполните, пожалуйста, поля формы<br><br>
    </h3>
    <form class="form-horizontal" role="form" action="createnewuser" method="post">
        <div class="form-group">
            <label for="login" class="col-sm-3 control-label" >
                Логин
            </label>
            <div class="col-sm-7">
                <input type="text" class="form-control" id="login" required pattern="^[a-zA-Z]+$" minlength=3 placeholder="Введите логин (не меньше 3 английских символа)" name="j_username"/>
            </div>
        </div>
        <div class="form-group">
            <label for="password" class="col-sm-3 control-label">
                Пароль
            </label>
            <div class="col-sm-7">
                <input type="password" class="form-control" id="password" required minlength=5 placeholder="Введите пароль (минимум 5 символов)" name="j_password"/>
            </div>
        </div>
        <div class="form-group">
            <label for="name" class="col-sm-3 control-label">
                ФИО
            </label>
            <div class="col-sm-7">
                <input type="text" class="form-control" id="name" required minlength=5 placeholder="Введите свою фамилию, имя и отчество" name="name"/>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-7">
                <button type="submit" class="btn btn-block btn-registration " value="add">
                    Зарегистрироваться
                </button>
            </div>
        </div>
    </form>
</div>
<sec:authorize access="!isAuthenticated()">
    <script language="javascript">
        location.replace("index.jsp");
    </script>
</sec:authorize>
</body>
</html>