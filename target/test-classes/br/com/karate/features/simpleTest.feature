Feature: Buscar User

  Background:
    # Carrega o arquivo karate-config.js e retorna as variáveis definidas nele.
    * def config = karate.callSingle('classpath:br/com/karate/domain/karate-config.js')

    # config.baseUrl e config.token: Acessa as propriedades que você definiu no arquivo de configuração.
    * url config.baseUrl
    * header Authorization = 'Bearer ' + config.token

  Scenario: Verify simple functionality
    Given path 'users/7497949'
    When method get
    Then status 200
