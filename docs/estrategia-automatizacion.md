# Estrategia de automatización

## Objetivo
Validar de manera automatizada el ciclo completo de gestión de usuarios en la API de ServeRest, cubriendo las operaciones CRUD y comprobando la respuesta real del sistema.

## Enfoque técnico
Se utiliza una estrategia basada en pruebas de API con Karate DSL, orientada a verificar comportamiento funcional sobre HTTP y JSON.

## Patrón aplicado

### 1. Estructura por feature
Cada operación se modela como un feature independiente:
- `listUsers.feature`
- `createUser.feature`
- `getUserById.feature`
- `updateUser.feature`
- `deleteUser.feature`

Esto facilita la trazabilidad y el mantenimiento de cada caso de negocio.

### 2. Background reusable
Se usa un `Background` con la URL base del entorno para evitar duplicación de configuración en cada escenario.

### 3. Validaciones con `match`
Se validan:
- status HTTP
- mensaje de respuesta
- tipo de campos
- estructura del JSON
- coincidencia entre datos enviados y devueltos

### 4. Datos dinámicos
Se generan emails y payloads frescos con funciones JavaScript para evitar conflictos en la base de datos de la API pública y permitir ejecuciones repetidas sin afectar la integridad del escenario.

## Cobertura del flujo
La estrategia cubre:
1. obtener listado de usuarios
2. registrar usuario con datos válidos
3. rechazar email inválido
4. consultar usuario por ID
5. actualizar un usuario existente
6. eliminar un usuario existente
7. comprobar que ya no sea encontrado tras la eliminación

## Ejecución
Desde la raíz del proyecto:

```bash
mvn test
```

También se puede ejecutar la suite principal del reto:

```bash
mvn test -Dtest=features.users.UsersRunner
```

## Buenas prácticas aplicadas
- validaciones reales sobre la API
- escenarios de éxito y error
- reutilización de datos y configuración
- separación funcional por endpoint
- enfoque en comportamiento observable del sistema
