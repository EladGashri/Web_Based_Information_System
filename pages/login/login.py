from flask import Blueprint, render_template, flash, redirect, url_for, session
from config import LoginForm
from utilities.db.db_manager import dbManager
from flask_login import current_user, login_user

# login blueprint definition
login = Blueprint('login', __name__, static_folder='static', static_url_path='/login', template_folder='templates')
logout = Blueprint('logout', __name__, static_folder='static', static_url_path='/logout', template_folder='templates')


# Routes
@login.route('/login' , methods=['GET', 'POST'])
def index():
    form = LoginForm()
    if form.validate_on_submit():
        username = dbManager.fetch('SELECT user_name FROM customer WHERE user_name=%s', (form.username.data,))
        password = dbManager.fetch('SELECT user_password FROM customer WHERE user_password=%s', (form.password.data,))
        if len(username) == 0 or len(password) == 0:
            username = dbManager.fetch('SELECT user FROM employee_user WHERE user=%s', (form.username.data,))
            password = dbManager.fetch('SELECT password FROM employee_user WHERE password=%s',(form.password.data,))
            if len(username) == 0 or len(password) == 0:
                flash('Invalid username or password')
                return redirect(url_for('login.index'))
        session['logged-in'] = True
        session['name'] = username[0][0]
        #cart_data = dbManager.fetch('SELECT * FROM cart JOIN item ON item_id = it_id WHERE u_name=%s', (session['name'],))
        #session['cart_number'] = len(cart_data)
        user_cart_items = dbManager.fetch('SELECT * FROM cart WHERE u_name=%s' , (session['name'],))
        cart_amount=0
        for item in user_cart_items:
            cart_amount += item[2]
        session['cart_amount'] = cart_amount
        return redirect(url_for('homepage.index'))
    return render_template('login.html', form=form)


@logout.route('/logout')
def index():
    if session.get('logged-in'):
        del session['logged-in']
    return redirect('/')
