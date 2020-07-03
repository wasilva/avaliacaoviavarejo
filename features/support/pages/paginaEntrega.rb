class PaginaEndereco
  include RSpec::Matchers
  include Capybara::DSL

  def entrega_normal
    # sleep(2)
    assert_selector(EL["tipo_entrega"], wait: 15)
    all(EL["tipo_entrega"])[0].click
    assert_selector(EL["botao_continuar_endereco"], wait: 15)
    find(EL["botao_continuar_endereco"]).click
    # binding.pry
  end

  def entrega_agendada
    assert_selector(EL["tipo_entrega"], wait: 15)
    all(EL["tipo_entrega"])[0].click
    assert_selector(EL["botao_continuar_endereco"], wait: 15)
    find(EL["botao_continuar_endereco"]).click
    # binding.pry
  end
end
