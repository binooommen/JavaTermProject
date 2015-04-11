<%-- 
    Document   : login
    Created on : 6-Apr-2015, 11:18:08 PM
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
        <script src="js/home.js"></script>
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

                    <!--<form role="form" id="home-form" action="homeServlet" method="post">-->
                    <div class="col-md-3">
                        <ul class="nav nav-pills nav-stacked">
                            <li >
                                <a data-toggle="tab" href="#home">
                                    <span class="glyphicon glyphicon-home"></span>&nbsp; Home
                                </a>
                            </li>
                            <li class="active">
                                <a data-toggle="tab" href="#customer">
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
                        <!--home tab data-->
                        <div class="tab-pane " id="home">
                            <div class="col-md-9"> 
                                <div class="well well-sm">
                                    My home
                                </div>
                            </div>
                        </div>
                        <!--home tab data ends-->
                        <!--customer tab data-->
                        <div class="tab-pane active" id="customer">
                            <div class="col-md-9" > 
                                <div class="tab-content">
                                    <div class="panel panel-default tab-pane active" id="customerPanel">
                                        <div class="panel-heading">
                                            <a  data-toggle="modal" href="#customerCreatePanel">
                                                <button type="button" class="btn btn-success">Create</button>
                                            </a>
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
                                                <td>
                                                    <%=c.getCreate_date()%>
                                                    <div class="btn-group" role="group" style="float:right">
                                                        <button  type="button" id="<%=c.getId()%>" class="btn btn-warning customerEdit" 
                                                                 data-toggle="modal" data-target="#customerEditPanel" data-whatever="<%=c.getId()%>">
                                                            Edit
                                                        </button>
                                                        <button  type="button" id="<%=c.getId()%>" class="btn btn-danger"
                                                                 data-toggle="modal" data-target="#customerDeletePanel" data-whatever="<%=c.getId()%>">
                                                            Delete
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <% }%>
                                        </tbody>
                                    </table>
                                </div> 
                                <!--Modal dialog box for create customer-->
                                <div class="modal fade" id="customerCreatePanel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title" id="exampleModalLabel">Create Customer</h4>
                                            </div>
                                            <div class="modal-body">
                                                <div class="form-group">
                                                    <label for="recipient-name" class="control-label">Name</label>
                                                    <input type="text" class="form-control" id="recipientNameSave">
                                                </div>
                                                <div class="form-group">
                                                    <span class="control-label" style="color:red;" id="dialogErr"></span>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal" id="closeCustomerDialog">Close</button>
                                                <button type="button" class="btn btn-primary" id="createCustomerSave">Save</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--Modal dialog box for create customer Ends-->
                                <!--Modal dialog box for edit customer-->
                                <div class="modal fade" id="customerEditPanel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title" id="exampleModalLabel">Edit Customer</h4>
                                            </div>
                                            <div class="modal-body">
                                                <div class="form-group">
                                                    <label for="recipientIdEdit" class="control-label">Id</label>
                                                    <input type="text" class="form-control" id="recipientIdEdit" readonly="true">
                                                </div>
                                                <div class="form-group">
                                                    <label for="recipientCreateDateEdit" class="control-label">Create Date</label>
                                                    <input type="text" class="form-control" id="recipientCreateDateEdit" readonly="true">
                                                </div>
                                                <div class="form-group">
                                                    <label for="recipientNameEdit" class="control-label">Name</label>
                                                    <input type="text" class="form-control" id="recipientNameEdit">
                                                </div>
                                                <div class="form-group">
                                                    <span class="control-label" style="color:red;" id="dialogErr"></span>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal" id="closeCustomerDialog">Close</button>
                                                <button type="button" class="btn btn-primary" id="editCustomerSave">Save</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--Modal dialog box for edit customer ends-->
                                <!--Modal dialog box for delete customer-->
                                <div class="modal fade" id="customerDeletePanel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title" id="exampleModalLabel">Delete Customer</h4>
                                            </div>
                                            <div class="modal-body">
                                                <div class="form-group">
                                                    <input type="hidden" class="form-control" id="recipientIdDelete" >
                                                </div>
                                                <div class="form-group">
                                                    <span class="control-label" style="color:red;" id="deleteDialogErr">Are you sure</span>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal" id="closeCustomerDialog">Close</button>
                                                <button type="button" class="btn btn-danger customerDel" id="deleteCustomerSave">Delete</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--Modal dialog box for delete customer ends-->
                            </div> 
                        </div>
                    </div>
                    <!--customer tab data-->
                    <!--product tab data-->
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
                    <!--product tab data ends-->
                    <!--sale tab data-->
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
                    <!--sale tab data ends-->
                    <!--purchase tab data-->
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
                    <!--purchase tab data ends-->
                </div>
                <!--</form>-->
            </div> 
        </section>
    </body>
</html>

