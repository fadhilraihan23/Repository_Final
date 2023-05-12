<!DOCTYPE html> 
<html>
  <head>
    <title>Registration Form</title>
    <link rel="stylesheet" href="style.css">
  </head>
  <body>
    <div class="container">
      <h2>Registration Form</h2>
      <form action="register.php" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        <input type="submit" value="Submit">
      </form>
    </div>
  </body>
</html>

<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  $username = $_POST['username'];
  $email = $_POST['email'];
  $password = $_POST['password'];
  
  // You would typically do some validation here to make sure the data is valid
  
  // Insert the user data into the database (assuming you have a database set up)
  $servername = "localhost";
  $dbusername = "yourusername";
  $dbpassword = "yourpassword";
  $dbname = "yourdatabase";
  
  $conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);
  
  if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
  }
  
  $sql = "INSERT INTO users (username, email, password) VALUES ('$username', '$email', '$password')";
  
  if ($conn->query($sql) === TRUE) {
    echo "Registration successful";
  } else {
    echo "Error: " . $sql . "<br>" . $conn->error;
  }
  
  $conn->close();
}
?>
