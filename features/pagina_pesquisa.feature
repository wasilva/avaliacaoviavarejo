#language: pt
#encoding: UTF-8
#cenario: 1

@automatizado
Funcionalidade: Filtros de pesquisa
  Como gerente do produto APP, quero que o cliente tenha a opção de realizar uma pesquisa 
  no m.site e tenha a opção de aplicar os Filtros de Popularidade, Mais Vendidos, 
  Menor Preço, Maior Preço, A - Z, Z - A, Filtro por faixa de desconto, Filtro por faixa de preço
  e tambem possa vizualizar os itens listados em 2 colunas, 1 coluna  ou em lista de itens.

Contexto:

  Dado que eu esteja no m.site
  E pesquiso por um "produto"

@filtros_pesquisa
Esquema do Cenario: Validar todos os tipos de ordenacao na pagina de resultados
  Quando seleciono o tipo de ordenacao <tipo_ordenacao>
  Entao visualizo os produtos ordenados por <tipo_validacao>

  Exemplos:
    |  tipo_ordenacao | tipo_validacao  |
    | "Popularidade"  | "popularidade"  |
    | "Mais Vendidos" | "mais_vendidos" |
    |  "Menor Preço"  |  "menor_preco"  |
    |  "Maior Preço"  |  "maior_preco"  |
    |     "A - Z"     |      "a_z"      |
    |     "Z - A"     |      "z_a"      |