$(document).ready(function() {
    $('#createProductSave').click(function() {
        var productName = $('#productNameSave').val();
        var productCost = $('#productCostSave').val();
        var productSale = $('#productSaleSave').val();
        var res = {name: $('#productNameSave').val(), cost_price: $('#productCostSave').val(),
            list_price: $('#productSaleSave').val(), description: "description"};
        if (productName === '' || productCost === '' || productSale === '') {
            $("#dialogProdErr").text("All fields are required.");
        } else {
            $.ajax({
                url: './api/product/',
                type: 'POST',
                data: JSON.stringify(res),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function(data) {
                    $("#closeProductDialog").click();
                    $("#dialogProdErr").text("");
                    window.location.href = "./home.jsp";
                }
            });
        }
    });

    $('#productDeletePanel').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var prodId = button.data('whatever'); // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        $('#productIdDelete').val(prodId);

    });

    $('.productDel').click(function() {
        var productId = $('#productIdDelete').val();
        $.ajax({
            url: "./api/product/" + productId,
            dataType: "json",
            contentType: 'application/json; charset=UTF-8',
            method: "delete",
            success: function(data) {
                window.location.href = "./home.jsp";
            }
        });
    });


    $('#productEditPanel').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var recipient = button.data('whatever'); // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var url = './api/product/' + recipient;

        $.getJSON(url, function(data) {
            if (!jQuery.isEmptyObject(data)) {
                var productId = data.id;
                var productName = data.name;
                var productDate = data.create_date;
                var productCost = data.cost_price;
                var productSale = data.list_price;
                $('#productIdEdit').val(productId);
                $('#productCreateDateEdit').val(productDate);
                $('#productNameEdit').val(productName);
                $('#productCostEdit').val(productCost);
                $('#productSaleEdit').val(productSale);
            }
        });
    });


    $('#editProductSave').click(function() {
        var productName = $('#productNameEdit').val();
        var productCost = $('#productCostEdit').val();
        var productSale = $('#productSaleEdit').val();
        var res = {name: $('#productNameEdit').val(), cost_price: $('#productCostEdit').val(),
            list_price: $('#productSaleEdit').val(), description: "description"};
        var customerId = $('#productIdEdit').val();
        if (productName === '' || productCost === '' || productSale === '') {
            $("#dialogProdErr").text("All fields are required.");
        } else {
            $.ajax({
                url: './api/product/' + customerId,
                type: 'PUT',
                data: JSON.stringify(res),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function(data) {
                    $("#closeProductDialog").click();
                    $("#dialogErr").text("");
                    window.location.href = "./home.jsp";
                }
            });
        }
    });




});
