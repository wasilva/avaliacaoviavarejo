#language: pt
#encoding: UTF-8
#cenario: 1
@automatizado
Funcionalidade: Cadastro de clientes Pessoa fisíca e Jurídica
  Como gerente do produto APP, que seja possivel cadastros no msite de clientes
  Pessoa física e jurídica.

Contexto:

  Dado que eu esteja no m.site

@cadastro 
Esquema do Cenario: Realizar cadastro através da tela de login do msite.

  E seleciono o menu, "minha_conta"
  E clico em "cadastre_se"
  Quando preencho o formulario de cadastro com o <tipo_conta>
  Entao visualizo a pagina minha conta

  Exemplos:
    | tipo_conta |
    |   "PF"     |
    |   "PJ"     |