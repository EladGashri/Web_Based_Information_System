from flask import Blueprint, render_template, request, url_for, session, flash
from utilities.db.db_manager import dbManager

# product blueprint definition
product = Blueprint('product', __name__, static_folder='static', static_url_path='/product', template_folder='templates')


# Routes
@product.route('/product', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        item_data=dbManager.fetch('SELECT * FROM item JOIN item_class ON item_id=id WHERE item_id=%s', (request.form['id'],))
        if dbManager.fetch('SELECT * FROM cart WHERE it_id=%s and u_name=%s', (request.form['id'], session['name'])):
            old_amount = dbManager.fetch('SELECT amount FROM cart WHERE it_id=%s and u_name=%s', (request.form['id'], session['name']))
            amount = int(request.form['quantity']) + old_amount[0][0]
            dbManager.commit('UPDATE cart SET amount=%s WHERE it_id=%s AND u_name=%s',(amount, item_data[0][0], session['name']))
        else:
            amount = request.form['quantity']
            dbManager.commit('INSERT INTO cart VALUES (%s, %s, %s)',(session['name'], item_data[0][0], amount))
        user_cart_items = dbManager.fetch('SELECT * FROM cart WHERE u_name=%s' , (session['name'],))
        cart_amount=0
        for item in user_cart_items:
            cart_amount += item[2]
        session['cart_amount'] = cart_amount
        purchase = True
        return render_template('product.html', purchase=purchase)
    else:
        item_data=dbManager.fetch('SELECT * FROM item JOIN item_class ON item_id=id WHERE item_id=%s', (request.args['id'],))
        item_class=item_data[0].item_class
        recommended_data = dbManager.fetch('SELECT * FROM item JOIN item_class ON item_id=id WHERE item_class=%s AND item_id!=%s ORDER BY price DESC, inventory_amount DESC LIMIT 3', (item_class,request.args['id']))
        purchase = False
        return render_template('product.html', current_item=item_data[0], recommended_items=recommended_data, purchase=purchase)


