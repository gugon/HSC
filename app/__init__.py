from flask import Flask
from dynaconf import FlaskDynaconf
from flask_bootstrap import Bootstrap

from app.nav import create_nav

app = Flask(__name__)
FlaskDynaconf(app)
Bootstrap(app)
create_nav(app)

from app.controllers import default
