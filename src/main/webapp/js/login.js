$(document).ready(function() {
    $('#login-bt').click(function() {
        var username = $('#username').val();
        var password = $('#password').val();
        if (username === 'admin' || password === 'admin') {
            window.location.href = "user.html";
        } else if (username === '' && password === '') {
            $("#errorMsg").text("Please enter both username and password.");
        }
        else if (username === '') {
            $("#errorMsg").text("Please enter both username.");
        }
        else if (password === '') {
            $("#errorMsg").text("Please enter password.");
        }
        else {
            $("#errorMsg").text("Login failed.");
        }
    });

});
