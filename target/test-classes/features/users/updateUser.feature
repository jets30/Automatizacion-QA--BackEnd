Feature: Actualizar usuario

  Background:
    * url baseUrl

  Scenario: PUT /usuarios/{_id} modifica un usuario existente
    * def payload = createUserPayload('update')
    Given path '/usuarios'
    And request payload
    When method post
    Then status 201
    * def userId = response._id
    * def updatedPayload = { nome: 'QA Automation Updated', password: 'Teste@321', administrador: 'false' }
    * updatedPayload.email = uniqueEmail('update')

    Given path '/usuarios', userId
    And request updatedPayload
    When method put
    Then status 200
    And match response.message == 'Registro alterado com sucesso'

    Given path '/usuarios', userId
    When method get
    Then status 200
    And match response.nome == updatedPayload.nome
    And match response.administrador == updatedPayload.administrador
