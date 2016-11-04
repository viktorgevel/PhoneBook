<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home page</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
        .head {
            min-width: 480px;
            max-width: 1280px;
            margin-top: 1%;
            padding: 1%;
            border-bottom: solid;
            border-bottom-color: darkgreen;
        }
        .body {
            min-width: 480px;
            max-width: 1280px;
            background-color: rgba(0, 128, 0, 0.11);
            border-radius: 15px;
            margin-top: 1%;
            padding: 1%;
            display: table
        }
        th {
            text-align: center;
        }

        .datagrid table { border-collapse: collapse; text-align: left; width: 100%; }
        .datagrid {font: normal 12px/150% Arial, Helvetica, sans-serif; background: #fff; overflow: hidden;
            border: 1px solid #36752D; -webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; }
        .datagrid table td, .datagrid table th { padding: 3px 10px; }
        .datagrid table thead th {background:-webkit-gradient( linear, left top, left bottom,
        color-stop(0.05, #36752D), color-stop(1, #275420) );filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#36752D',
        endColorstr='#275420');background-color:#36752D; color:#FFFFFF; font-size: 15px; font-weight: bold;}
        .datagrid table tbody td { color: #275420; font-size: 12px;border-bottom: 1px solid #bac7cd;font-weight: normal; }
        .datagrid table tbody .alt td { background: #DFFFDE; color: #275420; }
        .datagrid table tbody td:first-child {border-left: none; }


    </style>
</head>
<body>

<div class="container head">
    <div class="col-md-9">
        <h1 class="text-success" align="center">Ваша телефонная книга</h1>
    </div>
    <div class="col-md-3">
        <form action="addnewcontact.jsp">
            <button type="submit" class='btn-block btn-lg btn-success'>
            Добавить новый контакт
            </button>
        </form>
        <form action="deletecontact">
            <button type="submit" class='btn-block btn-lg btn-danger'>
                Удалить контакт
            </button>
        </form>
    </div>
</div>
<div class="container body datagrid">
    <table class="table">
        <thead class="header">
        <tr>
            <th>Фамилия</th>
            <th>Имя</th>
            <th>Отчество</th>
            <th>Телефон мобильный</th>
            <th>Телефон домашний</th>
            <th>Адрес</th>
            <th>E-mail</th>
        </tr>
        </thead>
        <tbody class="tablebody">
        <c:forEach items="${phonenumbers}" var="phonenumber">
            <tr>
                <td>${phonenumber.firstName}</td>
                <td>${phonenumber.secondName}</td>
                <td>${phonenumber.patronymic}</td>
                <td>${phonenumber.phoneMobile}</td>
                <td>${phonenumber.phoneHome}</td>
                <td>${phonenumber.address}</td>
                <td>${phonenumber.EMail}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<sec:authorize access="!isAuthenticated()">
    <script language="javascript">
        location.replace("index.jsp");
    </script>
</sec:authorize>
</body>
</html>