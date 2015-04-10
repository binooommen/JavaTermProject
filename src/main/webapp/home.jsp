<%-- 
    Document   : login
    Created on : 6-Apr-2015, 11:18:08 PM
    Author     : c0647015
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="bean.home"%>
<!DOCTYPE html>
<html>
    <head>
        <title>SellEasyERP</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

        <link href='css/default_style.css' type="text/css"/>
    </head>
    <body>
        <jsp:useBean id="homeBean" scope="request" class="bean.home"></jsp:useBean>
        <section>
            <div class="container">
                <div class="jumbotron">
                    <h1>SellEasyERP</h1>      
                    <p>Manage your business better...</p>      
                </div>
                
                <form role="form" id="home-form" action="homeServlet" method="post">
                    <div class="col-md-3">
                        <ul class="nav nav-pills nav-stacked">
                            <li class="active">
                                <a data-toggle="tab" href="#home">
                                    <span class="glyphicon glyphicon-home"></span>&nbsp; Home
                                </a>
                            </li>
                            <li><a data-toggle="tab" href="#customer">
                                    <span class="glyphicon glyphicon-user"></span>&nbsp; Customer
                                </a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#product">
                                    <span class="glyphicon glyphicon-gift"></span>&nbsp; Product
                                </a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#sale">
                                    <span class="glyphicon glyphicon-shopping-cart"></span>&nbsp; Sale
                                </a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#purchase">
                                    <span class="glyphicon glyphicon-folder-open"></span>&nbsp; Purchase
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane active" id="home">
                            <div class="col-md-9"> 
                                <div class="well well-sm">
                                    My home
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="customer">
                            <div class="col-md-9" > 
                                <div class="panel panel-default">
                                    <div class="panel-heading">Customers</div>
                                    <table id="customer_tbl" class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Create Date</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Mark</td>
                                                <td>01/03/15</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>John</td>
                                                <td>12/12/12</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="product">
                            <div class="col-md-9" > 
                                <div class="panel panel-default">
                                    <div class="panel-heading">Product</div>
                                    <table id="product_tbl" class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Cost price</th>
                                                <th>Sale price</th>
                                                <th>description</th>
                                                <th>Create Date</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Nokia Lumia 520</td>
                                                <td>400</td>
                                                <td>500</td>
                                                <td>good product</td>
                                                <td>01/03/15</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Iphone 6</td>
                                                <td>700</td>
                                                <td>900</td>
                                                <td>best phone</td>
                                                <td>12/12/12</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="sale">
                            <div class="col-md-9" > 
                                <div class="panel panel-default">
                                    <div class="panel-heading">Sale</div>
                                    <table id="sale_tbl" class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Create Date</th>
                                                <th>Customer</th>
                                                <th>Product</th>
                                                <th>Quantity</th>
                                                <th>total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>01/03/15</td>
                                                <td>John</td>
                                                <td>Iphone6</td>
                                                <td>2</td>
                                                <td>1800</td>
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td>03/03/15</td>
                                                <td>Mark</td>
                                                <td>Nokia lumia</td>
                                                <td>3</td>
                                                <td>1000</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="purchase">
                            <div class="col-md-9" > 
                                <div class="panel panel-default">
                                    <div class="panel-heading">Purchase</div>
                                    <table id="purchase_tbl" class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Product</th>
                                                <th>Quantity</th>
                                                <th>Total</th>
                                                <th>note</th>
                                                <th>Create Date</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Nokia Lumia 520</td>
                                                <td>4</td>
                                                <td>2000</td>
                                                <td>good product</td>
                                                <td>01/03/15</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Iphone 6</td>
                                                <td>3</td>
                                                <td>900</td>
                                                <td>best phone</td>
                                                <td>12/12/12</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div> 
        </section>
    </body>
</html>

