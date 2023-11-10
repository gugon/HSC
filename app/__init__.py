from flask import Flask
from dynaconf import FlaskDynaconf
from flask_bootstrap import Bootstrap
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.ext.automap import automap_base

from app.nav import create_nav
# from app.models.models import create_db
# from app.models.models import db

app = Flask(__name__)
FlaskDynaconf(app)
Bootstrap(app)

# db = SQLAlchemy(app)
# db.init_app(app)
# create_db(app)
db = SQLAlchemy(app)
Base = automap_base()
Base.prepare(db.engine, reflect=True)

medico = Base.classes.Medico
paciente = Base.classes.Paciente
imagem = Base.classes.Imagem
exame = Base.classes.Exame
# visitantes = Base.classes.Visitante
endereco = Base.classes.Endereco
pacHasMed = Base.classes.Paciente_has_Medico
compartilhado = Base.classes.Compartilhado


create_nav(app)

from app.controllers import default
