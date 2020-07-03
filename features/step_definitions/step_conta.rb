Quando("preencho o formulario de cadastro com o {string}") do |tipo_conta|
  paginaConta.preenche_cadastro_sucesso(tipo_conta)
end

Entao("visualizo a pagina minha conta") do
  paginaValidacao.valida_pagina_minha_conta
end
