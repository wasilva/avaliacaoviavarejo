class PaginaPagamento
  include RSpec::Matchers
  include Capybara::DSL

  def seleciona_opcao_pagamento(opcao_pagamento)
    assert_no_selector(EL["loader"], wait: 15)
    sleep(3)
    assert_selector(EL["opcao_pagamento"], text: EL[opcao_pagamento], wait: 30)
    find(EL["opcao_pagamento"], text: EL[opcao_pagamento], wait: 30).click
    # binding.pry
  end

  def seleciona_tipo_pagamento(tipo_pagamento)
    assert_no_selector(EL["loader"], wait: 15)
    sleep(3)

    if tipo_pagamento == "pagar_com_um_cartao_credito"
      # sleep(2)
      assert_selector(EL["tipo_pagamento"], text: EL[tipo_pagamento], wait: 30, visible: true)
      find(EL["tipo_pagamento"], text: EL[tipo_pagamento], wait: 30).click
    end

    # SELECIONA O METODO PARA PAGAMENTO #
    if tipo_pagamento == "pagar_com_um_cartao_credito"
      preencher_um_cartao_credito
    elsif tipo_pagamento == "pagar_com_dois_cartoes_credito"
      # sleep(2)
      assert_selector(EL["tipo_pagamento"], text: EL[tipo_pagamento], wait: 30, visible: true)
      find(EL["tipo_pagamento"], text: EL[tipo_pagamento]).click
      preencher_dois_cartoes_credito
    elsif tipo_pagamento == "pagar_com_boleto_cartao_credito"
      # sleep(2)
      assert_selector(EL["tipo_pagamento"], text: EL[tipo_pagamento], wait: 30, visible: true)
      find(EL["tipo_pagamento"], text: EL[tipo_pagamento]).click
      preenche_boleto
      avancar_boleto
      preencher_um_cartao_credito
    elsif tipo_pagamento == "pagar_com_paypal"
      # sleep(2)
      finalizar_compra_paypal
      # sleep(12)
    elsif tipo_pagamento == "pagar_com_visa_checkout"
      # sleep(3)
      assert_selector(EL["pagar_com_visa_checkout"], wait: 30, visible: true)
      all(EL["pagar_com_visa_checkout"])[0].click
    end
  end

  # SELECIONA O TIPO DE REVO ONLINE #
  def seleciona_opcao_pagamento_revo(opcao_pagamento_revo)
    sleep(10)
    # binding.pry
    case opcao_pagamento_revo
    when "cartao_credito"
      all('*[class="lst-item-action lst-item-cell-expanded"]', text: "Cart", wait: 15, visible: true)[0].hover # Label nome do pagamento
      all('*[class="lst-item-action lst-item-cell-expanded"]', text: "Cart", wait: 15)[0].find('*[class="lst-item-cell ic-large-container icon-wrapper"]').click

      sleep(2)

      assert_selector(EL["tipo_pagamento_revo"], text: "Pagar com 1", wait: 30, visible: true)
      find(EL["tipo_pagamento_revo"], text: "Pagar com 1", wait: 30).click

      # sleep(2)

      preencher_um_cartao_credito
      finalizar_compra_cartao
    when "visa_checkout"
      all('*[class="lst-item-action lst-item-cell-expanded"]', text: "Visa Checkout", wait: 15, visible: true)[0].hover # Label nome do pagamento
      all('*[class="lst-item-action lst-item-cell-expanded"]', text: "Visa Checkout", wait: 15)[0].find('*[class="lst-item-cell ic-large-container icon-wrapper"]').click

      # sleep(5)
      finalizar_compra_visa_checkout
    when "boleto_bancario"
      all('*[class="lst-item-action lst-item-cell-expanded"]', text: "Boleto", wait: 15, visible: true)[0].hover # Label nome do pagamento
      all('*[class="lst-item-action lst-item-cell-expanded"]', text: "Boleto", wait: 15)[0].find('*[class="lst-item-cell ic-large-container icon-wrapper"]').click

      # sleep(2)
      all(EL["botao_finalizar_compra_boleto"])[0].hover
      all(EL["botao_finalizar_compra_boleto"])[0].click
    end
  end

  # SELECIONA O MEIO DE PAGAMENTO FLUXO TIPO DE RETIRA #
  def seleciona_tipo_pagamento_tipo_retira(tipo_pagamento)
    assert_no_selector(EL["loader"], wait: 15)
    sleep(1)
    case tipo_pagamento
    when "pagar_com_um_cartao_credito"
      preencher_um_cartao_credito
      finalizar_compra_cartao
    when "pagar_com_dois_cartoes_credito"
      preencher_dois_cartoes_credito
      # when "boleto_bancario"
      # when "paypal"
    end
  end

  def finalizar_compra_boleto
    assert_no_selector(EL["botao_finalizar_compra_boleto"], wait: 30, visible: true)
    all(EL["botao_finalizar_compra_boleto"])[0].hover
    all(EL["botao_finalizar_compra_boleto"])[0].click
  end

  def finalizar_compra_cartao
    assert_selector(EL["botao_finalizar_compra_cartao"], wait: 30, visible: true)
    find(EL["botao_finalizar_compra_cartao"], wait: 30).hover
    find(EL["botao_finalizar_compra_cartao"], wait: 30).click
  end

  def finalizar_compra_paypal
    assert_selector(EL["botao_finalizar_compra_paypal"], wait: 30, visible: true)
    all(EL["botao_finalizar_compra_paypal"])[0].hover
    all(EL["botao_finalizar_compra_paypal"])[0].click
  end

  def finalizar_compra_visa_checkout
    assert_selector(EL["botao_finalizar_compra_visacheckout"], wait: 30, visible: true)
    all(EL["botao_finalizar_compra_visacheckout"])[0].hover
    all(EL["botao_finalizar_compra_visacheckout"])[0].click
  end

  def avancar_boleto
    first(EL["botao_avancar_boleto"], wait: 30, visible: true).hover
    first(EL["botao_avancar_boleto"]).click
  end

  def avancar_cartao
    assert_selector(EL["botao_avancar_cartao"], wait: 30, visible: true).hover
    find(EL["botao_avancar_cartao"]).click
  end

  def preencher_um_cartao_credito
    assert_selector("#number", wait: 15, visible: true)
    cartao = "4111111111111111"
    sleep(0.5)
    find(EL["cartao"]).set(cartao)
    find(EL["nome_titular"]).set("Automacao QA")
    find(EL["validade"]).set("122022")
    find(EL["codigo_seguranca"]).set("547")
    sleep(0.5)
    select("em 3x", from: EL["parcela"])
  end

  def preencher_dois_cartoes_credito
    preencher_um_cartao_credito
    find(EL["botao_continuar_dois_cartoes"], wait: 30).click
    preencher_um_cartao_credito
  end

  def preenche_boleto
    #Lembrando que a regra do valor minimo do boleto é de 50 reais
    assert_text("Adicione o valor a ser pago no Boleto", wait: 30, visible: true)
    assert_selector(EL["campo_valor_boleto"], wait: 30, visible: true)
    first(EL["campo_valor_boleto"]).hover
    first(EL["campo_valor_boleto"]).set("5100")
  end
end
