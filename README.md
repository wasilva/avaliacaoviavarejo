Cenários para testes de automação
    Cenários de automação para cobertura do regressivo.
    Cenários de automação para cobertura dos fluxos por funcionalidades.

Comandos basícos
    1. Captura o texto contido dentro de uma div, label, button, span, etc.:
    
        all("Informe o elemento")[0].text  #Pega o texto em uma lista na posição desejada

    2. Identifica um elemento que contenha o texto:

        assert_selector("elemento desejado", text: "texto desejado", wait: 10)

    3. Clica em um elemento:

        find("elemento desejado").click

    4. Imprime um texto no console:

        puts("Informe o texto desejado")

    5. Verifica se um elemento existe na pagina:

        assert_selector("elemento desejado")

    6. Sequencia de decisão, usando when

        case "variavel da decisao"
        when "condição 1" # Se o texto for esse, então executa este passo.
            
            defina os passos desejado

        end  # Fim da sequencia de decisão
    
    7. Sequencia de decisão, usando if

        if ("condição desejada")

            defina os passos desejado

        end

    8. Variavel para receber dados de um Array

        def nome_metodo
            valores = [] # Cria a variavel para receber o array

            qtd = all("elemento desejado").length # qtd - recebe a quantidade de itens que contem o elemento desejado

            for qtd in 0...qtd # define a quantidade de vezes que o array será populado
                valores << all("elemento desejado")[qtd].text # adiociona os valores do elemento desejado dentro do array
            end
            
            valores
        end"# avaliacaoviavarejo"  git init git add README.md git commit -m "first commit" git remote add origin https://github.com/wasilva/avaliacaoviavarejo.git git push -u origin master
