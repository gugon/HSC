from flask_wtf import FlaskForm
from wtforms import SubmitField, StringField, PasswordField, validators, SelectField
from wtforms.validators import DataRequired


class CadastroRapidoForm(FlaskForm):
    cpf = StringField('Login', validators=[DataRequired()])
    senha = PasswordField('Senha', validators=[DataRequired()])
    signup = SubmitField(label='Resgistrar', render_kw={"class": "btn btn-primary"})
