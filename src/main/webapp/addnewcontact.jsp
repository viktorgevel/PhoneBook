<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add new contact</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
        .body {
            background: rgba(0, 255, 0, 0.05);
        }
        .container {
            min-width: 480px;
            max-width: 1280px;
            background-color: rgba(0, 128, 0, 0.1);
            border-radius: 15px;
            margin-top: 1%;
            padding: 1%;
        }
        .legend{
            margin-bottom: 3%;
            border-bottom: solid;
            border-bottom-color: darkgreen;
            text-align: center;
        }
        .form-control {
            background: rgba(0, 255, 0, 0.1);
        }
        .btn-addcontact {
            background: forestgreen;
            margin-top: 2%;
            font: bold 140% djvu-sans;
            color: white;

        }
    </style>
</head>
<body class="body">
<div class="container">
    <h3 class="legend">
        Добавление нового контакта<br><br>
    </h3>
    <form class="form-horizontal" role="form" action="addnewcontacttodatabase" method="post">
        <div class="form-group">
            <label for="firstname" class="col-sm-3 control-label" >
                Фамилия
            </label>
            <div class="col-sm-7">
                <input type="text" class="form-control" id="firstname" required minlength=4 placeholder="Введите фамилию (минимум 4 символа)" name="firstName"/>
            </div>
        </div>
        <div class="form-group">
            <label for="secondname" class="col-sm-3 control-label">
                Имя
            </label>
            <div class="col-sm-7">
                <input type="text" class="form-control" id="secondname" required minlength=4 placeholder="Введите имя (минимум 4 символа)" name="secondName"/>
            </div>
        </div>
        <div class="form-group">
            <label for="patronymic" class="col-sm-3 control-label">
                Отчество
            </label>
            <div class="col-sm-7">
                <input type="text" class="form-control" id="patronymic" required minlength=4 placeholder="Введите отчество (минимум 4 символа)" name="patronymic"/>
            </div>
        </div>
        <div class="form-group">
            <label for="mobilephone" class="col-sm-3 control-label">
                Мобильный телефон
            </label>
            <div class="col-sm-7">
                <input type="text" class="form-control" id="mobilephone" required
                       placeholder="Введите мобильный телефон в формате +380(**)*******"
                       pattern="\+380([0-9]{2})[0-9]{7}" name="phoneMobile"/>
            </div>
        </div>
        <div class="form-group">
            <label for="homephone" class="col-sm-3 control-label">
                Домашний телефон
            </label>
            <div class="col-sm-7">
                <input type="text" class="form-control" id="homephone" required
                       placeholder="Введите домашний телефон в формате +38(***)*******"
                       pattern="\+38([0-9]{3})[0-9]{7}" name="phoneHome"/>
            </div>
        </div>
        <div class="form-group">
            <label for="address" class="col-sm-3 control-label">
                Адрес
            </label>
            <div class="col-sm-7">
                <input type="text" class="form-control" id="address" placeholder="Введите адрес (не обязательно)" value=" " name="address"/>
            </div>
        </div>
        <div class="form-group">
            <label for="email" class="col-sm-3 control-label">
                E-mail
            </label>
            <div class="col-sm-7">
                <input type="email" class="form-control" id="email" placeholder="Введите e-mail (не обязательно)" value=" " name="eMail"/>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-7">
                <button type="submit" class="btn btn-block btn-addcontact" value="add">
                    Добавить контакт
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