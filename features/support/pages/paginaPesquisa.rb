class PaginaPesquisa
  include RSpec::Matchers
  include Capybara::DSL

  # PAGINA DE PESQUISA #
  def valida_ordenacao_popularidade
    #não é possivel validar isso no front, validação é apenas para ver se a ordenacao consegue trazer resultados
    assert_selector("a[class='lst-item-action lst-small-padding lst-item-cell-expanded']", wait: 15, visible: true)
  end

  def valida_ordenacao_mais_vendidos
    #não é possivel validar isso no front, validação é apenas para ver se a ordenacao consegue trazer resultados
    assert_selector("a[class='lst-item-action lst-small-padding lst-item-cell-expanded']", wait: 15, visible: true)
  end

  def valida_ordenacao_menor_preco
    comparacao = captura_valores
    menor_maior = comparacao.sort
    expect(comparacao).to eq(menor_maior)
  end

  def valida_ordenacao_maior_preco
    comparacao = captura_valores
    maior_menor = comparacao.sort.reverse
    expect(comparacao).to eq(maior_menor)
  end

  def valida_ordenacao_a_z
    comparacao = captura_nome_produtos

    # sleep(8)

    a_z = comparacao.sort
    expect(comparacao).to eq(a_z)
  end

  def valida_ordenacao_z_a
    comparacao = captura_nome_produtos

    # sleep(8)

    z_a = comparacao.sort.reverse
    expect(comparacao).to eq(z_a)
  end

  def valida_ordenacao_visualizar_lista
    assert_selector(EL["visualizar_lista"], wait: 15, visible: true)
  end

  def valida_ordenacao_visualizar_2_itens
    assert_selector(EL["visualizar_2_itens"], wait: 15, visible: true)
  end

  def valida_ordenacao_visualizar_1_item
    assert_selector(EL["visualizar_1_item"], wait: 15, visible: true)
  end

  def seleciona_filtro(filtro)
    assert_selector("div[class='input-container']", wait: 15, visible: true)

    find("a[class='btn primary expanded']", text: "Filtrar", wait: 30, visible: true).click
    if filtro == "Faixa de desconto"
      find(".lst-item-action", text: filtro, wait: 30).click
      assert_no_selector(EL["loader"], wait: 15)
    else
      all(".lst-item-action")[4].click
      assert_no_selector(EL["loader"], wait: 15)
    end
  end

  def selecionar_ordenacao(ordenacao)
    assert_selector("div[class='input-container']", wait: 15, visible: true)
    find("div[class='input-container']").find("option", text: ordenacao).click
  end

  def captura_valores
    sleep(1)
    assert_selector(".prod-item-price", wait: 15, visible: true)
    valores = []
    valor_formatado = []

    all(".prod-item-price").each do |valor|
      valores << valor.text
    end

    valores.each do |texto|
      texto.delete!("R$ ")
      texto.delete!(".")
      texto.gsub!(",", ".")
      texto = eval(texto)
      valor_formatado << texto.to_f
    end

    valor_formatado
  end

  def captura_nome_produtos
    sleep(2)

    assert_selector(".prod-item-label.h-40", wait: 15, visible: true)
    all(".prod-item-label.h-40")[0].text

    valores = []

    qtd = all(".prod-item-label.h-40").length
    for qtd in 0...qtd
      valores << all(".prod-item-label.h-40")[qtd].text
    end
    valores
  end

  def valida_ordenacao_visualizar_lista
    assert_selector(EL["visualizar_lista"], wait: 15, visible: true)
  end

  def valida_ordenacao_visualizar_2_itens
    assert_selector(EL["visualizar_2_itens"], wait: 15, visible: true)
  end

  def valida_ordenacao_visualizar_1_item
    assert_selector(EL["visualizar_1_item"], wait: 15, visible: true)
  end

  # #
end
