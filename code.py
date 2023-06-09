import mysql.connector as con
import pandas as pd
import numpy as np
mycon=con.connect(host='localhost',user='root',password='8520',database='project')

ID=0

def login():
    global ID
    if mycon.is_connected()==False:
        print("Connection Failed")
    else:
        ID=int(input("Enter your ID:"))
        password=input("Enter you password :")
        query_login="select ID, password from customer where ID=%s and password=%s "
        data_login=(ID, password)
        cursor=mycon.cursor()
        cursor.execute(query_login,data_login)
        cursor.fetchall()
        count=cursor.rowcount
        if count > 0:
            print("----------------------------------------------------------")
        else:
            print(" ID or password incorrect. Please retry.")
            login()
        

def account():
    global ID
    if mycon.is_connected()==False:
        print("Connection Failed")
    else:
        ID=int(input("Choose a ID (consists of 5 numbers):"))
        query_account="select ID from customer where ID=%s"
        data_account=(ID,)
        cursor=mycon.cursor()
        cursor.execute(query_account,data_account)
        cursor.fetchall()
        count_account=cursor.rowcount
        if count_account==0:
            print("Valid ID")
        else:
            mycon.rollback()
            print("This ID has already been selected. Kindly select another ID")
            account()

        password=input("Choose a password (not more than 10 characters) :")
        name=input("Name:")
        father_name=input("Father's name:")
        dob=input("Date of Birth (YYYY-MM-DD) :")
        city=input("City:")
        gender=input("Gender (M/F): ")
        phone_no=input("Phone Number:")
        passport_no=input("Passport Number:")
        balanc=int(input("Cash to be deposited:"))
        data2=(ID, password, name, father_name, dob, city, gender, phone_no, passport_no,balanc) 
        query2="insert into customer(ID, password, name, father_name, dob, city, gender, phone_no, passport_no, balance) values(%s ,%s,%s,%s ,%s,%s,%s ,%s,%s,%s)"
        cursor=mycon.cursor()
        cursor.execute(query2,data2)
        mycon.commit()

cash=0

def balance():
    global ID
    if mycon.is_connected()==False:
        print("connection failed")
    else:
        query_balance="select balance from customer where ID=%s"
        data_balance=(ID, )
        cursor=mycon.cursor()
        cursor.execute(query_balance, data_balance)
        data_b=cursor.fetchall()
        for x in data_b:
            global cash
            cash=x[0]
            print("Your Current Balance is",cash)

def deposit():
    global ID
    global cash
    if mycon.is_connected()==False:
        print("connection failed")
    else:
        deposit=int(input("Enter amount to be deposited:"))
        query_deposit="update customer set balance=balance+%s where ID=%s"
        data_deposit=(deposit, ID)
        cursor=mycon.cursor()
        cursor.execute(query_deposit, data_deposit)
        mycon.commit()
        query_balance="select balance from customer where ID=%s"
        data_balance=(ID, )
        cursor=mycon.cursor()
        cursor.execute(query_balance, data_balance)
        data_b=cursor.fetchall()
        for x in data_b:
            global cash
            cash=x[0]
        print("Rs.", deposit, "have been deposited in your account")
        print("Balance : Rs",cash)

def withdraw():
    global ID
    global cash
    if mycon.is_connected()==False:
        print("connection failed")
    else:
        withdraw=int(input("Enter amount to be withdrawn:"))
        query_balance="select balance from customer where ID=%s"
        data_balance=(ID, )
        cursor=mycon.cursor()
        cursor.execute(query_balance, data_balance)
        data_b=cursor.fetchall()
        for x in data_b:
            global cash
            cash=x[0]
        if withdraw<=cash:
            query_withdraw="update customer set balance=balance-%s where ID=%s"
            data_withdraw=(withdraw, ID)
            cursor=mycon.cursor()
            cursor.execute(query_withdraw, data_withdraw)
            mycon.commit()
            amt_left=cash-withdraw
            print("Rs.",withdraw," have been withdrawn from your account")
            print("Balance : Rs.", amt_left)
        else:
            print("Not enough cash")

def transfer():
    global ID
    if mycon.is_connected()==False:
        print("connection failed")
    else:
        transfer_ID=int(input(" Enter the ID to which amount is to be transferred:"))
        query_transfer="select ID, password from customer where ID=%s "
        data_transfer=(transfer_ID, )
        cursor=mycon.cursor()
        cursor.execute(query_transfer,data_transfer)
        data_t=cursor.fetchall()
        count=cursor.rowcount
        if count > 0:
            amount=int(input("Enter amount to be transferred:"))
            query_trans_to="update customer set balance=balance+%s where ID=%s"
            data_trans_to=(amount, transfer_ID)
            cursor=mycon.cursor()
            cursor.execute(query_trans_to, data_trans_to)
            mycon.commit()
            query_trans_from="update customer set balance=balance-%s where ID=%s"
            data_trans_from=(amount, ID)
            cursor=mycon.cursor()
            cursor.execute(query_trans_from, data_trans_from)
            mycon.commit()
            query_trans_name="select name from customer where ID=%s"
            data_trans_name=(transfer_ID, )
            cursor=mycon.cursor()
            cursor.execute(query_trans_name, data_trans_name)
            transfer_name=cursor.fetchall()
            for x in transfer_name:
                trans_name=x[0]
            print("Rs.", amount, "successfully transferred to", trans_name)
        else:
            print(" ID entered does not exist. PLEASE RETRY.")
            transfer()  

