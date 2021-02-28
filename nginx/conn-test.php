<?php
    require_once 'login.php';

    //build the connection object
    //$conn = new mysqli($hn, $un, $pw, $db);
    
    $conn = mysqli_connect("db","root","password","appointment");

    if(!$conn) 
    {
        die("Failed to connect to MySQL:" . mysqli_error());
    } 
    else {
        echo "db connected"; 
    }


    // // cover connection errors if any
    // if($conn->connect_error) die($conn->connect_error);
?>