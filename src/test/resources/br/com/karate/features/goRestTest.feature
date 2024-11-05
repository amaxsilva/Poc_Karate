Feature: Testes de API para o Gorest

  Background:
    * def config = karate.callSingle('classpath:br/com/karate/domain/karate-config.js')
    * url config.baseUrl
    * header Authorization = 'Bearer ' + config.token

  @post @criarNovoUsuario
  Scenario Outline: Criar um novo usuário
    Given path 'users'
    And request { "name": "#(config.randomName())", "gender": "<gender>", "email": "#(config.randomEmail())", "status": "<status>" }
    When method post
    Then status 201
    And print response

    Examples:
      | gender | status  |
      | male   | active  |
      | female | active  |
      | male   | active  |

  @post @jsonErrado
  Scenario: Criar um novo usuário com parametros errados
    Given path 'users'
    And request ' "name": "#(config.randomName())", "gender": "<gender>", "email": "#(config.randomEmail())", "status": "active" '
    When method post
    Then status 422
    And match response == [{"field":"email","message":"can't be blank"},{"field":"name","message":"can't be blank"},{"field":"gender","message":"can't be blank, can be male of female"},{"field":"status","message":"can't be blank"}]
    And print response

 @get @obterTodosUsuarios
  Scenario: Obter todos os usuários
    Given path 'users'
    When method get
    Then status 200
    And print response

  @get @usuarioNaoEncontrado
  Scenario: Obter todos os usuários
    Given path 'users/87378746'
    When method get
    Then status 404
    And match response == {message: "Resource not found"}
    And print response

   @put @atualizarUsuario
   Scenario: Atualizar um usuário
     Given path 'users/7504747'
     And request { "name": "#(config.randomName())", "email": "#(config.randomEmail())", "status": "active" }
     When method put
     Then status 200
     And print response

  @put @campoEmBranco
  Scenario: Atualizar um usuário com campo em banco
    Given path 'users/7504739'
    And request { "name": "#(config.randomName())", "email": "#(config.randomEmail())", "status": "" }
    When method put
    Then status 422
    And match response ==[{ field: "status", message: "can't be blank" }]
    And print response