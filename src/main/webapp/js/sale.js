$(document).ready(function() {
    $('#createSaleSave').click(function() {
        var saleName = $('#saleNameSave').val();
        var res = {name: $('#saleNameSave').val()};
        if (saleName === '') {
            $("#dialogErr").text("Please enter name.");
        } else {
            $.ajax({
                url: './api/sale/',
                type: 'POST',
                data: JSON.stringify(res),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function(data) {
                    $("#closeSaleDialog").click();
                    $("#dialogErr").text("");
                    window.location.href = "./home.jsp";
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
                window.location.href = "./home.jsp";
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
                var saleName = data.name;
                var saleDate = data.create_date;
                $('#saleIdEdit').val(saleId);
                $('#saleCreateDateEdit').val(saleName);
                $('#saleNameEdit').val(saleDate);
            }
        });
    });


    $('#editSaleSave').click(function() {
        var saleName = $('#saleNameEdit').val();
        var res = {name: $('#saleNameEdit').val()};
        var customerId = $('#saleIdEdit').val();
        if (saleName === '') {
            $("#dialogErr").text("Please enter name.");
        } else {
            $.ajax({
                url: './api/sale/' + customerId,
                type: 'PUT',
                data: JSON.stringify(res),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function(data) {
                    $("#closeSaleDialog").click();
                    $("#dialogErr").text("");
                    window.location.href = "./home.jsp";
                }
            });
        }
    });




});
