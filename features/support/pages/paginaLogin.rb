class PaginaLogin
  
  include RSpec::Matchers
  include Capybara::DSL

  def login_valido_black_list
    assert_selector(EL['usuario'], wait: 15)
    find(EL['usuario']).set(DATA["user_cpf_black_list"])
    find(EL['senha']).set(DATA["password_cpf_black_list"])
    find(EL['botao_entrar']).click

    if has_selector?(EL['flash_login_result'], wait: 15, visible:true)
      flashmessege = find(EL['flash_login_result']).text
      raise flashmessege
    end
  end

  def login_valido_white_list
    assert_selector(EL['usuario'], wait: 15)
    find(EL['usuario']).set(DATA["user_cpf_withe_list"])
    find(EL['senha']).set(DATA["password_cpf_withe_list"])
    find(EL['botao_entrar']).click

    if has_selector?(EL['flash_login_result'], wait: 15, visible:true)
      flashmessege = find(EL['flash_login_result']).text
      raise flashmessege
    end
  end

  def login_invalido
    assert_selector(EL['usuario'], wait: 15)
    find(EL['usuario']).set(DATA["mail_user_pf_invalido"])
    find(EL['senha']).set(DATA["pass_user_pf_invalido"])
    find(EL['botao_entrar']).click
  end
  
end
