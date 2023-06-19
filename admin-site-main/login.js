function checkLogin() {
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    if (username === "admin" && password === "1234") {
        alert("Login Successful!");
        window.location.href = "dasboard.html";
    } else {
        alert("Invalid Username or Password!");
    }
}