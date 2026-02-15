# 🚀 Dockerizar una web estática y desplegarla en AWS (Juego 2048)

---

## 🧑‍🎓 Información

- **Alumno:** Alberto Jiménez
- **Curso:** 2º DAW — 2025/2026
- **Módulo:** Despliegue de Aplicaciones Web
- **Profesor:** José Juan Sánchez
- **Centro:** IES Celia Viñas

---

## 🎯 Objetivo

Crear una imagen Docker que contenga una web estática (el juego 2048), publicarla en Docker Hub y desplegarla en un servidor AWS EC2 usando Docker Compose.

---

# 1️⃣ Crear la imagen Docker

Creamos un contenedor Nginx que servirá la página web clonada desde GitHub.

## Dockerfile

```docker
FROM ubuntu:latest

RUN apt update && apt install -y nginx git

# Eliminar web por defecto
RUN rm -rf /var/www/html/*

# Clonar juego 2048
RUN git clone https://github.com/josejuansanchez/2048 /var/www/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```

## Resultado
![Texto](./img/dockerfille.png)

---

# 2️⃣ Construir la imagen

```bash
docker build -t nginx-2048 .
docker images
```

---

# 3️⃣ Subir imagen a Docker Hub

## Login

```bash
docker login
```

## Publicar versión 1.0

```bash
docker tag nginx-2048 jimeenx9/nginx-2048:1.0
docker push jimeenx9/nginx-2048:1.0
```

## Publicar latest

```bash
docker tag jimeenx9/nginx-2048:1.0 jimeenx9/nginx-2048:latest
docker push jimeenx9/nginx-2048:latest
```

## 🏷️ Publicación versión v1.0 en Docker Hub
![Texto](./img/v1.0.png)

## 🏷️ Publicación etiqueta latest
![Texto](./img/latest.png)

---

# 4️⃣ Desplegar en AWS

Se crea una instancia **Ubuntu t3.micro** con:

- Puerto 22 → SSH
- Puerto 80 → HTTP

## ☁️ Instancias en AWS
![Texto](./img/instancias.png)

---

# 5️⃣ Levantar contenedor manualmente

```bash
docker run -d -p 80:80 --name web2048 jimeenx9/nginx-2048:1.0
docker ps
```

## Resultado
![Texto](./img/levantarimagen.png)


---

# 6️⃣ Automatizar despliegue con Docker Compose

Creamos `docker-compose.yml`

```yaml
services:web:image:jimeenx9/nginx-2048:1.0container_name:web2048ports:-"80:80"restart:always
```

## 🧩 Docker Compose funcionando
![Texto](./img/docker-compose.png)

---

# 7️⃣ Aplicación funcionando

Accedemos desde el navegador:

```
http://IP_PUBLICA
```

## 🎮 Aplicación 2048 funcionando
![Texto](./img/2048.png)
---

# 🧠 Conclusión

Se ha realizado un despliegue completo de una aplicación web siguiendo un flujo DevOps real:

1. Crear imagen Docker
2. Publicar en Docker Hub (versionado)
3. Crear servidor en la nube
4. Ejecutar contenedor
5. Automatizar con Docker Compose
6. Acceso público desde Internet

Esto reproduce un entorno profesional de despliegue en la nube.

## 📚 Referencias

- https://aws.amazon.com/ec2/
- https://josejuansanchez.org/iaw/practica-dockerizar-web/index.html

---

© 2026 — Práctica realizada por **Alberto Jiménez**