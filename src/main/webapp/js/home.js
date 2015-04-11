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
                    if (data === "0") {

                    } else {
                        $("#closeCustomerDialog").click();
                        $("#dialogErr").text("");
                        window.location.href = "./home.jsp";

                    }
                }
            });
//            $("#closeCustomerDialog").click();
//            $("#dialogErr").text("");
//            window.location.href = "./home.jsp";
        }
    });

});
