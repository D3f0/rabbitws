# Docker IoT + Web

![Esquema](./docs/diag.png)

# Uso

En el [`Makefile`](./Makefile) se definen las los siguientes targets:

* **up** Crear los contenedores
* **down** Destruir los contenedores
* **open** Abrir el navegador

# Posibles Problemas

* El puerto de nginx es el 80. Como Docker corre con privilegios puede escuchar en este puerto, pero si ya existe un proceso escuchando en este puerto será necesario modificar la línea [dónde se define `- "80:80"`](https://github.com/D3f0/rabbitws/blob/0451c414a7efcb57a1eb96f8577182aec598da42/compose/docker-compose.yml#L42) en el archivo (compose/docker-compose.yml)[compose/docker-compose.yml]
* Retardo en el inicio de RabbitMQ. Es posible que se demore el inicio de Rabbit y el socket quede en estado conectando. Basta con refrescar.

