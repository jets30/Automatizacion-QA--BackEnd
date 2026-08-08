Feature: Buscar usuario por ID

  Background:
    * url baseUrl

  Scenario: GET /usuarios/{_id} devuelve un usuario existente
    * def payload = createUserPayload('read')
    Given path '/usuarios'
    And request payload
    When method post
    Then status 201
    * def userId = response._id

    Given path '/usuarios', userId
    When method get
    Then status 200
    And match response._id == userId
    And match response.nome == payload.nome
    And match response.email == payload.email
    And match response.administrador == payload.administrador
