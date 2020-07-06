Para execução do projeto, instale as dependencias:

gem install bundler
gem install rspec   
gem install capybara-cucumber
gem install pry      
gem install capybara-poltergeist   

para iniciar a automação 
cucumber -t @compra -p html -p cb -p chrome

Nota: De acordo com o arquivo cucumber.yaml é possivel iniciar a automação por ambiente Extra, Casas Baia e Ponto Frio.
cb: ENVIROMENT=cb
ex: ENVIROMENT=ex
pf: ENVIROMENT=pf

os elementos estão mapeados por ambiente tambem. Assim usamos o mesmo framework para automtazar todas as bandeiras.

