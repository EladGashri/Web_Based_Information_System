from flask import Blueprint, render_template, redirect, request, url_for, session
from utilities.db.db_manager import dbManager


# register blueprint definition
register = Blueprint('register', __name__, static_folder='static', static_url_path='/register', template_folder='templates')


# Routes
@register.route('/register', methods=['GET', 'POST'])
def index():
    if request.method == 'GET':
        return render_template('register.html', registered=False)
    else:
        User_name=request.form['user_name']
        Password=request.form['password']
        Email=request.form['email']
        Phone_number=request.form['phone_number']
        Cc_Number=request.form['cc_number']
        Validation_date=request.form['validation_date']
        Csv=request.form['csv']
        Street=request.form['street']
        St_number=request.form['st_number']
        City=request.form['city']
        Customer_managment_id='10129438'
        dbManager.commit('INSERT INTO customer_cc VALUES (%s, %s, %s)',(Cc_Number, Validation_date, Csv))
        dbManager.commit('INSERT INTO customer VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)',(User_name, Password, Email, Phone_number, Cc_Number, Street, St_number, City, Customer_managment_id))
        if request.form["user_type"] == 'private':
            First_name=request.form['first_name']
            Last_name=request.form['last_name']
            dbManager.commit('INSERT INTO private VALUES (%s, %s, %s)', (User_name, First_name, Last_name))
        else:
            Company_name=request.form['company_name']
            Contact_person=request.form['contact_person']
            Licence_number=request.form['licence_number']
            Business_type=request.form['business_type']
            dbManager.commit('INSERT INTO business VALUES (%s, %s, %s, %s)', (User_name, Company_name, Contact_person, Licence_number))
            dbManager.commit('INSERT INTO business_type VALUES (%s, %s)', (User_name, Business_type))
        return render_template('register.html', registered=True)