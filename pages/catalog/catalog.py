from flask import Blueprint, render_template, request, url_for
from utilities.db.db_manager import dbManager


# catalog blueprint definition
catalog = Blueprint('catalog', __name__, static_folder='static', static_url_path='/catalog', template_folder='templates')
corona = Blueprint('corona', __name__, static_folder='static', static_url_path='/catalog', template_folder='templates')
psy = Blueprint('psy', __name__, static_folder='static', static_url_path='/catalog', template_folder='templates')
onco = Blueprint('onco', __name__, static_folder='static', static_url_path='/catalog', template_folder='templates')
sale = Blueprint('sale', __name__, static_folder='static', static_url_path='/catalog', template_folder='templates')

# Routes
@sale.route('/sale')
@onco.route('/onco')
@psy.route('/psy')
@corona.route('/corona')
@catalog.route('/catalog')
def index():
    catalog_pages = {
        'catalog': url_for('catalog.index'),
        'corona': url_for('corona.index'),
        'oncology': url_for('onco.index'),
        'psychiatry': url_for('psy.index'),
        'sale': url_for('sale.index'),
    }

    for page in catalog_pages:
        if catalog_pages[page] == request.path:
            current_page=page
            break
    minimal_amount = '0'
    if current_page == 'catalog':
        items_data=dbManager.fetch('SELECT * FROM item WHERE inventory_amount>%s', (minimal_amount,))
    elif current_page == 'sale':
        items_data=dbManager.fetch('SELECT * FROM item WHERE discount_percent IS NOT NULL')
    else:
        items_data=dbManager.fetch('SELECT * FROM item JOIN item_class ON item_id=id WHERE item_class=%s AND inventory_amount>%s', (current_page, minimal_amount))

    return render_template('catalog.html', items=items_data)


