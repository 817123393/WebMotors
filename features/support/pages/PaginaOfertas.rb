class Ofertas

  include RSpec::Matchers
  include Capybara::DSL

  def realizar_busca
    assert_selector(EL["marca_honda"], wait: 20, visible:true)
    find(EL["marca_honda"], wait: 15).click
    assert_selector(EL["todos_modelos"], wait: 20, visible:true)
    find(EL["todos_modelos"], wait: 15).click
    assert_selector(EL["modelo_city"], wait: 20, visible:true)
    find(EL["modelo_city"], text:"CITY", wait: 15).click
    assert_selector(EL["todas_versoes"], wait: 20, visible:true)
    find(EL["todas_versoes"], wait: 15).click
    assert_selector(EL["titulo_versao"], wait: 20, visible:true)
    qtdOpcoes = all(EL['versao_selecionada']).count
    i = rand(0..qtdOpcoes-1)
    all(EL['versao_selecionada'])[i].click
  end

  def verificar_encontrados
    assert_selector(EL["carros_retornados"], wait: 20, visible:true)
    carrosEncontrados = find(EL["carros_encontrados"], wait:10).text
    puts  "Carros encontrados #{carrosEncontrados}"
  end

  def listagem_de_carros
    assert_selector(EL["carros_listagem"], wait: 20, visible:true)
    find(EL["botao_cookie"], wait: 15).click

    status = false

    while status == false
      begin
        execute_script('window.scrollTo(0, 50000);', wait: 1)
        assert_text("Estamos carregando", wait:10)
        assert_no_text("Estamos carregando", wait:10)
      rescue
        @qtdCarros = all(EL["carros_listagem"]).count
        puts "Retornaram #{@qtdCarros} carros"
        status = true
      end

    end
  end

  def capturar_lista_estoque
    File.open("data/estoque/loja_estoque.txt", "a") do |file|

    for i in 0..@qtdCarros-1
      nome_carro = all(EL["nome_carro"])[i].text
      adicional_carro = all(EL["especificacao_carro"])[i].text
      file.write( "#{nome_carro} - #{adicional_carro}\n" )
    end

    end
  end

end
