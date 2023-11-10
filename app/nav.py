from flask_nav import Nav
from flask_nav.elements import Navbar, View, Subgroup


def create_nav(app):
    nav = Nav()
    nav.init_app(app)

    @nav.navigation()
    def menunavbar():
        menu = Navbar('HSC')
        menu.items = [View('Home', 'teste'),
                      Subgroup(
                          'Cadastros',
                          View('Meus Dados', 'autenticar'),
                          View('Exames', 'cadastroRapido'),
                          View('Meus Médicos', 'teste')
                          # Link('Tech Support', 'https://google.com')
                      ),
                      Subgroup(
                          'Visualizar Exames',
                          View('RX', 'teste'),
                          View('Ressonância Magnética', 'teste'),
                          # Link('Tech Support', 'https://google.com')
                      )
                      ]

        menu.items.append(View('Sair', 'logout'))
        return menu

    @nav.navigation()
    def menumedico():
        menu = Navbar('Medico')
        menu.items = [View('Home', 'teste'),
                      View('Visualizar Exames', 'teste')
                      ]
        menu.items.append(View('Sair', 'logout'))
        # menu.items.append(Subgroup('Visualizar Exames', View('RX', 'gerenciaRx')))
        return menu
