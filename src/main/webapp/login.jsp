<%-- 
    Document   : login
    Created on : 6-Apr-2015, 11:18:08 PM
    Author     : c0647015
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="bean.login"%>
<!DOCTYPE html>
<html>
    <head>
        <title>SimpleERP</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

        <link href='css/default_style.css' type="text/css"/>
        <!--<script src="js/login.js"></script>-->
    </head>
    <body>
        <jsp:useBean id="login" scope="request" class="bean.login"></jsp:useBean>
        <section>
            <div class="container">
                <h1 class="page-header">SellEasyERP</h1> 
                <h2>Admin Login</h2>
                <form role="form" id="login-form" action="loginServlet" method="post">
                    <div class="input-group">
                        <span class="input-group-addon" id="sizing-addon2">Username</span>
                        <input type="text" class="form-control" id="username" name="username" 
                               placeholder="Username" aria-describedby="sizing-addon2">
                    </div>
                    <br>
                    <div class="input-group">
                        <span class="input-group-addon" id="sizing-addon2">Password</span>
                        <input type="password" class="form-control" id="password" name="password" 
                               placeholder="Password" aria-describedby="sizing-addon2">
                    </div>
                    <div class="input-group">
                        <span style="color:red;" name="errorMsg" id="errorMsg" >
                            <jsp:getProperty name="login" property="errorMsg"/>
                        </span>
                    </div>
                    <br>
                    <div class="input-group">
                        <input class="btn btn-default btn-lg btn-block" id="login-bt" name="login-bt" type="submit" value="Submit">
                    </div>
                </form>
            </div> 
        </section>
    </body>
</html>

