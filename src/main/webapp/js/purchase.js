$(document).ready(function() {
    $('#createPurchaseSave').click(function() {
        var purchaseProduct = $('#purchaseProductSave').val();
        var purchaseQuantity = $('#purchaseQuantitySave').val();
        var purchaseTotal = $('#purchaseTotalSave').val();
        var res = {product_id: $('#purchaseProductSave').val(),
            quantity: $('#purchaseQuantitySave').val(), total: $('#purchaseTotalSave').val(), note: "note"};
        if (purchaseProduct === '' && purchaseQuantity === '' && purchaseTotal === '') {
            $("#dialogPurchaseErr").text("All fields are required.");
        }
        else if (parseInt(purchaseQuantity) <= 0) {
            $("#dialogPurchaseErr").text("You cannot enter an invalid quantity.");
        }
        else {
            $.ajax({
                url: './api/purchase/',
                type: 'POST',
                data: JSON.stringify(res),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function(data) {
                    $("#closePurchaseDialog").click();
                    $("#dialogPurchaseErr").text("");
                    window.location.href = "./home.jsp?page=purchase";
                }
            });
        }
    });

    $('#purchaseDeletePanel').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var purchaseId = button.data('whatever'); // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        $('#purchaseIdDelete').val(purchaseId);

    });

    $('.purchaseDel').click(function() {
        var purchaseId = $('#purchaseIdDelete').val();
        $.ajax({
            url: "./api/purchase/" + purchaseId,
            dataType: "json",
            contentType: 'application/json; charset=UTF-8',
            method: "delete",
            success: function(data) {
                window.location.href = "./home.jsp?page=purchase";
            }
        });
    });


    $('#purchaseEditPanel').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var recipient = button.data('whatever'); // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var url = './api/purchase/' + recipient;

        $.getJSON(url, function(data) {
            if (!jQuery.isEmptyObject(data)) {
                var purchaseId = data.id;
                var purchaseDate = data.create_date;
                var purchaseProduct = data.product_id;
                var purchaseQuantity = data.quantity;
                var purchaseTotal = data.total;
                $('#purchaseIdEdit').val(purchaseId);
                $('#purchaseCreateDateEdit').val(purchaseDate);
                $('#purchaseProductEdit').val(purchaseProduct);
                $('#purchaseQuantityEdit').val(purchaseQuantity);
                $('#purchaseTotalEdit').val(purchaseTotal);
            }
        });
    });


    $('#editPurchaseSave').click(function() {
        var purchaseProduct = $('#purchaseProductEdit').val();
        var purchaseQuantity = $('#purchaseQuantityEdit').val();
        var purchaseTotal = $('#purchaseTotalEdit').val();

        var res = {product_id: $('#purchaseProductEdit').val(),
            quantity: $('#purchaseQuantityEdit').val(), total: $('#purchaseTotalEdit').val(), note: "note"};
        var purchaseId = $('#purchaseIdEdit').val();
        if (purchaseProduct === '' && purchaseQuantity === '' && purchaseTotal === '') {
            $("#dialogPurchaseErr").text("All fields are required.");
        } else {
            $.ajax({
                url: './api/purchase/' + purchaseId,
                type: 'PUT',
                data: JSON.stringify(res),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function(data) {
                    $("#closePurchaseDialog").click();
                    $("#dialogPurchaseErr").text("");
                    window.location.href = "./home.jsp?page=purchase";
                }
            });
        }
    });


    $("#purchaseProductSave").change(function() {
        var purchase_product_id = $(this).children(":selected").attr("value");
        var url = './api/product/' + purchase_product_id;
        $.getJSON(url, function(data) {
            if (!jQuery.isEmptyObject(data)) {
                var productCost = data.cost_price;
                var avaliableQuantity = data.quantity_available;
                $('#purchaseCostPriceSave').val(productCost);
                $('#purchaseAvaliableQuantitySave').val(avaliableQuantity);
            }
        });
    });



    $("#purchaseQuantitySave").change(function() {
        var qty = $(this).val();
        var purchaseCost = $('#purchaseCostPriceSave').val();
        if (parseInt(qty) >= 0) {
            $('#purchaseTotalSave').val(qty * purchaseCost);
            $("#dialogPurchaseErr").text("");
        } else {
            $("#dialogPurchaseErr").text("Please enter a valid quantity");
        }
    });

});
