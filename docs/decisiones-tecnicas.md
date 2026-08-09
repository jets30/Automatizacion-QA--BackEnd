# Decisiones técnicas

## 1. Framework elegido
Se eligió Karate DSL como base para la automatización porque está optimizado para pruebas de APIs REST. Facilita la definición de escenarios en formato claro, permite ejecutar peticiones HTTP y validar JSON con assertions nativas.

## 2. Lenguaje y entorno
Se trabaja con:
- Java 11
- Maven
- JUnit 5
- Karate DSL 1.5.0

Esto permite integrar la ejecución dentro del ecosistema Java y mantener compatibilidad con la automatización de pruebas más estándar del entorno.

## 3. Estructura de la automatización
La solución se organiza por features y runners:
- `features/users`: escenarios del CRUD
- `karate-config.js`: configuración global del entorno
- `helpers/userData.js`: generación dinámica de datos de prueba
- `runners/TestRunner.java`: punto de entrada para la ejecución

## 4. Manejo de datos de prueba
Se usa generación dinámica de emails y payloads para evitar duplicidad y garantizar que cada ejecución pueda crear registros frescos sin depender de datos fijos del entorno.

## 5. Validación de respuestas
La estrategia de assertions se centra en:
- código HTTP esperado
- estructura del JSON
- mensajes de respuesta
- existencia de campos clave
- consistencia entre la respuesta y los datos creados

## 6. Justificación del diseño
Se prioriza un diseño simple, mantenible y orientado a la verificación real del comportamiento de la API. Las pruebas no dependen de UI ni de mocks, sino de la propia API de ServeRest, lo que aporta mayor valor para la validación funcional del reto.
