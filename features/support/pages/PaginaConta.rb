class PaginaConta
  include RSpec::Matchers
  include Capybara::DSL

  def preenche_cadastro_sucesso(tipo_conta)
    # sleep(3)
    case tipo_conta
    when "PF"
      num_rand = rand(1..999)
      nome = FFaker::NameBR.name
      cpf = FFaker::IdentificationBR.cpf
      email = FFaker::Internet.email

      find(EL["nome"]).set(nome)
      find(EL["sexo_masc"]).click
      find(EL["cpf"]).set(cpf)
      find(EL["data_nasc"]).set("29/10/1985")
      find(EL["tel"]).set("11987654321")
      find(EL["email"]).set(email)
      find(EL["confirma_email"]).set(email)
      find(EL["senha"]).set("senha123")
      find(EL["confirma_senha"]).set("senha123")
      find(EL["botao_concluir_cadastro"]).click

      puts "DADOS DO CADASTRO"
      puts " "
      puts "Nome completo: " + nome
      puts "CPF: " + cpf
      puts "Data Nasc.: 29/10/1985"
      puts "Telefone: 11987654321"
      puts "E-mail: " + email
      puts "Senha: senha123"
    when "PJ"
      find("label[class='input-label radio-label radio-label-text']", text: "Pessoa jur").click
      pj = FFaker::IdentificationBR.cnpj
      email = FFaker::Internet.email

      find(EL["razao_social"]).set("Automacao teste QA Mobile")
      find(EL["nome_fantasia"]).set("QA Mobile")
      find(EL["site"]).set("https://google.com.br")
      find(EL["input_cnpj"]).set(pj)
      find(EL["inscricao_estadual"]).set("1584575")
      find(EL["tel"]).set("11987654321")
      find(EL["email"]).set(email)
      find(EL["confirma_email"]).set(email)
      find(EL["senha"]).set("senha123")
      find(EL["confirma_senha"]).set("senha123")
      find(EL["botao_concluir_cadastro"]).click

      puts "DADOS DO CADASTRO"
      puts " "
      puts "Razão Social: Automacao teste QA Mobile"
      puts "Nome fantasia: QA Mobile"
      puts "Site: https://google.com.br"
      puts "CNPJ: " + pj
      puts "Inscricao Estadual: 1584575"
      puts "Razão Social: Automacao teste QA Mobile"
      puts "Telefone: 11987654321"
      puts "E-mail: " + email
      puts "Senha: senha123"
    end
  end
end
