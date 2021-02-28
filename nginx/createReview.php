<?php
require_once 'login.php';

//build the connection object
$conn = new mysqli($hn, $un, $pw, $db);

// cover connection errors if any
if($conn->connect_error) die($conn->connect_error);

//extract from post object
if(isset($_POST['name'])){
    
    //$movie_id = $_POST['movie_id'];
    $description = $_POST['description'];
    $date = date("m/d/Y");
    $star_rating = $_POST['star_rating'];


    //get last customer id inserted to be used in queryReview
    /*
    if(mysqli_query($conn, $queryCustomer)){
        // Obtain last inserted id
        $last_id = mysqli_insert_id($conn);
        echo "Records inserted successfully. Last inserted ID is: " . $last_id;
    } else{
        echo "ERROR: Could not able to execute $queryCustomer. " . mysqli_error($conn);
    }*/


    //STEP 1: Query customer -- $queryCustomer = "INSERT into customer (customer_id, barber_id, name, phone) VALUES (1, 1, 'Bob Johnson')";
    $queryReview = "INSERT into reviews (customer_id, description, date, star_rating) VALUES ('$customer_id', '$description', '$date', '$star_rating')";

    //run the insert review query 
    $result = $conn->query($queryReview);
    if(!$result) die($conn->error);





        
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
    <button><a href="appointment.php">Return Home</a></button>
</body>
</html>