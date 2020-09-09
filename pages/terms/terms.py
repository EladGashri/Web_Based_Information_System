from flask import Blueprint, render_template

# terms blueprint definition
terms = Blueprint('terms', __name__, static_folder='static', static_url_path='/terms', template_folder='templates')


# Routes
@terms.route('/terms')
def index():
    return render_template('terms.html')