def simple_loan():
    global ID
    if mycon.is_connected()==False:
        print("connection failed")
    else:
        pa=int(input("Principal Amount:"))
        rate=float(input("Intrest Rate:"))
        time=float(input("Time (in years):"))
        amt=pa*(1 + rate/100*time)
        print("Final Amount to be paid :", amt)
        data_sloan=(ID,pa, rate, time, amt)
        query_sloan="insert into simple_loan(ID, principal_amount, interest_rate, time, final_amount) values(%s,%s ,%s,%s,%s )"
        cursor=mycon.cursor()
        cursor.execute(query_sloan,data_sloan)
        mycon.commit()

def compound_loan():
    global ID
    if mycon.is_connected()==False:
        print("connection failed")
    else:
        pa=int(input("Principal Amount:"))
        rate=float(input("Intrest Rate:"))
        time=float(input("Time (in years):"))
        amt=pa*(1 + rate/100)**time
        print("Final Amount to be paid =", amt)
        data_cloan=(ID,pa, rate, time, amt) 
        query_cloan="insert into compound_loan(ID,principal_amount, interest_rate, time, final_amount) values(%s,%s ,%s,%s,%s )"
        cursor=mycon.cursor()
        cursor.execute(query_cloan,data_cloan)
        mycon.commit()

def loan():
    print(" 1. Simple Interest \t 2. Compound Interest")
    loan_choice=int(input("Enter Choice: "))
    if loan_choice==1:
        simple_loan()
    elif loan_choice==2:
        compound_loan()
    else:
        print(" Please enter a valid option")
        loan()

def update():
    global ID
    if mycon.is_connected()==False:
        print("connection failed")
    else:
        print("Which of the following do you want to update?")
        print(" 1. Password")
        print(" 2. Name")
        print(" 3. City")
        print(" 4. Phone Number")
        print(" 5. Passport Number")
        update_option=int(input("Enter Choice:"))
        if update_option==1:
            new_pass=input("Enter new password:")
            data_update_pass=(new_pass, ID) 
            query_update_pass="update customer set password=%s where ID=%s"
            cursor=mycon.cursor()
            cursor.execute(query_update_pass, data_update_pass)
            mycon.commit()
            print(" Password changed successfully")
        elif update_option==2:
            new_name=input("Enter new Name:")
            data_update_name=(new_name, ID) 
            query_update_name="update customer set name=%s where ID=%s"
            cursor=mycon.cursor()
            cursor.execute(query_update_name, data_update_name)
            mycon.commit()
            print(" Name changed successfully")
        elif update_option==3:
            new_city=input("Enter new city:")
            data_update_city=(new_city, ID) 
            query_update_city="update customer set city=%s where ID=%s"
            cursor=mycon.cursor()
            cursor.execute(query_update_city, data_update_city)
            mycon.commit()
            print(" City changed successfully")
        elif update_option==4:
            new_phone=input("Enter new phone number:")
            data_update_phone=(new_phone, ID ) 
            query_update_phone="update customer set phone_no=%s where ID=%s"
            cursor=mycon.cursor()
            cursor.execute(query_update_phone, data_update_phone)
            mycon.commit()
            print(" Phone number changed successfully")
        elif update_option==5:
            new_passport=input("Enter new passport number:")
            data_update_passport=(new_passport, ID) 
            query_update_passport="update customer set passport_no=%s where ID=%s"
            cursor=mycon.cursor()
            cursor.execute(query_update_passport ,data_update_passport)
            mycon.commit()
            print(" Passport number changed successfully")
        else:
            print("PLEASE SELECT A VALID OPTION")
            update()
       
def delete():
    global ID
    if mycon.is_connected()==False:
        print("connection failed")
    else:
        data_delete=(ID, ) 
        query_delete="delete from customer where ID=%s"
        cursor=mycon.cursor()
        cursor.execute(query_delete ,data_delete)
        mycon.commit()
        print("User account details deleted successfully")


