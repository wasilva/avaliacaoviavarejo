# FLUXO - CADASTRO #
Dado("seleciono o menu, {string}") do |menu|
  paginaMenu.seleciona_menu_minha_conta(menu)
end

Dado("clico em {string}") do |cadastre_se|
  paginaComum.clica_cadastre_se(cadastre_se)
end

# FLUXO - COMPRA #
Dado("que eu esteja no m.site") do
  visit(URLMS[$site])
  sleep(3)
end

Dado("pesquiso por um {string}") do |produto|
  paginaComum.pesquisa_produto(produto)
end

Dado("adiciono o produto no carrinho selecionando comprar") do
  paginaComum.adiciona_produto_sem_garantia_carrinho_comprar
end

Dado("adiciono o produto no carrinho selecionando {string}") do |tipo_compra|
  paginaComum.adiciona_produto_sem_garantia_carrinho_tipo_comprar(tipo_compra)
end

Dado("me logo com um usuario black list") do
  paginaLogin.login_valido_black_list
end

Dado("me logo com um usuario withe list") do
  paginaLogin.login_valido_white_list
end

Quando("seleciono o produto na pagina de resultados") do
  paginaComum.seleciona_produto(0)
end

Entao("valido se o botao de play esta visivel no carrossel") do
  paginaComum.clica_elemento("botao_play_video_pdp")
  paginaComum.clica_elemento("botao_fechar_video")
end

Dado("seleciono entrega normal") do
  paginaEndereco.entrega_normal
end

# FLUXO - RETIRA #
Dado("pesquiso por um produto do {string}") do |tipo_retira|
  paginaComum.pesquisa_produto_tipo_retira(tipo_retira)
end

Dado("adiciono o produto no carrinho selecionando o {string}") do |tipo_retira|
  paginaComum.adiciona_produto_sem_garantia_carrinho_tipo_retira(tipo_retira)
end

Dado("seleciono continuar") do
  paginaComum.informa_celular_tipo_retira # APENAS SE O MODAL DE RETIRA LOCKERS E CORREIOS ESTIVER VISIVEL
  paginaComum.clica_elemento("botao_continuar_endereco")
end
