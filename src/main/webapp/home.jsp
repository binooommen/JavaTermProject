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
        <jsp:useBean id="username" scope="request" class="bean.login"></jsp:useBean>
        <section>
            <div class="container">
                <h1 class="page-header">SimpleERP</h1> 
                <h2>Admin Login</h2>
                <form role="form" id="login-form" action="loginServlet">
                    <div class="input-group">
                        <span class="input-group-addon" id="sizing-addon2">Username</span>
                        <input type="text" class="form-control" id="username" 
                               value="<jsp:getProperty name="username" property="username"/>"
                               placeholder="Username" aria-describedby="sizing-addon2">
                    </div>
                    <br>
                    <div class="input-group">
                        <span class="input-group-addon" id="sizing-addon2">Password</span>
                        <input type="password" class="form-control" id="password"  
                               value="<jsp:getProperty name="username" property="password"/>"
                               placeholder="Password" aria-describedby="sizing-addon2">
                    </div>
                    <div class="input-group">
                        <span style="color:red;" id="errorMsg"></span>
                    </div>
                    <br>
                    <div class="input-group">
                        <input class="btn btn-default btn-lg btn-block" id="login-bt" name="login-bt" type="button" value="Submit">
                    </div>
                </form>
            </div> 
        </section>
    </body>
</html>

