<%-- 
    Document   : editCustomer
    Created on : 10-Apr-2015, 3:01:46 PM
    Author     : c0647015
--%>

<%@page import="bean.Purchase"%>
<%@page import="bean.Sale"%>
<%@page import="bean.Product"%>
<%@page import="bean.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
                                        <div class="panel-heading">
                                            <a href="editCustomer.jsp"><button type="button" class="btn btn-success">Create</button></a>
                                        </div>
                                        <table id="customer_tbl" class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Name</th>
                                                    <th>Create Date</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <%
                                                String qr = "select * from customer;";
                                                homeBean.setCustomerData(qr);
                                                List<Customer> Lcust = homeBean.getListOfCustomer();
                                                for (int i = 0; i < Lcust.size(); i += 1) {
                                                    Customer c = Lcust.get(i);
                                            %>
                                            <tr>      
                                                <td><%=c.getId()%></td>
                                                <td><%=c.getName()%></td>
                                                <td><%=c.getCreate_date()%></td>
                                            </tr>
                                            <% }%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="product">
                            <div class="col-md-9" > 
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <button type="button" class="btn btn-success">Create</button>
                                    </div>
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
                                            <%
                                                qr = "select * from product;";
                                                homeBean.setProductData(qr);
                                                List<Product> Lprod = homeBean.getListOfProduct();
                                                for (int i = 0; i < Lprod.size(); i += 1) {
                                                    Product p = Lprod.get(i);
                                            %>
                                            <tr>      
                                                <td><%=p.getId()%></td>
                                                <td><%=p.getName()%></td>
                                                <td><%=p.getCost_price()%></td>
                                                <td><%=p.getList_price()%></td>
                                                <td><%=p.getDescription()%></td>
                                                <td><%=p.getCreate_date()%></td>
                                            </tr>
                                            <% }%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="sale">
                            <div class="col-md-9" > 
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <button type="button" class="btn btn-success">Create</button>
                                    </div>
                                    <table id="sale_tbl" class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Create Date</th>
                                                <th>Customer</th>
                                                <th>Product</th>
                                                <th>Quantity</th>
                                                <th>Total</th>
                                                <th>Note</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                qr = "select * from sale;";
                                                homeBean.setSaleData(qr);
                                                List<Sale> Lsale = homeBean.getListOfSale();
                                                for (int i = 0; i < Lsale.size(); i += 1) {
                                                    Sale p = Lsale.get(i);
                                            %>
                                            <tr>      
                                                <td><%=p.getId()%></td>
                                                <td><%=p.getCreate_date()%></td>
                                                <td><%=p.getCustomer_id()%></td>
                                                <td><%=p.getProduct_id()%></td>
                                                <td><%=p.getQuantity()%></td>
                                                <td><%=p.getTotal()%></td>
                                                <td><%=p.getNote()%></td>
                                            </tr>
                                            <% }%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="purchase">
                            <div class="col-md-9" > 
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <button type="button" class="btn btn-success">Create</button>
                                    </div>
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
                                            <%
                                                qr = "select * from purchase;";
                                                homeBean.setPurchaseData(qr);
                                                List<Purchase> Lpurchase = homeBean.getListOfPurchase();
                                                for (int i = 0; i < Lpurchase.size(); i += 1) {
                                                    Purchase p = Lpurchase.get(i);
                                            %>
                                            <tr>      
                                                <td><%=p.getId()%></td>
                                                <td><%=p.getProduct_id()%></td>
                                                <td><%=p.getQuantity()%></td>
                                                <td><%=p.getTotal()%></td>
                                                <td><%=p.getNote()%></td>
                                                <td><%=p.getCreate_date()%></td>
                                            </tr>
                                            <% }%>
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

