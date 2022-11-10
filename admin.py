import mysql.connector
from tabulate import tabulate
import sys
from datetime import date
import random
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
            8 .Top 2 high bill
            9 .Exit
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
        
        print('''
             1 .Search using name
             2 .Search using phone number
             3 .Search using cust_code
        ''')
        search_c = int(input('Enter the option you needed : '))
        if(search_c==1):
            name = input("Enter the name ")
            sql = "SELECT `Name`, `Address`, `Phone_num`, `Cust_code`, `Email` FROM `customer` WHERE `Name`='"+name+"'"

        elif(search_c==2):
            phone = int(input("Enter the phone number"))
            sql = "SELECT `Name`, `Address`, `Phone_num`, `Cust_code`, `Email` FROM `customer` WHERE `Phone_num`='"+phone+"'"

        elif(search_c==3):
            cust_code = input('Enter the customer code ')
            sql = "SELECT `Name`, `Address`, `Phone_num`, `Cust_code`, `Email` FROM `customer` WHERE `Cust_code`='"+cust_code+"'"

        mycursor.execute(sql)
        result = mycursor.fetchall()
        print(tabulate(result,headers=['Name','Address','Phone_Number','Customer_Code','Email'],tablefmt = "psql"))
    elif(choice==3):
        print("You had entered into deleting customer choice ")
        cust_code = input("Enter the customer id ")
        sql = "DELETE FROM `customer` WHERE `Cust_code`='"+cust_code+"'"
        mycursor.execute(sql)
        mydb.commit()
        print('Deleted successfully !!! ')
    elif(choice==4):
        print("You had entered into update customer choice ")
        cust_code = input('Enter the customer code to be updated ')
        name = input("Enter the customer name ")
        address = input("Enter the address of the customer ")
        phone_number = input("Enter the phone number of the customer ")
        #cust_code = input("Enter the customer code ")
        email =  input("Enter the email id of the customer ")
        sql = "UPDATE `customer` SET `Name`='"+name+"',`Address`='"+address+"',`Phone_num`='"+phone_number+"',`Email`='"+email+"' WHERE `Cust_code`='"+cust_code+"'"
        mycursor.execute(sql)
        mydb.commit()
        print('Updated successfully !!! ')
    elif(choice==5):
        print("You had entered into view the details of all customer ")
        sql = "SELECT `Name`, `Address`, `Phone_num`, `Cust_code`, `Email` FROM `customer`"
        mycursor.execute(sql)
        result = mycursor.fetchall()
        print(tabulate(result,headers=['Name','Address','Phone_Number','Customer_Code','Email'],tablefmt = "psql"))

    elif(choice==6):
        print("You had entered into generate bill section ")
        #cust_code = input('Enter the customer code : ')
        dates = date.today()
        year = dates.year
        month = dates.month
        sql = "DELETE FROM `bill` WHERE `month`='"+str(month)+"' AND `year`='"+str(year)+"'"
        #print(sql)
        mycursor.execute(sql)
        mydb.commit()
        
        sql = "SELECT `id` FROM `customer` "
        mycursor.execute(sql)
        result = mycursor.fetchall()
        for i in result:
            #print(i[0])
            id = i[0]
            sql = "SELECT SUM(`Unit`) FROM `usage` WHERE `User_Id`='"+str(i[0])+"'  AND MONTH(`Date`)='"+str(month)+"' AND YEAR(`Date`)='"+str(year)+"'"
            mycursor.execute(sql)
            result = mycursor.fetchone()
            unit = result[0]
            #print(unit)
            total_bill = int(result[0]) * 5
            #print(total_bill)
            status = 0
            invoice = random.randint(10000,100000)
            sql = "INSERT INTO `bill`(`User_Id`, `month`, `year`, `bill`, `paid status`, `bill date`,`due_date`, `total_unit`,`invoice_num`) VALUES (%s,%s,%s,%s,%s,now(),now()+interval 14 day,%s,%s)"
            data = (str(id),str(month),str(year),total_bill,status,str(unit),str(invoice))
            mycursor.execute(sql , data)
            mydb.commit()
    elif(choice==7):
        print("view the bill which had generated ")
        sql = "SELECT  c.Name,c.Address,b.`month`, b.`year`, b.`bill`, b.`paid status`, b.`bill date`, b.`due_date`, b.`total_unit`, b.`invoice_num` FROM `bill` b JOIN customer c ON b.User_Id=c.id"
        mycursor.execute(sql)
        result = mycursor.fetchall()
        print(tabulate(result,headers=['name','address','month','year','bill amount','status','bill date','due date','total unit','invoice_num'],tablefmt = "psql"))

    elif(choice==8):
        print('Top 2 high bill')
        sql = "SELECT c.Name,c.Address,b.`bill`, b.`total_unit` FROM `bill` b JOIN customer c ON b.User_Id=c.id ORDER BY b.`bill`DESC LIMIT 2"
        mycursor.execute(sql)
        result = mycursor.fetchall()
        print(tabulate(result,headers=['name','Address','bill', 'total_unit']))
    elif(choice==9):
        break