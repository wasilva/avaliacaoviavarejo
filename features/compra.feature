#language: pt
#encoding: utf-8
#cenario: 1

@automatizado
Funcionalidade: Fluxo de compra
  Como gerente do produto APP, quero que seja validado todos os fluxos de compras,
  pelo fluxo do modal leve, sem nenhum tipo de serviço adicional no carrinho, com entrega normal,
  utilizando as formas de pagamento: Cartao de Crédito, Boleto, PayPal, RedePay e Visa Checkout.

Contexto:
  
  Dado que eu esteja no m.site

@compra
Esquema do Cenario: Realizar fluxo de compra, utilizando todos os meios de pagamento
  
  E pesquiso por um "produto"
  E adiciono o produto no carrinho selecionando comprar
  E me logo com um usuario black list [-LoginPage]
  E seleciono entrega normal
  E seleciono a <opcao_pagamento>
  E confirmo o <tipo_pagamento> selecionado
  Quando finalizo a compra da <opcao_pagamento> selecionada
  Entao valido o numero do pedido da <opcao_pagamento> selecionada

  Exemplos:
    | opcao_pagamento           | tipo_pagamento                        |
    | "cartao_credito"          | "pagar_com_um_cartao_credito"         | 
    | "cartao_credito"          | "pagar_com_dois_cartoes_credito"      |
    | "cartao_credito"          | "pagar_com_boleto_cartao_credito"     |
    | "boleto_bancario"         | "pagar_com_boleto"                    |
    | "paypal"                  | "pagar_com_paypal"                    |
    | "visa_checkout"           | "pagar_com_visa_checkout"             |

@compra @compra_revo
Esquema do Cenario: Realizar fluxo de compra em REVO (Recuperação de venda online), utilizando um Cartão de crédito, Visa Checkout e Boleto

  E pesquiso por um "produto"
  E adiciono o produto no carrinho selecionando comprar
  E me logo com um usuario withe list
  E seleciono entrega normal
  E seleciono a <opcao_pagamento>
  E confirmo o <tipo_pagamento> selecionado
  Quando finalizo a compra da <opcao_pagamento> selecionada
  E seleciono a <opcao_pagamento_revo> na tela trocar forma de pagamento
  Entao valido o numero do pedido do <opcao_pagamento_revo> selecionada

Exemplos:

  | opcao_pagamento   | tipo_pagamento                | opcao_pagamento_revo | tipo_pagamento_revo           |
  | "cartao_credito"  | "pagar_com_um_cartao_credito" | "cartao_credito"     | "pagar_com_um_cartao_credito" |
  | "cartao_credito"  | "pagar_com_um_cartao_credito" | "visa_checkout"      | "pagar_com_visa_checkout"     |
  | "cartao_credito"  | "pagar_com_um_cartao_credito" | "boleto_bancario"    | "pagar_com_boleto"            |
    
@compra @compra_tipoRetira
Esquema do Cenario: Realizar fluxo de Retira Rápido, Correios, Lockers e Reserva, utilizando um Cartão de crédito
    
  E pesquiso por um produto do <tipo_retira>
  E adiciono o produto no carrinho selecionando o <tipo_retira>
  E me logo com um usuario black list
  E seleciono continuar
  E seleciono a <opcao_pagamento>
  E seleciono o <tipo_pagamento>
  Quando confirmo o <tipo_pagamento>
  Entao valido o numero do pedido da <opcao_pagamento> selecionada
      
Exemplos:
  | tipo_retira            | opcao_pagamento           | tipo_pagamento                        |
  | "sku_retira"           | "cartao_credito"          | "pagar_com_um_cartao_credito"         |
  | "sku_correios"         | "cartao_credito"          | "pagar_com_um_cartao_credito"         |
  | "sku_lockers"          | "cartao_credito"          | "pagar_com_um_cartao_credito"         |
  # | "sku_reserva"          | "cartao_credito"          | "pagar_com_um_cartao_credito"         | #Não tem ambiente para automaçao

@compra @compra_lojista
Esquema do Cenario: Realizar fluxo de compra selecionando um lojista Marketing Place, parceiro, utilizando um Cartão de crédito

  E pesquiso por um <tipo_sku>
  E adiciono o produto no carrinho selecionando <tipo_compra>
  E me logo com um usuario black list
  E seleciono entrega normal
  E seleciono a <opcao_pagamento>
  E confirmo o <tipo_pagamento> selecionado
  Quando finalizo a compra da <opcao_pagamento> selecionada
  Entao valido o numero do pedido da <opcao_pagamento> selecionada

  Exemplos:
    | opcao_pagamento           | tipo_pagamento                        | tipo_sku        | tipo_compra             |
    | "cartao_credito"          | "pagar_com_um_cartao_credito"         | "sku_lojista"   | "marketing_place"       |