$(document).ready(function() {
    $('#createCustomerSave').click(function() {
        var customerName = $('#recipientNameSave').val();
        var res = {name: $('#recipientNameSave').val()};
        if (customerName === '') {
            $("#dialogErr").text("Please enter name.");
        } else {
            $.ajax({
                url: './api/customer/',
                type: 'POST',
                data: JSON.stringify(res),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function(data) {
                    $("#closeCustomerDialog").click();
                    $("#dialogErr").text("");
                    window.location.href = "./home.jsp?page=customer";
                }
            });
        }
    });

    $('#customerDeletePanel').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var custId = button.data('whatever'); // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        $('#recipientIdDelete').val(custId);

    });

    $('.customerDel').click(function() {
        var customerId = $('#recipientIdDelete').val();
        $.ajax({
            url: "./api/customer/" + customerId,
            dataType: "json",
            contentType: 'application/json; charset=UTF-8',
            method: "delete",
            success: function(data) {
                window.location.href = "./home.jsp?page=customer";
            }
        });
    });


    $('#customerEditPanel').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var recipient = button.data('whatever'); // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var url = './api/customer/' + recipient;

        $.getJSON(url, function(data) {
            if (!jQuery.isEmptyObject(data)) {
                var custId = data.id;
                var custName = data.name;
                var custDate = data.create_date;
                $('#recipientIdEdit').val(custId);
                $('#recipientCreateDateEdit').val(custDate);
                $('#recipientNameEdit').val(custName);
            }
        });
    });


    $('#editCustomerSave').click(function() {
        var customerName = $('#recipientNameEdit').val();
        var res = {name: $('#recipientNameEdit').val()};
        var customerId = $('#recipientIdEdit').val();
        if (customerName === '') {
            $("#dialogErr").text("Please enter name.");
        } else {
            $.ajax({
                url: './api/customer/' + customerId,
                type: 'PUT',
                data: JSON.stringify(res),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function(data) {
                    $("#closeCustomerDialog").click();
                    $("#dialogErr").text("");
                    window.location.href = "./home.jsp?page=customer";
                }
            });
        }
    });




});
