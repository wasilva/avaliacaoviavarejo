class PaginaValidacao
  include RSpec::Matchers
  include Capybara::DSL

  # PAGINA DE SUCESSO #
  def valida_numero_pedido_cartao
    sleep(5)
    assert_selector("*[class='flsh-title']", text: "com sucesso", wait: 15)
    num_pedido = all(".strong")[0].text

    if num_pedido.length == 9
      p "Numero do pedido gerado: #{num_pedido}, CERTO."
    else
      raise "Numero do pedido gerado nao esta correto: #{num_pedido}, ERRO."
    end
  end

  def valida_numero_pedido_boleto_bancario
    sleep(10)
    assert_selector("*[class='strong']", wait: 15, visible: true)
    num_pedido = all(".strong")[0].text

    if num_pedido.length == 9
      p "Numero do pedido gerado: #{num_pedido}, CERTO."
    else
      raise "Numero do pedido gerado nao esta correto: #{num_pedido}, ERRO."
    end
  end

  def valida_numero_boleto_bancario
    sleep(3)

    num_boleto = find('*[class="payment-details__number-billet"]').text

    if num_boleto.length > 30
      p "Numero do boleto sendo enviado apos finalizar transacao: #{num_boleto}, CERTO."
    else
      raise "Numero do boleto nao esta sendo informado no final da transacao: #{num_boleto}, ERRO."
    end
  end

  def valida_numero_produto_paypal
    assert_no_selector("span[class='load']", wait: 15)
    assert_selector(EL["menu_paypal"], wait: 15, visible: true)
    find(EL["menu_paypal"]).click

    assert_selector(EL["link_mais"], wait: 15, visible: true)
    find(EL["link_mais"]).click

    assert_selector("*[class='item-number ng-binding']", wait: 15, visible: true)
    num_produto = find("span[class='item-number ng-binding']").text

    if num_produto.length == 7
      p "Numero do produto gerado: #{num_produto}, CERTO."
    else
      raise "Numero do produto gerado nao esta correto: #{num_produto}, ERRO."
    end
  end

  def valida_compra_visa_checkout
    assert_selector(EL["botao_reiniciar_checkout"], wait: 30, visible: true)
  end

  # PAGINA MINHA CONTA #
  def valida_pagina_minha_conta
    find('*[class="ui-view"]', text: "Minha Conta").text # Minha Conta
  end

  # PAGINA DE PRODUTOS #
  def valida_video_pdp
    # binding.pry
  end

  # #
end
