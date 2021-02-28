import json
import pymysql

from flask import Flask 
from flask import request 

def lambda_handler(event, context):
    
    #Configuration Values
    endpoint = 'database-1.cxfmvmnkvppq.us-east-1.rds.amazonaws.com'
    username = 'admin'
    password = 'Password123!!'
    database_name = 'appointment'

    #Connection
    connection = pymysql.connect(endpoint, user=username,
    	passwd=password, db=database_name)
    
    if request.method == 'POST': 
        email = request.form['email']
        name = request.form['name'] 
        phone = request.form['phone'] 
        service = request.form['service'] 
        barber = request.form['barber'] 
        date = request.form['datepicker'] 
        time = request.form['pickTime'] 
        
        #query insert into customer table
        queryCustomer = "INSERT into customer (barber_id, name, phone) VALUES ('$barber', '$name', '$phone')"
        cursor = connection.cursor()
	    cursor.execute(queryCustomer)
        
        #record the last customer id last inserted to be used later
        ## code here ##
        
        #Create appointment and insert appointment to db
        queryAppointment = "INSERT into appointment (customer_id, barber_id, service_type, date, time ) values ('$last_id', '$barber', '$service', '$date', '$time')";
        cursor = connection.cursor()
	    cursor.execute(queryAppointment)
    
    
    #return {
        
    #}
