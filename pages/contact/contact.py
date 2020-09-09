from flask import Blueprint, render_template, redirect, request, url_for, session
from utilities.db.db_manager import dbManager

# contact blueprint definition
contact = Blueprint('contact', __name__, static_folder='static', static_url_path='/contact', template_folder='templates')


# Routes
@contact.route('/contact', methods=['GET', 'POST'])
def index():
    if request.method == 'GET':
        return render_template('contact.html', contact=False)
    else:
        Name=request.form['contact_name']
        Email=request.form['contact_email']
        Text=request.form['contact_text']
        dbManager.commit('INSERT INTO contact VALUES (%s, %s, %s)',(Name, Email, Text))
        return render_template('contact.html', contact=True)