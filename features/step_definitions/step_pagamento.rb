# FLUXO DE COMPRA #
Dado("seleciono a {string}") do |opcao_pagamento|
  paginaPagamento.seleciona_opcao_pagamento(opcao_pagamento)
end

Quando("confirmo o {string} selecionado") do |tipo_pagamento|
  paginaPagamento.seleciona_tipo_pagamento(tipo_pagamento)
end

Quando("finalizo a compra da {string} selecionada") do |opcao_pagamento|
  case opcao_pagamento
  when "cartao_credito"
    paginaComum.clica_elemento("botao_finalizar_compra_cartao")
    # sleep(5)
  when "boleto_bancario"
    paginaComum.clica_elemento("botao_finalizar_compra_boleto")
  when "paypal"
    paginaValidacao.valida_numero_produto_paypal
  end
end

Entao("valido o numero do pedido da {string} selecionada") do |opcao_pagamento|
  case opcao_pagamento
  when "cartao_credito"
    paginaValidacao.valida_numero_pedido_cartao
  when "boleto_bancario"
    paginaValidacao.valida_numero_pedido_boleto_bancario
    paginaValidacao.valida_numero_boleto_bancario
  end
end

# FLUXO DE REVO #
Quando("seleciono a {string} na tela trocar forma de pagamento") do |opcao_pagamento_revo|
  # sleep(8)
  paginaPagamento.seleciona_opcao_pagamento_revo(opcao_pagamento_revo)
end

Entao("valido o numero do pedido do {string} selecionada") do |opcao_pagamento_revo|
  case opcao_pagamento_revo
  when "cartao_credito"
    paginaValidacao.valida_numero_pedido_cartao
  when "visa_checkout"
    paginaValidacao.valida_compra_visa_checkout
  when "boleto_bancario"
    paginaValidacao.valida_numero_pedido_boleto_bancario
  end
end

Quando("seleciono o {string}") do |tipo_pagamento_revo|
  # sleep(3)
  paginaComum.clica_elemento("tipo_pagamento_revo")
end

Quando("finalizo a compra da {string} selecionado no revo") do |tipo_pagamento|
  paginaPagamento.seleciona_tipo_pagamento_revo(tipo_pagamento)
end

# FLUXO DE RETIRA #
Quando("confirmo o {string}") do |tipo_pagamento|
  paginaPagamento.seleciona_tipo_pagamento_tipo_retira(tipo_pagamento)
end
