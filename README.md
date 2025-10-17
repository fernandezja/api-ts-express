# api-ts-express

### Descripción
Proyecto de ejemplo de una API REST construida con TypeScript y Express, empaquetada en una imagen Docker.

### Endpoints
- `GET /api/time`: Devuelve la hora actual.
- `GET /api/ping`: Devuelve un pong con hora actual

### Comandos Docker para gestionar la imagen y el contenedor
- Construir la imagen (para docker hub):
  ```bash
  docker build -t fernandezja/api-ts-express .
  ```
- Ver la imagen:
  ```bash
  docker images fernandezja/api-ts-express
  ```
- Ejecutar el contenedor:
  ```bash
  docker run -p 3000:3000 fernandezja/api-ts-express
  ```   
- Subir la imagen a Docker Hub:
  ```bash
  docker push fernandezja/api-ts-express:latest
  ```