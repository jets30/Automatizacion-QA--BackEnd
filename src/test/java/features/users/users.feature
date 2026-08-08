Feature: Usuarios - CRUD con ServeRest

  Background:
    * url baseUrl

  Scenario: GET /usuarios retorna listado con estructura correcta
    Given path '/usuarios'
    When method get
    Then status 200
    And match response.quantidade == '#number'
    And match response.usuarios == '#array'
    And match response.usuarios[0] == { nome: '#string', email: '#string', password: '#string', administrador: '#string', _id: '#string' }

  Scenario: POST /usuarios crea un usuario con datos válidos
    * def payload = createUserPayload('crud')
    Given path '/usuarios'
    And request payload
    When method post
    Then status 201
    And match response.message == 'Cadastro realizado com sucesso'
    And match response._id == '#regex [A-Za-z0-9]{16}'

  Scenario: GET /usuarios/{_id} devuelve el usuario solicitado
    * def payload = createUserPayload('byid')
    Given path '/usuarios'
    And request payload
    When method post
    Then status 201
    * def userId = response._id

    Given path '/usuarios', userId
    When method get
    Then status 200
    And match response.nome == '#string'
    And match response.email == '#string'
    And match response.password == '#string'
    And match response.administrador == '#string'
    And match response._id == userId

  Scenario: PUT /usuarios/{_id} actualiza un usuario
    * def payload = createUserPayload('put')
    Given path '/usuarios'
    And request payload
    When method post
    Then status 201
    * def userId = response._id
    * def updatePayload = { nome: 'Usuario Actualizado', password: 'NovaSenha@123', administrador: 'false' }
    * updatePayload.email = uniqueEmail('update')

    Given path '/usuarios', userId
    And request updatePayload
    When method put
    Then status 200
    And match response.message == 'Registro alterado com sucesso'

  Scenario: DELETE /usuarios/{_id} elimina un usuario
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