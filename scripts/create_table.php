<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "elc";
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
die("Connection failed: " . $conn->connect_error);
}
$sql = "CREATE TABLE Emp ( id INT(6),username VARCHAR(30),password VARCHAR(30) )";
if ($conn->query($sql) === TRUE) {
echo "Table has been created successfully";
} else {
echo "Error creating table: " . $conn->error;
}
?>