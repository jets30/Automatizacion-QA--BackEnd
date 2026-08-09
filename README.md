# Reto de Automatización QA - Backend

Este proyecto automatiza el flujo completo de gestión de usuarios de la API pública de ServeRest con Karate DSL.

## Objetivo del reto

Validar de forma automatizada el CRUD de usuarios en la API de ServeRest:

- GET /usuarios
- POST /usuarios
- GET /usuarios/{_id}
- PUT /usuarios/{_id}
- DELETE /usuarios/{_id}

Se comprueban tanto casos exitosos como validaciones de negocio y errores esperados.

## Stack tecnológico

- Java 11
- Maven
- Karate DSL 1.5.0
- JUnit 5

## Requisitos previos

- Java 11 o superior
- Maven 3.8 o superior
- Conexión a internet para consumir la API de ServeRest

## Ejecución

Desde la raíz del proyecto:

```bash
mvn test
```

Para ejecutar solo la suite principal del reto:

```bash
mvn test -Dtest=features.users.UsersRunner
```

## Estructura del proyecto

```text
src/
  test/
    java/
      karate-config.js
      helpers/
        userData.js
      features/
        users/
          users.feature
          listUsers.feature
          createUser.feature
          getUserById.feature
          updateUser.feature
          deleteUser.feature
      runners/
        TestRunner.java
```

## Cobertura de pruebas

La automatización incluye:

- consulta del listado de usuarios
- creación exitosa de un usuario
- validación de email inválido
- consulta de usuario por ID
- actualización de usuario
- eliminación de usuario
- validación de mensajes y estructuras esperadas con `match`

## Mejora aplicada

Se ha dejado una base más mantenible y útil para el reto:

- configuración centralizada en `karate-config.js`
- generación dinámica de datos de prueba para evitar duplicidad
- reutilización de payloads y helpers
- cobertura de escenarios positivos y negativos
- estructura clara y enfocada exclusivamente al reto de backend

## Estrategia de automatización y patrones utilizados

La automatización se basa en Karate DSL para modelar cada operación HTTP como un escenario independiente y verificable. Se emplean patrones comunes de pruebas API:

- `Background` para centralizar la configuración base y la URL del ambiente.
- `Given / When / Then` para definir el flujo de la petición y las validaciones.
- `match` para comprobar estructuras, tipos, mensajes y valores esperados del JSON.
- generación dinámica de datos con funciones JavaScript para evitar duplicidad y asegurar ejecución repetible.
- escenarios de éxito y error para validar comportamiento real de la API y no solo respuestas felices.
- separación por features por operación (`listUsers`, `createUser`, `getUserById`, `updateUser`, `deleteUser`) para mantener el mantenimiento y la trazabilidad.
