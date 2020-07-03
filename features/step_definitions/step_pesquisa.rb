Quando("seleciono o tipo de ordenacao {string}") do |tipo_ordenacao|
  paginaPesquisa.selecionar_ordenacao(tipo_ordenacao)
end

Entao("visualizo os produtos ordenados por {string}") do |ordenacao|
  assert_no_selector(EL["loader"], wait: 15)
  paginaPesquisa.send("valida_ordenacao_#{ordenacao}")
end
