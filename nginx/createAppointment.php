<?php
require_once 'login.php';

//build the connection object
$conn = new mysqli($hn, $un, $pw, $db);
//$conn = mysqli_connect("db","root","password","appointment");


// cover connection errors if any
if($conn->connect_error) die($conn->connect_error);

//extract from post object
if(isset($_POST['name'])){
    
    //$movie_id = $_POST['movie_id'];
    $email = $_POST['email'];
    $name = $_POST['name'];
    $phone = $_POST['phone'];
    $service = $_POST['service'];
    $barber = $_POST['barber'];
    $date = $_POST['datepicker'];
    $time = $_POST['pickTime'];

    //STEP 1: Query customer -- $queryCustomer = "INSERT into customer (customer_id, barber_id, name, phone) VALUES (1, 1, 'Bob Johnson')";
    $queryCustomer = "INSERT into customer (barber_id, name, phone) VALUES ('$barber', '$name', '$phone')";

    //run the insert customer query -- don't need this line because of below query run
    //$result = $conn->query($queryCustomer);
    //if(!$result) die($conn->error);

    //get last customer id inserted to be used in queryAppointment
    if(mysqli_query($conn, $queryCustomer)){
        // Obtain last inserted id
        $last_id = mysqli_insert_id($conn);
        echo "Records inserted successfully. Last inserted ID is: " . $last_id;
    } else{
        echo "ERROR: Could not execute $queryCustomer. " . mysqli_error($conn);
    }

    //STEP2: query appointment -- INSERT into appointment (appointment_id, customer_id, barber_id, phone, service_type, date, time ) values ('1', '1', '1', '8019299000', 'Adult Haircut - $25', '2020-06-24', '3:00 PM') 8
    $queryAppointment = "INSERT into appointment (customer_id, barber_id, service_type, date, time ) values ('$last_id', '$barber', '$service', '$date', '$time')";


    //run the insert appointment query
    $result2 = $conn->query($queryAppointment);
    if(!$result2) die($conn->error);





        
    //Forward using header() function
    //header("Location: retrieve.php");
}

$conn->close();

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    Added Successfully!
    <button><a href="index.php">Return Home</a></button>
</body>
</html>