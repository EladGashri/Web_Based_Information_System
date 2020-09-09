from flask import Flask

###### App setup
app = Flask(__name__)
app.config.from_pyfile('settings.py')

###### Pages
## Homepage
from pages.homepage.homepage import homepage
app.register_blueprint(homepage)

## DBA
from pages.dba.dba import dba
app.register_blueprint(dba)

## About
from pages.about.about import about
app.register_blueprint(about)

## Catalog
from pages.catalog.catalog import catalog
app.register_blueprint(catalog)

## Corona
from pages.catalog.catalog import corona
app.register_blueprint(corona)

## Login
from pages.login.login import login
app.register_blueprint(login)

## Logout
from pages.login.login import logout
app.register_blueprint(logout)

## Register
from pages.register.register import register
app.register_blueprint(register)

## Psy
from pages.catalog.catalog import psy
app.register_blueprint(psy)

## Product
from pages.product.product import product
app.register_blueprint(product)

## Onco
from pages.catalog.catalog import onco
app.register_blueprint(onco)

## Sale
from pages.catalog.catalog import sale
app.register_blueprint(sale)

## Terms
from pages.terms.terms import terms
app.register_blueprint(terms)

## User
from pages.user.user import user
app.register_blueprint(user)

## Cart
from pages.cart.cart import cart
app.register_blueprint(cart)

## Careers
from pages.careers.careers import careers
app.register_blueprint(careers)

## Contact
from pages.contact.contact import contact
app.register_blueprint(contact)

## Page error handlers
from pages.page_error_handlers.page_error_handlers import page_error_handlers
app.register_blueprint(page_error_handlers)

###### Components
## Main menu
from components.main_menu.main_menu import main_menu
app.register_blueprint(main_menu)
