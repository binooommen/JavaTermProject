$(document).ready(function() {
    $('#createSaleSave').click(function() {
        var saleCustomer = $('#saleCustomerSave').val();
        var saleProduct = $('#saleProductSave').val();
        var saleQuantity = $('#saleQuantitySave').val();
        var saleTotal = $('#saleTotalSave').val();
        var avaliableQuantity = $('#saleAvaliableQuantitySave').val();
        var res = {customer_id: $('#saleCustomerSave').val(), product_id: $('#saleProductSave').val(),
            quantity: $('#saleQuantitySave').val(), total: $('#saleTotalSave').val(), note: "note"};
        if (saleCustomer === '' && saleProduct === '' && saleQuantity === '' && saleTotal === '') {
            $("#dialogSaleErr").text("All fields are required.");
        }
        else if (parseInt(saleQuantity) <= 0) {
            $("#dialogSaleErr").text("You cannot enter an invalid quantity.");
        }
        else if (parseInt(saleQuantity) > parseInt(avaliableQuantity)) {
            $("#dialogSaleErr").text("Only " + avaliableQuantity + " products available.");
        }
        else {
            $.ajax({
                url: './api/sale/',
                type: 'POST',
                data: JSON.stringify(res),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function(data) {
                    $("#closeSaleDialog").click();
                    $("#dialogSaleErr").text("");
                    window.location.href = "./home.jsp?page=sale";
                }
            });
        }
    });

    $('#saleDeletePanel').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var saleId = button.data('whatever'); // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        $('#saleIdDelete').val(saleId);

    });

    $('.saleDel').click(function() {
        var saleId = $('#saleIdDelete').val();
        $.ajax({
            url: "./api/sale/" + saleId,
            dataType: "json",
            contentType: 'application/json; charset=UTF-8',
            method: "delete",
            success: function(data) {
                window.location.href = "./home.jsp?page=sale";
            }
        });
    });


    $('#saleEditPanel').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var recipient = button.data('whatever'); // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var url = './api/sale/' + recipient;

        $.getJSON(url, function(data) {
            if (!jQuery.isEmptyObject(data)) {
                var saleId = data.id;
                var saleCustomer = data.customer_id;
                var saleDate = data.create_date;
                var saleProduct = data.product_id;
                var saleQuantity = data.quantity;
                var saleTotal = data.total;
                $('#saleIdEdit').val(saleId);
                $('#saleCreateDateEdit').val(saleDate);
                $('#saleCustomerEdit').val(saleCustomer);
                $('#saleProductEdit').val(saleProduct);
                $('#saleQuantityEdit').val(saleQuantity);
                $('#saleTotalEdit').val(saleTotal);
            }
        });
    });


    $('#editSaleSave').click(function() {
        var saleCustomer = $('#saleCustomerEdit').val();
        var saleProduct = $('#saleProductEdit').val();
        var saleQuantity = $('#saleQuantityEdit').val();
        var saleTotal = $('#saleTotalEdit').val();

        var res = {customer_id: $('#saleCustomerEdit').val(), product_id: $('#saleProductEdit').val(),
            quantity: $('#saleQuantityEdit').val(), total: $('#saleTotalEdit').val(), note: "note"};
        var saleId = $('#saleIdEdit').val();
        if (saleCustomer === '' && saleProduct === '' && saleQuantity === '' && saleTotal === '') {
            $("#dialogSaleErr").text("All fields are required.");
        } else {
            $.ajax({
                url: './api/sale/' + saleId,
                type: 'PUT',
                data: JSON.stringify(res),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function(data) {
                    $("#closeSaleDialog").click();
                    $("#dialogSaleErr").text("");
                    window.location.href = "./home.jsp?page=sale";
                }
            });
        }
    });


    $("#saleProductSave").change(function() {
        var sale_product_id = $(this).children(":selected").attr("value");
        var url = './api/product/' + sale_product_id;
        $.getJSON(url, function(data) {
            if (!jQuery.isEmptyObject(data)) {
                var productSale = data.list_price;
                var avaliableQuantity = data.quantity_available;
                $('#saleSalePriceSave').val(productSale);
                $('#saleAvaliableQuantitySave').val(avaliableQuantity);
            }
        });
    });


    $("#saleQuantitySave").change(function() {
        var qty = $(this).val();
        var productSale = $('#saleSalePriceSave').val();
        var avaliableQuantity = $('#saleAvaliableQuantitySave').val();
        if (parseInt(qty) !== 0) {
            if (parseInt(qty) <= parseInt(avaliableQuantity)) {
                $('#saleTotalSave').val(qty * productSale);
                $("#dialogSaleErr").text("");
            } else {
                $("#dialogSaleErr").text("Only " + avaliableQuantity + " products available.");
            }
        }else{
            $("#dialogSaleErr").text("");
        }
    });


});
