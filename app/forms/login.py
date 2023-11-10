from flask_wtf import FlaskForm
from wtforms import SubmitField, StringField, PasswordField, validators
from wtforms.validators import DataRequired
from wtforms.widgets import SubmitInput


class LoginForm(FlaskForm):
    cpf = StringField('Login', validators=[DataRequired()])
    senha = PasswordField('Senha', validators=[DataRequired()])
    signin = SubmitField(label='Acessar', render_kw={"class": "btn btn-primary"})
    signup = SubmitField(label='Cadastro Rápido', render_kw={"class": "btn btn-primary"})
    visitante = SubmitField(label='Visitante')

