from flask import Flask
from dynaconf import FlaskDynaconf
from flask_bootstrap import Bootstrap
from flask_mail import Mail

from app.nav import create_nav
from app.models.models import create_db

app = Flask(__name__)
FlaskDynaconf(app)
Bootstrap(app)
mail = Mail(app)

db, paciente, medico, imagem, exame, pacHasMed, compartilhado = create_db(app)

create_nav(app)

from app.routes import default
