class PaginaComum
  include RSpec::Matchers
  include Capybara::DSL

  #   def pesquisa_sku
  #     assert_selector(EL['campo_pesquisa'], wait: 15)
  #     find(EL['campo_pesquisa']).set(DATASKU["id_sku"])
  #     all(EL['botao_buscar'])[0].click
  #     assert_selector(EL['produto_busca'], wait: 20, visible:true)
  #   end

  def pesquisa_produto(produto)
    produto = DATASKU[produto]
    produto = produto.sample

    puts("Produto selecionado: " + produto)

    case $site
    when "ponto_frio"
      sleep(3)
      assert_selector(EL["campo_pesquisa"], wait: 10)
      find(EL["campo_pesquisa"], wait: 10).set(produto)

      # sleep(3)

      all('*[class="search-item-button"]', wait: 10) # Botão pesquisr
      all('*[class="search-item-button"]')[0].click
    else
      sleep(3)
      assert_selector(EL["campo_pesquisa"], wait: 10)
      find(EL["campo_pesquisa"], wait: 10).set(produto)
      sleep(3)
      assert_selector(EL["botao_buscar"], wait: 10)
      first(EL["botao_buscar"], wait: 10).click
    end
  end

  # PESQUISA O SKU POR TIPO DE RETIRA #
  def pesquisa_produto_tipo_retira(tipo_retira)
    # binding.pry

    case tipo_retira
    when "sku_retira"
      tipo_retira = DATASKU[tipo_retira]
      tipo_retira = tipo_retira.sample
    when "sku_correios"
      tipo_retira = DATASKU[tipo_retira]
      tipo_retira = tipo_retira.sample
    when "sku_lockers"
      tipo_retira = DATASKU[tipo_retira]
      tipo_retira = tipo_retira.sample
    when "reserva"
      # #
    end

    # binding.pry

    puts("Produto selecionado: " + tipo_retira)
    # sleep(3)
    assert_selector(EL["campo_pesquisa"], wait: 10)
    find(EL["campo_pesquisa"], wait: 10).set(tipo_retira)
    # sleep(3)
    assert_selector(EL["botao_buscar"], wait: 10)
    find(EL["botao_buscar"], wait: 10).click
  end

  # ADICIONA O PRODUTO NO CARRINHO - FLUXO DE COMPRA #
  def adiciona_produto_sem_garantia_carrinho_comprar
    # sleep(3)
    seleciona_produto(0)
    # sleep(3)

    case $site
    when "ponto_frio"
      all(ELDIF["botao_comprar"], wait: 20)
      all(ELDIF["botao_comprar"], wait: 20)[0].hover
      all(ELDIF["botao_comprar"], wait: 20)[0].click

      assert_no_selector(EL["loader"], wait: 15)
      assert_selector(EL["botao_recusa_seguro"], wait: 20, visible: true)
      first(EL["botao_recusa_seguro"], wait: 10, visible: true).click

      assert_selector(EL["botao_continuar_carrinho"], wait: 20, visible: true)
      first(EL["botao_continuar_carrinho"]).click
    else
      assert_selector(EL["botao_comprar"], wait: 20)
      all(EL["botao_comprar"], wait: 20)[0].hover
      all(EL["botao_comprar"], wait: 20)[0].click

      assert_no_selector(EL["loader"], wait: 15)
      assert_selector(EL["botao_recusa_seguro"], wait: 20, visible: true)
      first(EL["botao_recusa_seguro"], wait: 10, visible: true).click

      assert_selector(EL["botao_continuar_carrinho"], wait: 20, visible: true)
      first(EL["botao_continuar_carrinho"]).click
    end
  end

  # DIRECIONA O FLUXO DE ACORDO COM O TIPO DE COMPRA #
  def adiciona_produto_sem_garantia_carrinho_tipo_comprar(tipo_compra)
    # sleep(3)
    seleciona_produto(0)
    # sleep(3)

    case tipo_compra
    when "marketing_place"
      assert_selector(EL["link_outras_lojas_cb"], wait: 20)
      find(EL["link_outras_lojas_cb"], text: "outras lojas").hover
      find(EL["link_outras_lojas_cb"], text: "outras lojas").click
      sleep(2)
      x = all('*[class="btn success expanded btn-container"]', text: "Comprar").length
      num_rand = x + 1
      nome_lojista = all('*[class="lst-item-cell lst-item-cell-expanded"]')[num_rand].text
      all('*[class="lst-item-cell lst-item-cell-expanded"]')[num_rand].hover
      #binding.pry
      # all('*[class="lst-item-cell lst-item-cell-expanded"]', text: "#{nome_lojista}", wait: 15)[0].find('*[class="btn success expanded btn-container]').click

      # all('*[class="btn success expanded btn-container"]', text: "Comprar")[num_rand].click
      # all('[class="lst-item-cell lst-item-cell-expanded"]')[num_rand].find('[class="btn success expanded btn-container"]', text: "Comprar").click
    end
  end

  # ADICIONA O PRODUTO NO CARRINHO - FLUXO RETIRA RAPIDO #
  def adiciona_produto_sem_garantia_carrinho_retira
    seleciona_produto(0)
    assert_selector(EL["botao_retira_rapido"], wait: 15, visible: true)
    all(EL["botao_retira_rapido"])[0].hover
    all(EL["botao_retira_rapido"])[0].click

    assert_selector(EL["botao_usar_minha_localizacao"], wait: 60, visible: true)
    all(EL["botao_usar_minha_localizacao"])[0].click

    # assert_no_selector(EL["loader"], visible: true)

    assert_selector(EL["botao_retirar_neste_local"], visible: true)
    all(EL["botao_retirar_neste_local"])[0].click

    assert_selector(EL["botao_recusa_seguro"], visible: true)
    first(EL["botao_recusa_seguro"]).click

    assert_selector(EL["botao_continuar_carrinho"], wait: 60, visible: true)
    first(EL["botao_continuar_carrinho"]).click
  end

  def adiciona_produto_sem_garantia_carrinho_correios
    seleciona_produto(0)
    assert_selector(EL["botao_retira_rapido"], wait: 20, visible: true)
    all(EL["botao_retira_rapido"])[0].hover
    all(EL["botao_retira_rapido"])[0].click

    sleep(2)

    assert_selector(EL["botao_usar_minha_localizacao"], wait: 20, visible: true)
    all(EL["botao_usar_minha_localizacao"])[0].click

    sleep(2)

    # assert_no_selector(EL["loader"], wait: 120, visible: true)
    # sleep(15)

    all('*[class="card-store-search-list"]', text: "AC", wait: 15, visible: true)[0].hover # Label nome lojista
    all('*[class="card-store-search-list"]', text: "AC")[0].find('*[class="btn btn-primary expanded"]').click

    assert_selector(EL["botao_continuar_carrinho"], wait: 20, visible: true)
    all(EL["botao_continuar_carrinho"])[0].hover
    all(EL["botao_continuar_carrinho"])[0].click
  end

  def adiciona_produto_sem_garantia_carrinho_lockers
    seleciona_produto(0)
    assert_selector(EL["botao_retira_rapido"], wait: 20, visible: true)
    all(EL["botao_retira_rapido"])[0].hover
    all(EL["botao_retira_rapido"])[0].click

    # INPUTA O CEP NO CAMPO #
    assert_selector('*[class="ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required ng-valid-pattern"]', wait: 20) # Campo CEP
    find('*[class="ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required ng-valid-pattern"]').set("04004040")

    # PESQUISA O CEP #
    assert_selector('*[class="input-ic input-ic-action ic-gd-styl ic-search"]', wait: 20) # Botao pesquisar
    find('*[class="input-ic input-ic-action ic-gd-styl ic-search"]').click

    sleep(5)

    # LABEL NOME LOJISTA NA LISTA MODAL LEVE #
    all('*[class="card-store-search-list"]', text: "Locker", wait: 60)[0].hover # Label com nome do lojista
    all('*[class="card-store-search-list"]', text: "Locker")[0].find('*[class="btn btn-primary expanded"]').click

    assert_selector(EL["botao_continuar_carrinho"], wait: 20, visible: true)
    all(EL["botao_continuar_carrinho"])[0].hover
    all(EL["botao_continuar_carrinho"])[0].click
  end

  # DETERMINA O TIPO DE SKY PELO TIPO DE RETIRA (LOCKERS, CORREIOS, RESERVA)
  def adiciona_produto_sem_garantia_carrinho_tipo_retira(tipo_retira)
    case tipo_retira
    when "sku_retira"
      adiciona_produto_sem_garantia_carrinho_retira
    when "sku_correios"
      adiciona_produto_sem_garantia_carrinho_correios
    when "sku_lockers"
      adiciona_produto_sem_garantia_carrinho_lockers
    when "reserva"
      # #
    end
  end

  # SELECIONA QUALQUER ELEMENTO DE UM ARRAY, POR PARAMENTRO NO METEDO #
  def seleciona_produto(index)
    assert_selector(".lst-small-padding", wait: 60, visible: true)
    all(".lst-small-padding")[index.to_i].click
  end

  # CLICA EM QUALQUER ELEMENTO POR PARAMETRO NO METODO #
  def clica_elemento(botao, index = 0)
    sleep(3)
    assert_no_selector(EL["loader"], wait: 30) # aguarda o load do botao
    # sleep 1
    assert_selector(EL[botao], wait: 30, visible: true) # aciona o elemento de clique pela classe que contem botoao
    all(EL[botao], wait: 30)[index].click
    # sleep 1
  end

  # CLICA EM QUALQUER ELEMENTO QUE CONTENHA UM TEXTO ESPECIFICO #
  def clica_elemento_texto(botao, texto, index = 0)
    # sleep 3
    assert_no_selector(EL["loader"], wait: 20)
    all(eval($EL)[botao], text: texto)[index].click
  end

  def clica_cadastre_se(cadastre_se)
    # sleep(3)
    all(EL["cadastre_se"], wait: 20, visible: true)[0].click
    # sleep(8)
  end

  # PREENCHE CELULAR MODAL DE RETIRA LOCKERS, CORREIOS #
  def informa_celular_tipo_retira
    # sleep(3)
    if has_selector?("#phoneNumber")
      celular = 1122224444
      find("#phoneNumber").set(celular)
    end
  end

  # DÁ O FOCO NA NOVA PAGINA ABERTA DENTRO DO APP #
  def foco_browser
    result = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.window(result)
  end
end
