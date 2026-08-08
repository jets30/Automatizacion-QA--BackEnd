Feature: Listar usuarios

  Background:
    * url baseUrl

  Scenario: GET /usuarios devuelve la colección y la estructura esperada
    Given path '/usuarios'
    When method get
    Then status 200
    And match response.quantidade == '#number'
    And match response.usuarios == '#array'
    And match response.usuarios[0] == { nome: '#string', email: '#string', password: '#string', administrador: '#string', _id: '#string' }
