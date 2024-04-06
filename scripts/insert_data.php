<?php
header('Content-Type: application/json');

// Check if the request method is POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Check if username and password are provided
    if (isset($_POST['username']) && isset($_POST['password'])) {
        $servername = "localhost";
        $username = "root";
        $password = ""; // Your database password
        $dbname = "elc"; // Your database name

        // Create connection
        $conn = new mysqli($servername, $username, $password, $dbname);

        // Check connection
        if ($conn->connect_error) {
            die(json_encode(array('status' => 'error', 'message' => 'Connection failed: ' . $conn->connect_error)));
        }

        // Prepare and execute the INSERT statement
        $username = $_POST['username'];
        $password = $_POST['password'];
        $sql = "INSERT INTO emp (username, password) VALUES ('$username', '$password')";

        if ($conn->query($sql) === TRUE) {
            echo json_encode(array('status' => 'success', 'message' => 'Data stored successfully'));
        } else {
            echo json_encode(array('status' => 'error', 'message' => 'Failed to store data: ' . $conn->error));
        }

        // Close connection
        $conn->close();
    } else {
        // Username or password not provided
        echo json_encode(array('status' => 'error', 'message' => 'Username or password not provided'));
    }
} else {
    // Invalid request method
    echo json_encode(array('status' => 'error', 'message' => 'Invalid request method'));
}
?>
