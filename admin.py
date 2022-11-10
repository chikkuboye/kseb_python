import mysql.connector

import sys

try:
    mydb = mysql.connector.connect(host = 'localhost' , user = 'root' , password = '' , database = 'kseb_db')
except mysql.connector.Error as e:
    sys.exit(e)

mycursor = mydb.cursor

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