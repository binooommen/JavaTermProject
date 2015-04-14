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
        <script src="js/product.js"></script>
        <script src="js/sale.js"></script>
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
                                                    <span class="control-label" id="deleteDialogErr">Are you sure?</span>
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
                                    <a data-toggle="modal" href="#productCreatePanel">
                                        <button type="button" class="btn btn-success">Create</button>
                                    </a>
                                </div>
                                <table id="product_tbl" class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Cost price</th>
                                            <th>Sale price</th>
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
                                            <td>
                                                <%=p.getCreate_date()%>
                                                <div class="btn-group" role="group" style="float:right">
                                                    <button  type="button" id="<%=p.getId()%>" class="btn btn-warning productEdit" 
                                                             data-toggle="modal" data-target="#productEditPanel" data-whatever="<%=p.getId()%>">
                                                        Edit
                                                    </button>
                                                    <button  type="button" id="<%=p.getId()%>" class="btn btn-danger"
                                                             data-toggle="modal" data-target="#productDeletePanel" data-whatever="<%=p.getId()%>">
                                                        Delete
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                        <% }%>
                                    </tbody>
                                </table>
                            </div>

                            <!--Modal dialog box for create product-->
                            <div class="modal fade" id="productCreatePanel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="exampleModalLabel">Create Product</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label for="productNameSave" class="control-label">Name</label>
                                                <input type="text" class="form-control" id="productNameSave">
                                            </div>
                                            <div class="form-group">
                                                <label for="productCostSave" class="control-label">Cost Price</label>
                                                <input type="text" class="form-control" id="productCostSave">
                                            </div>
                                            <div class="form-group">
                                                <label for="productSaleSave" class="control-label">Sale price</label>
                                                <input type="text" class="form-control" id="productSaleSave">
                                            </div>

                                            <div class="form-group">
                                                <span class="control-label" style="color:red;" id="dialogProdErr"></span>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal" id="closeProductDialog">Close</button>
                                            <button type="button" class="btn btn-primary" id="createProductSave">Save</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--Modal dialog box for create product Ends-->
                            <!--Modal dialog box for edit product-->
                            <div class="modal fade" id="productEditPanel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="exampleModalLabel">Edit Product</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label for="productIdEdit" class="control-label">Id</label>
                                                <input type="text" class="form-control" id="productIdEdit" readonly="true">
                                            </div>
                                            <div class="form-group">
                                                <label for="productCreateDateEdit" class="control-label">Create Date</label>
                                                <input type="text" class="form-control" id="productCreateDateEdit" readonly="true">
                                            </div>
                                            <div class="form-group">
                                                <label for="productNameEdit" class="control-label">Name</label>
                                                <input type="text" class="form-control" id="productNameEdit">
                                            </div>
                                            <div class="form-group">
                                                <label for="productCostEdit" class="control-label">Cost Price</label>
                                                <input type="text" class="form-control" id="productCostEdit">
                                            </div>
                                            <div class="form-group">
                                                <label for="productSaleEdit" class="control-label">Sale price</label>
                                                <input type="text" class="form-control" id="productSaleEdit">
                                            </div>
                                            <div class="form-group">
                                                <span class="control-label" style="color:red;" id="dialogProdErr"></span>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal" id="closeProductDialog">Close</button>
                                            <button type="button" class="btn btn-primary" id="editProductSave">Save</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--Modal dialog box for edit product ends-->
                            <!--Modal dialog box for delete product-->
                            <div class="modal fade" id="productDeletePanel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="exampleModalLabel">Delete Product</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <input type="hidden" class="form-control" id="productIdDelete" >
                                            </div>
                                            <div class="form-group">
                                                <span class="control-label" id="deleteDialogErr">Are you sure?</span>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal" id="closeProductDialog">Close</button>
                                            <button type="button" class="btn btn-danger productDel" id="deleteProductSave">Delete</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--Modal dialog box for delete product ends-->
                        </div>
                    </div>
                    <!--sale tab data-->
                    <div class="tab-pane" id="sale">
                        <div class="col-md-9" > 
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <a data-toggle="modal" href="#saleCreatePanel">
                                        <button type="button" class="btn btn-success">Create</button>
                                    </a>
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
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            qr = "SELECT s.id as 'id', s.create_date as 'create_date', customer_id, product_id, "
                                                    + "quantity, total, note, c.name as 'customer_name', p.name as 'product_name' "
                                                    + "FROM sale s left join product p on s.product_id = p.id "
                                                    + "left join customer c on s.customer_id = c.id;";
                                            homeBean.setSaleData(qr);
                                            List<Sale> Lsale = homeBean.getListOfSale();
                                            for (int i = 0; i < Lsale.size(); i += 1) {
                                                Sale s = Lsale.get(i);
                                        %>
                                        <tr>      
                                            <td><%=s.getId()%></td>
                                            <td><%=s.getCreate_date()%></td>
                                            <td><%=s.getCustomer_name()%></td>
                                            <td><%=s.getProduct_name()%></td>
                                            <td><%=s.getQuantity()%></td>
                                            <td><%=s.getTotal()%>
                                                <div class="btn-group" role="group" style="float:right">
                                                    <!--                                                    <button  type="button" id="" class="btn btn-warning productEdit" 
                                                                                                                 data-toggle="modal" data-target="#saleEditPanel" data-whatever="">
                                                                                                            Edit
                                                                                                        </button>-->
                                                    <button  type="button" id="<%=s.getId()%>" class="btn btn-danger"
                                                             data-toggle="modal" data-target="#saleDeletePanel" data-whatever="<%=s.getId()%>">
                                                        Delete
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                        <% }%>
                                    </tbody>
                                </table>
                            </div>

                            <!--Modal dialog box for create sale-->
                            <div class="modal fade" id="saleCreatePanel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="exampleModalLabel">Create Sale</h4>
                                        </div>

                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label for="saleCustomerSave" class="control-label">Customer</label>
                                                <select class="form-control" id="saleCustomerSave">
                                                    <option></option>
                                                    <%
                                                        for (int i = 0; i < Lcust.size(); i += 1) {
                                                            Customer c = Lcust.get(i);
                                                    %>
                                                    <option id="<%=c.getId()%>" value="<%=c.getId()%>"><%=c.getName()%></option>
                                                    <% }%>
                                                </select>

                                            </div>

                                            <div class="form-group">
                                                <label for="saleProductSave" class="control-label">Product</label>
                                                <select class="form-control" id="saleProductSave">
                                                    <option></option>
                                                    <%
                                                        for (int i = 0; i < Lprod.size(); i += 1) {
                                                            Product p = Lprod.get(i);
                                                    %>
                                                    <option id="<%=p.getId()%>" value="<%=p.getId()%>"><%=p.getName()%></option>
                                                    <% }%>
                                                </select>
                                            </div>

                                            <div class="form-group">
                                                <label for="saleAvaliableQuantitySave" class="control-label">Available Quantity</label>
                                                <input type="text" class="form-control" id="saleAvaliableQuantitySave" readonly="true">
                                            </div>

                                            <div class="form-group">
                                                <label for="saleQuantitySave" class="control-label">Quantity</label>
                                                <input type="text" class="form-control" id="saleQuantitySave">
                                            </div>

                                            <div class="form-group">
                                                <label for="saleSalePriceSave" class="control-label">Sale Price</label>
                                                <input type="text" class="form-control" id="saleSalePriceSave" readonly="true">
                                            </div>

                                            <div class="form-group">
                                                <label for="saleTotalSave" class="control-label">Total</label>
                                                <input type="text" class="form-control" id="saleTotalSave" readonly="true">
                                            </div>

                                            <div class="form-group">
                                                <span class="control-label" style="color:red;" id="dialogSaleErr"></span>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal" id="closeSaleDialog">Close</button>
                                            <button type="button" class="btn btn-primary" id="createSaleSave">Save</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--Modal dialog box for create sale Ends-->
                            <!--Modal dialog box for edit sale-->
                            <div class="modal fade" id="saleEditPanel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="exampleModalLabel">Edit Sale</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label for="saleIdEdit" class="control-label">Id</label>
                                                <input type="text" class="form-control" id="saleIdEdit" readonly="true">
                                            </div>
                                            <div class="form-group">
                                                <label for="saleCreateDateEdit" class="control-label">Create Date</label>
                                                <input type="text" class="form-control" id="saleCreateDateEdit" readonly="true">
                                            </div>
                                            <div class="form-group">
                                                <label for="saleCustomerEdit" class="control-label">Customer</label>
                                                <input type="text" class="form-control" id="saleCustomerEdit">
                                            </div>

                                            <div class="form-group">
                                                <label for="saleProductEdit" class="control-label">Product</label>
                                                <input type="text" class="form-control" id="saleProductEdit">
                                            </div>

                                            <div class="form-group">
                                                <label for="saleQuantityEdit" class="control-label">Quantity</label>
                                                <input type="text" class="form-control" id="saleQuantityEdit">
                                            </div>

                                            <div class="form-group">
                                                <label for="saleTotalEdit" class="control-label">Total</label>
                                                <input type="text" class="form-control" id="saleTotalEdit">
                                            </div>

                                            <div class="form-group">
                                                <span class="control-label" style="color:red;" id="dialogSaleErr"></span>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal" id="closeSaleDialog">Close</button>
                                            <button type="button" class="btn btn-primary" id="editSaleSave">Save</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--Modal dialog box for edit sale ends-->
                            <!--Modal dialog box for delete sale-->
                            <div class="modal fade" id="saleDeletePanel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="exampleModalLabel">Delete Sale</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <input type="hidden" class="form-control" id="saleIdDelete" >
                                            </div>
                                            <div class="form-group">
                                                <span class="control-label" id="deleteDialogErr">Are you sure?</span>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal" id="closeSaleDialog">Close</button>
                                            <button type="button" class="btn btn-danger saleDel" id="deleteSaleSave">Delete</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--Modal dialog box for delete sale ends-->
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