def options():
    if mycon.is_connected()==False:
        print("connection failed")
    else:
        print("Please select an option")
        print(" 1. Check Balance")
        print(" 2. Deposit Money")
        print(" 3. Withdraw Money")
        print(" 4. Transfer Money")
        print(" 5. Take Loan")
        print(" 6. Update Account Details")
        print(" 7. Delete Account")
        print(" 8. Exit")
        option=int(input(" Enter option: "))
        if option==1:
            balance()
        elif option==2:
            deposit()
        elif option==3:
            withdraw()
        elif option==4:
            transfer()
        elif option==5:
            loan()
        elif option==6:
            update()
        elif option==7:
            delete()
        elif option==8:
            print("--------------------------------------------------------")
        else:
            print("Please enter a option")
            options()
        print("Do you want to continue?")
        print("1-yes \t  2-no")
        opt=int(input("Enter option:"))
        print("--------------------------------------------------------------")
        if opt==1:
            options()
        else:
            print(" THANK YOU FOR USING OUR SERVICES")

def customer():
    if mycon.is_connected()==False:
        print("connection failed")
    else:
        print("1-Already a user? \t 2-New user?  ")
        customer_choice=int(input("Enter choice:"))
        if customer_choice==1:
            login()
        elif customer_choice==2:
            account()
        else:
            print("Please select a valid option")
            customer()

#---------------------------------------------EMPLOYEE---------------------------------------------------------------------------------

def emp_login():
    if mycon.is_connected()==False:
        print("connection failed")
    else:
        emp_id=int(input("Enter your ID:"))
        emp_pass=input("Enter the password:")
        query_emp_login="select emp_id, password from employee where emp_id=%s and password=%s "
        data_emp_login=(emp_id, emp_pass)
        cursor=mycon.cursor()
        cursor.execute(query_emp_login, data_emp_login)
        cursor.fetchall()
        count=cursor.rowcount
        if count > 0:
            print("----------------------------------------------------------------------")
        else:
            print(" ID or password incorrect. Please retry.")
            emp_login()
        
def emp_loan_list():
    if mycon.is_connected()==False:
        print("connection failed")
    else:
        print("Select Loan List to be viewed:")
        print(" 1. Simple Interest \t 2. Compound Interest List")
        emp_choice2=int(input("Enter Option:"))
        if emp_choice2==1:
            query_simple="select * from simple_loan"
            cursor=mycon.cursor()
            cursor.execute(query_simple)
            simple_data=cursor.fetchall()
            simple_list=[ ]
            for x in simple_data:
                simple_list.append(x)
            DF_simple=pd.DataFrame(simple_list)
            DF_simple.columns=['ID', 'pricipal_amount', 'rate', 'time', 'final_amount']
            print(DF_simple)
        elif emp_choice2==2:
            query_compound="select * from compound_loan"
            cursor=mycon.cursor()
            cursor.execute(query_compound)
            compound_data=cursor.fetchall()
            compound_list=[ ]
            for x in compound_data:
                compound_list.append(x)
            DF_compound=pd.DataFrame(compound_list)
            DF_compound.columns=['ID', 'pricipal_amount', 'rate', 'time', 'final_amount']
            print(DF_compound)
        else:
            print("Invalid option. Please retry")
            emp_loan_list()

def emp_update():
    if mycon.is_connected()==False:
        print("connection failed")
    else:
        ID=int(input("Enter customer ID:"))
        query_emp_update="select ID from customer where ID=%s"
        data_emp_update=(ID, )
        cursor=mycon.cursor()
        cursor.execute(query_emp_update, data_emp_update)
        cursor.fetchall()
        count=cursor.rowcount
        if count > 0:
            update()
        else:
            print(" ID or password incorrect. Please retry.")
            emp_update()

def emp_delete():
    global ID
    if mycon.is_connected()==False:
        print("connection failed")
    else:
        ID=input("Enter customer ID:")
        query_emp_delete="select ID from customer where ID=%s "
        data_emp_delete=(ID, )
        cursor=mycon.cursor()
        cursor.execute(query_emp_delete ,data_emp_delete)
        cursor.fetchall()
        count=cursor.rowcount
        if count > 0:
            data_delete=(ID, ) 
            query_delete="delete from customer where ID=%s"
            cursor=mycon.cursor()
            cursor.execute(query_delete ,data_delete)
            mycon.commit()
            print("User Account details deleted successfully")
        else:
            print(" ID enetered does not exist")
            emp_delete()

def employee():
    if mycon.is_connected()==False:
        print("connection failed")
    else:
        print("1. View Loan List \t 2. Update customer account details \t 3. Delete customer account")
        emp_option=int(input("Enter option:"))
        if emp_option==1:
            emp_loan_list()
        elif emp_option==2:
            emp_update()
        elif emp_option==3:
            emp_delete()
        else:
            print("Please select a valid option")
            employee()
        emp_choice=int(input("Do u want to continue \n 1-yes \t 2-no"))
        if emp_choice==1:
            employee()
        else:
            print("-----------------------------------------------")


def intro():
    print("\t\t\t\t WELCOME TO AAA BANK")
    while(True):
        print("1. Customer \t 2. Employee")
        intro_choice=int(input("Enter an option:"))
        if intro_choice==1:
            customer()
            options()
            break
        elif intro_choice==2:
            emp_login()
            employee()
            break
        else:
            print("Please select a valid option")
            intro()
        
intro()
