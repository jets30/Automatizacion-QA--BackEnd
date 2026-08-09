# Casos de prueba - API de usuarios (ServeRest)

## Objetivo del reto
Validar el flujo CRUD de usuarios a través de la API REST de ServeRest para asegurar que las operaciones de consulta, creación, actualización y eliminación funcionan correctamente.

## Alcance
Se cubren los siguientes endpoints:
- GET /usuarios
- POST /usuarios
- GET /usuarios/{_id}
- PUT /usuarios/{_id}
- DELETE /usuarios/{_id}

## Casos cubiertos

### 1. Listar usuarios
- Endpoint: GET /usuarios
- Resultado esperado: respuesta HTTP 200
- Verificación: `quantidade` es numérico y `usuarios` es un array

### 2. Crear usuario con datos válidos
- Endpoint: POST /usuarios
- Resultado esperado: HTTP 201
- Verificación: mensaje `Cadastro realizado com sucesso` y `_id` válido

### 3. Validar email inválido al crear usuario
- Endpoint: POST /usuarios
- Entrada: email sin formato correcto
- Resultado esperado: HTTP 400
- Verificación: mensaje `email deve ser um email válido`

### 4. Consultar usuario por ID
- Endpoint: GET /usuarios/{_id}
- Resultado esperado: HTTP 200
- Verificación: el usuario devuelto coincide con el ID solicitado y con los datos creados

### 5. Actualizar usuario existente
- Endpoint: PUT /usuarios/{_id}
- Resultado esperado: HTTP 200
- Verificación: mensaje `Registro alterado com sucesso`

### 6. Eliminar usuario existente
- Endpoint: DELETE /usuarios/{_id}
- Resultado esperado: HTTP 200
- Verificación: mensaje `Registro excluído com sucesso`

### 7. Verificar que el usuario eliminado ya no exista
- Endpoint: GET /usuarios/{_id}
- Resultado esperado: HTTP 400
- Verificación: mensaje `Usuário não encontrado`

## Matriz de trazabilidad

| Requisito funcional | Caso de prueba |
| --- | --- |
| Listado de usuarios | Caso 1 |
| Creación de usuario válido | Caso 2 |
| Validación de email inválido | Caso 3 |
| Obtención por ID | Caso 4 |
| Actualización de usuario | Caso 5 |
| Eliminación de usuario | Caso 6 |
| Confirmación de eliminación | Caso 7 |

## Criterio de aceptación general
La suite de pruebas debe validar que la API responde con códigos HTTP correctos, mensajes esperados y estructuras JSON consistentes durante el ciclo CRUD del usuario.
