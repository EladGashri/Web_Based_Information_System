from flask import Blueprint, render_template, redirect, url_for, request
from utilities.db.db_manager import dbManager

# homepage blueprint definition
homepage = Blueprint('homepage', __name__, static_folder='static', static_url_path='/homepage', template_folder='templates')


# Routes
@homepage.route('/', methods=['GET', 'POST'])
@homepage.route('/homepage', methods=['GET', 'POST'])
@homepage.route('/home', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        dbManager.commit('INSERT INTO email VALUES (%s)',(request.form['email'],))
        return render_template('homepage.html')
    corona='corona'
    psy='psychiatry'
    onco='oncology'
    corona_data = dbManager.fetch('SELECT * FROM item JOIN item_class ON item_id=id WHERE item_class=%s ORDER BY price DESC, inventory_amount DESC LIMIT 3', (corona,))
    psy_data = dbManager.fetch('SELECT * FROM item JOIN item_class ON item_id=id WHERE item_class=%s ORDER BY price DESC, inventory_amount DESC LIMIT 3', (psy,))
    onco_data = dbManager.fetch('SELECT * FROM item JOIN item_class ON item_id=id WHERE item_class=%s ORDER BY price DESC, inventory_amount DESC LIMIT 3', (onco,))
    return render_template('homepage.html', corona_items=corona_data, psy_items=psy_data, onco_items=onco_data)

