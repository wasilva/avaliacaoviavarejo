#language: pt
#encoding: UTF-8
#cenario: 1

@automatizado
Funcionalidade: Video na galeria de imagens
  Como gerente do produto APP, quero que seja possivel a reprodução de
  video na galeria de imagens para os produtos que forem eleitos.
  
@video_pdp
Cenario: Validar a reprodução do video na pagina do produto

  Dado que eu esteja no m.site
  E pesquiso por um "sku_video"
  Quando seleciono o produto na pagina de resultados
  Entao valido se o botao de play esta visivel no carrossel