from flask import Blueprint, render_template, request, url_for, session
from utilities.db.db_manager import dbManager

# user blueprint definition
user = Blueprint('user', __name__, static_folder='static', static_url_path='/user', template_folder='templates')


# Routes
@user.route('/user', methods=['GET', 'POST'])
def index():
    if request.method=='POST':
        if request.form.get('email'):
            dbManager.commit('UPDATE customer SET email=%s WHERE user_name=%s', (request.form['email'], session['name']))
        if request.form.get('phone_number'):
            dbManager.commit('UPDATE customer SET phone_number=%s WHERE user_name=%s', (request.form['phone_number'], session['name']))
        if request.form.get('street'):
            dbManager.commit('UPDATE customer SET street=%s WHERE user_name=%s', (request.form['street'], session['name']))
        if request.form.get('st_number'):
            dbManager.commit('UPDATE customer SET st_number=%s WHERE user_name=%s', (request.form['st_number'], session['name']))
        if request.form.get('city'):
            dbManager.commit('UPDATE customer SET city=%s WHERE user_name=%s', (request.form['city'], session['name']))
    if session['logged-in']:
        if dbManager.fetch('SELECT * FROM private WHERE u_name=%s', (session['name'],)):
            Private=True
            User_details=dbManager.fetch('SELECT * FROM customer LEFT JOIN private ON user_name=u_name WHERE user_name=%s', (session['name'],))
            Recommended_items = dbManager.fetch('SELECT * FROM item JOIN item_department ON item_id=it_id WHERE department=%s ORDER BY price DESC, inventory_amount DESC LIMIT 3',('private',))
        else:
            Private=False
            User_details=dbManager.fetch('SELECT * FROM customer LEFT JOIN business ON user_name=u_name WHERE user_name=%s', (session['name'],))
            Recommended_items = dbManager.fetch('SELECT * FROM item JOIN item_department ON item_id=it_id WHERE department=%s ORDER BY price DESC, inventory_amount DESC LIMIT 3',('business',))
        Purchased_items=dbManager.fetch('SELECT * FROM customer_purchased JOIN item ON it_id=item_id WHERE u_name=%s', (session['name'],))
        Customer_manager=dbManager.fetch('SELECT * FROM customer JOIN employee ON customer_management_id=employee_id WHERE user_name=%s',(session['name'],))
        return render_template('user.html', user_details=User_details[0], private=Private, purchased_items=Purchased_items, customer_manager = Customer_manager[0], recommended_items=Recommended_items)
    else:
        return render_template('user.html')

