from flask import render_template
from app import app


@app.route('/', methods=['GET'])
@app.route('/index', methods=['GET'])
def index():  # put application's code here
    return render_template('index.html', title='Inicial', paciente="Gustavo", menu=0)


@app.route('/teste', methods=["GET"])
def teste():  # put application's code here
    number = 10
    return render_template('outro.html', number=number)
