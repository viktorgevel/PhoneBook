<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete contact</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
        .body {
            background: rgba(240, 0, 0, 0.02);
            display: flex;
            flex-direction: column;
            height: 100%;
            min-width: 240px;
            max-width: 480px;
            margin:0 auto;
        }
        .form-horizontal {
            margin-top: 5%;
            border: darkblue;
            border-width: medium;
        }
        .disabledoption {
            background: darkred;
            font: bold 170% djvu-sans;
            color: white;
        }
        .option {
            font: bold 200% djvu-sans;
        }
        .form-control {
            background: rgba(255, 0, 0, 0.1);
        }
    </style>
</head>
<body class="body">
<form class="form-horizontal" role="form" action="deletesomephonenumber" method="post">
    <div class="form-group">
        <label for="idPhoneNumber" class="col-sm-2 control-label">
            Телефон
        </label>
        <div class="col-sm-10">
            <select class="form-control" id="idPhoneNumber" name="deletePhoneNumberId">
                <c:forEach items="${phonenumbers}" var="phonenumber">
                    <option class="option">${phonenumber.idPhoneNumber}</option>
                    <option disabled class="disabledoption">${phonenumber.name}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-lg btn-block btn-danger">
                Удалить телефонный номер
            </button>
        </div>
    </div>
</form>
<sec:authorize access="!isAuthenticated()">
    <script language="javascript">
        location.replace("index.jsp");
    </script>
</sec:authorize>
</body>
</html>