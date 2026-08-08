Feature: Registrar usuario

  Background:
    * url baseUrl

  Scenario: POST /usuarios con datos válidos
    * def payload = createUserPayload('create')
    Given path '/usuarios'
    And request payload
    When method post
    Then status 201
    And match response.message == 'Cadastro realizado com sucesso'
    And match response._id == '#string'
    And match response._id == '#regex [A-Za-z0-9]{16}'

  Scenario: POST /usuarios rechaza un email inválido
    * def payload = createUserPayload('invalid-email', { email: 'email.invalido' })
    Given path '/usuarios'
    And request payload
    When method post
    Then status 400
    And match response.email == 'email deve ser um email válido'
