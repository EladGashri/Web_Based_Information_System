from flask import Blueprint, render_template, request, url_for, session
from utilities.db.db_manager import dbManager
import datetime

# cart blueprint definition
cart = Blueprint('cart', __name__, static_folder='static', static_url_path='/cart', template_folder='templates')


# Routes
@cart.route('/cart', methods=['GET', 'POST'])
def index():
    checkout = False
    if request.method == 'GET':
        cart_data = dbManager.fetch('SELECT * FROM cart JOIN item ON item_id = it_id WHERE u_name=%s', (session['name'],))
        user_cart_items = dbManager.fetch('SELECT * FROM cart JOIN item ON it_id=item_id WHERE u_name=%s' , (session['name'],))
        cart_amount=0
        cart_price=0
        for item in user_cart_items:
            cart_amount += item[2]
            cart_price += item[6] * item[2]
        session['cart_amount'] = cart_amount
        session['cart_price'] = cart_price
        return render_template('cart.html', cart_items=cart_data, checkout=checkout)
    else:
        if request.form.get('checkout'):
            a = datetime.date.today()
            cart_data = dbManager.fetch('SELECT * FROM cart JOIN item ON item_id = it_id WHERE u_name=%s', (session['name'],))
            checkout = True
            for item in cart_data:
                id=item[1]
                amount=item[2]
                dbManager.commit('INSERT into customer_purchased VALUES (%s, %s, %s, %s)', (session['name'], id, amount, a.strftime('%y20-%m-%d') ))
                dbManager.commit('DELETE FROM cart WHERE u_name=%s AND it_id=%s', (session['name'], id))
        if request.form.get('remove_item'):
            dbManager.commit('DELETE FROM cart WHERE u_name=%s AND it_id=%s', (session['name'], request.form['remove_item']))
            cart_data = dbManager.fetch('SELECT * FROM cart JOIN item ON item_id = it_id WHERE u_name=%s', (session['name'],))

        if request.form.get('new_q'):
            dbManager.commit('UPDATE cart SET amount=%s WHERE u_name=%s AND it_id=%s', (request.form['new_q'],session['name'], request.form['id']))
            cart_data = dbManager.fetch('SELECT * FROM cart JOIN item ON item_id = it_id WHERE u_name=%s', (session['name'],))

        user_cart_items = dbManager.fetch('SELECT * FROM cart JOIN item ON it_id=item_id WHERE u_name=%s' , (session['name'],))
        cart_amount=0
        cart_price=0
        for item in user_cart_items:
            cart_amount += item[2]
            cart_price += item[6] * item[2]
        session['cart_amount'] = cart_amount
        session['cart_price'] = cart_price
        return render_template('cart.html', cart_items=cart_data, checkout=checkout)
    return render_template('cart.html')