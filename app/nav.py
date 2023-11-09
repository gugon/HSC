from flask_nav import Nav
from flask_nav.elements import Navbar, View, Subgroup


def create_nav(app):
    nav = Nav()

    @nav.navigation()
    def menunavbar():
        menu = Navbar('HSC')
        menu.items = [View('Home', 'teste')]
        menu.items.append(Subgroup('Cadastros',
                            View('Exames', 'teste'),
                                   # View('Informações Gerais', 'cadastroInfoGeral'),
                                   View('Meus Dados', 'teste'),
                                   View('Meus Médicos', 'teste')))

        menu.items.append(Subgroup('Visualizar Exames',
                            View('RX', 'teste'),
                                   View('Ressonância Magnética', 'teste'),
                                   View('Ultrassom', 'teste'),
                                   View('Teste', 'teste'),
                                   View('Lista', 'teste')))

        # menu.items.append(Subgroup('Compartilhar Exames',
        #                            View('RX', 'testes2'),
        #                            View('Ressonância Magnética', 'resonancia'),
        #                            View('Ultrassom', 'mostraLaudo')))

        menu.items.append(View('Sair', 'teste'))
        return menu

    nav.init_app(app)
