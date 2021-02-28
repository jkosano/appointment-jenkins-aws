<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" type="text/css" href="./css/displayAppointments.css">

</head>
<body>
    <button class="btn" ><a href="index.php">Home</a></button>

</body>
</html>

<?php
require_once 'login.php';

//build the connection object
$conn = new mysqli($hn, $un, $pw, $db);

// cover connection errors if any
if($conn->connect_error) die($conn->connect_error);

    //query for customer, barber and appointment
    /*SELECT customer.name, appointment.service_type, barbers.name FROM customer
    INNER JOIN appointment on customer.customer_id = appointment.appointment_id
    INNER JOIN barbers on appointment.barber_id = barbers.barber_id*/


    $displayAppointments = "SELECT customer.name, appointment.service_type, barbers.name, appointment.date, appointment.time FROM customer
    INNER JOIN appointment on customer.customer_id = appointment.customer_id
    INNER JOIN barbers on appointment.barber_id = barbers.barber_id";

    //run the query to display appointments
    $result = $conn->query($displayAppointments);
    if(!$result) die($conn->error);

    //grab number of rows
    $rows = $result->num_rows; 
    for($j=0; $j<$rows; ++$j){
        
        $result->data_seek($j); 
        $row = $result->fetch_array(MYSQLI_NUM);
        
    // <<<_END allows you embed. The form below represents a delete button. update.php?id=$row[0] allows you to pass in and make movie_id dynamic. You need to pass variable in to query data. This is called a 'GET PARAMETER'
    echo <<<_END
        <pre>
        <strong>$row[0]</strong>
        Customer: $row[0]
        Service: $row[1]
        Barber: $row[2]
        $row[3] @ $row[4]
        </pre>
            <button onclick="window.location.href = 'movie-update.php?movie_id=$row[0]';">Edit $row[1]</button>
            <form action='movie-delete.php' method='post'>
                <input type='hidden' name='delete' value ='yes'>
                <input type ='hidden' name ='movie_id' value='$row[0]'>
                <input type='submit' name='delete' value='DELETE $row[1]'>
            </form>
        
    _END;
        
    }

        
    //close connection
    $conn->close();

?>

