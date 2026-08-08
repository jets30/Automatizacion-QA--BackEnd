Feature: Eliminar usuario

  Background:
    * url baseUrl

  Scenario: DELETE /usuarios/{_id} elimina un usuario existente
    * def payload = createUserPayload('delete')
    Given path '/usuarios'
    And request payload
    When method post
    Then status 201
    * def userId = response._id

    Given path '/usuarios', userId
    When method delete
    Then status 200
    And match response.message == 'Registro excluído com sucesso'

    Given path '/usuarios', userId
    When method get
    Then status 400
    And match response.message == 'Usuário não encontrado'
