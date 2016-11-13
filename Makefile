# Makefile for building RabbitMQ/WS/MQTT

BASE_COMPOSE = ./compose/docker-compose.yml
#OVERRIDE = -f ./compose/docker-compose.dev.yml
COMPOSE_FILE = -f $(BASE_COMPOSE) $(OVERRIDE)

PROJECT_NAME = mqtt
COPMOSE_ARGS = $(COMPOSE_FILE) -p $(PROJECT_NAME)

COMPOSE = docker-compose $(COPMOSE_ARGS)

up:
	$(COMPOSE) up --build -d

down:
	$(COMPOSE) $@

re: down up

ps:
	$(COMPOSE) $@

stop:
	$(COMPOSE) $@

start:
	$(COMPOSE) $@

build:
	$(COMPOSE) $@

restart:
	$(COMPOSE) $@

kill:
	$(COMPOSE) $@

logs:
	$(COMPOSE) $@

logf:
	$(COMPOSE) logs --follow $(ENV)


logs_flask:
	$(COMPOSE) logs --follow flask

open: up
	@# Flask port
	open http://localhost:4000

watch:
	echo "TODO!"

exec:
	$(COMPOSE) exec $(CMD)
