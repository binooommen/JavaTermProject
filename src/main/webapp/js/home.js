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
                    window.location.href = "./home.jsp";
                }
            });
        }
    });



    $('.customerDel').click(function() {
        var customerId = $(this).attr('id');
        $.ajax({
            url: "./api/customer/" + customerId,
            dataType: "json",
            contentType: 'application/json; charset=UTF-8',
            method: "delete",
            success: function(data) {
                window.location.href = "./home.jsp";
            }
        });
    });

});
