$(document).ready(function() {
    $('#createProductSave').click(function() {
        var productName = $('#productNameSave').val();
        var res = {name: $('#productNameSave').val()};
        if (productName === '') {
            $("#dialogErr").text("Please enter name.");
        } else {
            $.ajax({
                url: './api/product/',
                type: 'POST',
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

    $('#productDeletePanel').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var custId = button.data('whatever'); // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        $('#productIdDelete').val(custId);

    });

    $('.productDel').click(function() {
        var customerId = $('#productIdDelete').val();
        $.ajax({
            url: "./api/product/" + customerId,
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
                $('#productIdEdit').val(productId);
                $('#productCreateDateEdit').val(productDate);
                $('#productNameEdit').val(productName);
            }
        });
    });


    $('#editProductSave').click(function() {
        var customerName = $('#productNameEdit').val();
        var res = {name: $('#productNameEdit').val()};
        var customerId = $('#productIdEdit').val();
        if (customerName === '') {
            $("#dialogErr").text("Please enter name.");
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
