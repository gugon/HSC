from flask import render_template
from app import app


@app.route('/login', methods=['GET'])
def login():  # put application's code here
    return render_template('index.html', title='Inicial', paciente="Gustavo", menu=0)