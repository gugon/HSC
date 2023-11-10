from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.ext.automap import automap_base
from app import app

# def create_db(app):

# db = SQLAlchemy(app)
# Base = automap_base()
# Base.prepare(db.engine, reflect=True)
#
# medico = Base.classes.Medico
# paciente = Base.classes.Paciente
# imagem = Base.classes.Imagem
# exame = Base.classes.Exame
# # visitantes = Base.classes.Visitante
# endereco = Base.classes.Endereco
# pacHasMed = Base.classes.Paciente_has_Medico
# compartilhado = Base.classes.Compartilhado
