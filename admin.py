import mysql.connector

import sys

try:
    mydb = mysql.connector.connect(host = 'localhost' , user = 'root' , password = '' , database = 'kseb_db')
except mysql.connector.Error as e:
    sys.exit(e)

mycursor = mydb.cursor()

while(True):
    print('''
            Enter the option below
            1 .Add the customer
            2 .Search the customer using name , phone_number ,custcode 
            3 .Delete the customer using custcode
            4 .Update the customer using custcode
            5 .View all the customer details
            6 .Generate the bill
            7 .View the bill
            8 .Exit
    ''')

    choice = int(input("Enter your choice : "))
    if(choice==1):
        print("You had enter into inserting customer choice ")
        name = input("Enter the customer name ")
        address = input("Enter the address of the customer ")
        phone_number = input("Enter the phone number of the customer ")
        cust_code = input("Enter the customer code ")
        email =  input("Enter the email id of the customer ")
        sql = "INSERT INTO `customer`(`Name`, `Address`, `Phone_num`, `Cust_code`, `Email`) VALUES (%s,%s,%s,%s,%s)"
        data = (name,address,phone_number,cust_code,email)
        #mycursor.execute(sql,data)
        mycursor.execute(sql,data)
        mydb.commit()
        print('Inserted the data succesfully !!!')
    elif(choice==2):
        print("You had entered into Searching the customer choice")
    elif(choice==3):
        print("You hd entered into deleting customer choice ")
    elif(choice==4):
        print("You had entered into update customer choice ")
    elif(choice==5):
        print("You had entered into view the details of all customer ")
    elif(choice==6):
        print("You had entered into generate bill section ")
    elif(choice==7):
        print("view the bill which had generated ")
    elif(choice==8):
        break