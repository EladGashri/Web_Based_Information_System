from flask import Blueprint, render_template

# careers blueprint definition
careers = Blueprint('careers', __name__, static_folder='static', static_url_path='/careers', template_folder='templates')


# Routes
@careers.route('/careers')
def index():
    return render_template('careers.html')
