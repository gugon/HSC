from flask import Flask, flash, redirect, url_for, request, session, render_template, Response
from werkzeug.security import generate_password_hash, check_password_hash
from werkzeug.utils import secure_filename
from app import app, db, paciente
from app.forms.cadastroRapido import CadastroRapidoForm
from app.forms.login import LoginForm


@app.route('/')
def inicio():
    if 'nome' in session:
        return render_template('index.html', title='HSC', paciente=session.get('nome'), menu=0)
    else:
        return redirect(url_for('autenticar'))


@app.route('/login', methods=['GET', 'POST'])
def autenticar():
    if session.get('paciente_login'):
        return redirect(url_for('inicio'))

    form = LoginForm()
    if form.validate_on_submit():
        if form.signin.data:
            user = db.session.query(paciente).filter(
                paciente.CPF == form.cpf.data).first()

            if user:
                if check_password_hash(user.senha, form.senha.data):
                    session['paciente_login'] = True
                    session['idPaciente'] = user.idPaciente
                    session['nome'] = user.nome
                    session['CPF'] = user.CPF

                    return redirect(url_for('inicio'))

            flash('Usuário ou senha inválidos')

            return redirect(url_for('autenticar'))
        elif form.signup.data:
            return redirect(url_for('cadastroRapido'))
        else:
            return redirect(url_for('autenticar'))
    return render_template('login.html', title='Autenticação de usuários', form=form)


@app.route('/cadastroRapido', methods=['GET', 'POST'])
def cadastroRapido():
    if session.get('paciente_login'):
        return redirect(url_for('inicio'))
    form = CadastroRapidoForm()
    if form.validate_on_submit():
        if form.signup.data:
            # print("FORM.DATA = ", form.signup.data)
            user_visitant = db.session.query(paciente).filter(paciente.CPF == form.cpf.data).first()
            # print("Resp Banco = ", user_visitant)
            if user_visitant:
                flash('Usuário já Cadastrado')
                # flash(user_visitant)
                return redirect(url_for('cadastroRapido'))
            else:
                cadastraPaciente = paciente(
                    CPF=form.cpf.data,
                    senha=generate_password_hash(form.senha.data),
                    Permissao_idPermissao=2)
                db.session.add(cadastraPaciente)
                db.session.commit()

                flash('Cadastro Rápido realizado com sucesso')
                return redirect(url_for('autenticar'))

        else:
            return redirect(url_for('autenticar'))

    return render_template('cadastroRapido.html', title='Cadastro Rápido', form=form)


@app.route("/logout")
def logout():
    session.clear()
    flash('Logout realizado com sucesso!', 'info')
    return redirect(url_for('inicio'))


@app.route('/teste', methods=["GET"])
def teste():  # put application's code here
    number = 10
    return render_template('outro.html', number=number)
