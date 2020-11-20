#language: pt

Funcionalidade: Realizar a busca de um veiculo para compra.

Contexto:
  Dado que acesso o "site_webmotors"

@buscar_honda
Cenario: Realizar a busca de um carro Honda City com sucesso.
  E clico em "ver_ofertas"
  Quando preencho os campos necessarios
  Entao verifico a quantidade de veiculos encontrados

@listagem
Cenario: Realizar a listagem de estoque de uma loja
  Quando acesso o "estoque_Mazola"
  Entao realizo a listagem de carros encontrados
