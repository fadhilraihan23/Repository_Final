<?php 
 		

if(isset($_POST['btnLogin'])){		
	
    include "db_conn.php";
	$email = $_POST['emailUser'];
	$password = $_POST['password'];	
	$sql = "SELECT * FROM user WHERE emailUser='$email' AND password='$password'";
		echo $sql;
		$result = mysqli_query($conn, $sql);
		
		if (mysqli_num_rows ($result) == 1){
			$row = mysqli_fetch_assoc($result);
            if ($row['emailUser'] === $email && $row['password'] === $password) {
            	$_SESSION['emailUser'] = $row['emailUser'];
            	$_SESSION['namaUser'] = $row['namaUser'];
				echo '<script>window.location = "dashboard_admin.php";</script>';
            }else{
				echo "<script>alert('Password tidak match');</script>";	
			}
		}else{
			echo "<script>alert('Email tidak terdaftar');</script>";
		}
	} 
?>
<!DOCTYPE html>
<html>
<head>
	<title>LOGIN</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
     <form action="" method="post">
     	<h2>LOGIN</h2>
     	<?php if (isset($_GET['error'])) { ?>
     		<p class="error"><?php echo $_GET['error']; ?></p>
     	<?php } ?>
     	<label>User Name</label>
     	<input type="text" name="emailUser" placeholder="User Name"><br>
		<br>
     	<label>Password</label>
     	<input type="password" name="password" placeholder="Password"><br>
		<br>
     	<button type="submit" value="Login" name="btnLogin">Login</button>
     </form>
</body>
</html>