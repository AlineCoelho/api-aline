# language: pt

Funcionalidade: Pesquisar Funcionario
    Para averiguar informações
    O usuário do sistema
    Deseja poder consultar informacoes dos funcionarios

    @cenario_um
    Cenario:Buscar informacoes de funcionario
        Dado que o usuario consulte informacoes de funcionario
        Quando ele realiza a pesquisa
        Entao uma lista de funcionarios deve retornar

    @cenario_dois
    Cenario: Cadastrar funcionario
        Dado que o usuario cadastre um novo funcionario
        Quando ele enviar as informacoes do funcionario
        Então esse funcionario sera cadastrado

    @cenario_tres
    Cenario: Alterar informacoes cadastrais
        Dado que o usuario altere uma informacao de funcionario
        Quando ele enviar as novas informacoes
        Então as informacoes serao alteradas

    @cenario_quatro
    Cenario: Deletar cadastro de funcionario
        Dado que o usuario queira deletar um funcionario
        Quando ele enviar a identificacao unica
        Então esse funcionario sera deletado do sistema