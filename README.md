# Reto de Automatización QA - Backend

Este proyecto implementa una suite de pruebas automatizadas para la API de usuarios de ServeRest usando Karate DSL.

## Objetivo
Validar de forma automatizada el flujo CRUD de usuarios en:
- GET /usuarios
- POST /usuarios
- GET /usuarios/{_id}
- PUT /usuarios/{_id}
- DELETE /usuarios/{_id}

## Stack
- Java 11
- Maven
- Karate DSL 1.5.0

## Requisitos
- Java 11 o superior
- Maven 3.8+
- Conexión a internet para consumir la API pública de ServeRest

## Configuración
1. Clona el repositorio.
2. Desde la raíz del proyecto ejecuta:
   ```bash
   mvn clean test
   ```
3. Si deseas ejecutar solo un feature concreto:
   ```bash
   mvn test -Dtest=features.users.UsersRunner
   ```

## Estructura del proyecto
```text
src/test/java/
  karate-config.js
  helpers/
    userData.js
  features/
    users/
      listUsers.feature
      createUser.feature
      getUserById.feature
      updateUser.feature
      deleteUser.feature
```

## Estrategia de automatización
- Se usa Karate DSL para encapsular cada operación CRUD en escenarios independientes.
- Los datos de prueba se generan dinámicamente con helpers para evitar duplicidad y facilitar la ejecución repetida.
- Las validaciones incluyen asserts de status code, mensajes de respuesta y estructura JSON con match.
- Se cubren escenarios positivos y negativos para aumentar la confiabilidad del suite.

## Observaciones
La API objetivo del reto es https://serverest.dev, no ReqRes. El proyecto se ajustó para cumplir con la definición del caso de uso del reto y con la especificación de comportamiento real de la API.
