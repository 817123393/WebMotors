Dado('que acesso o {string}') do |site|
  visit(DATA["site_webmotors"])
end

Dado('clico em {string}') do |campo|
  find(EL["ver_ofertas"]).click
end

Quando('preencho os campos necessarios') do
  @ofertas.realizar_busca
end

Quando('acesso o {string}') do |site|
  visit(DATA["estoque_Mazola"])
end


Entao('verifico a quantidade de veiculos encontrados') do
  @ofertas.verificar_encontrados
end

Entao('realizo a listagem de carros encontrados') do
  @ofertas.listagem_de_carros
  @ofertas.capturar_lista_estoque
end
