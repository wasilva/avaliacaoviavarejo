module PageObjects
  def paginaComum
    PaginaComum.new
  end

  def paginaLogin
    return PaginaLogin.new
  end

  def paginaPesquisa
    return PaginaPesquisa.new
  end

  def paginaValidacao
    return PaginaValidacao.new
  end

  def paginaEndereco
    return PaginaEndereco.new
  end

  def paginaPagamento
    return PaginaPagamento.new
  end

  def paginaMenu
    return PaginaMenu.new
  end

  def paginaConta
    return PaginaConta.new
  end
end
