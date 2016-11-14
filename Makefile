# Makefile for building RabbitMQ/WS/MQTT

BASE_COMPOSE = ./docker-compose.yml
#OVERRIDE = -f ./compose/docker-compose.dev.yml
COMPOSE_FILE = -f $(BASE_COMPOSE) $(OVERRIDE)

PROJECT_NAME = mqtt
COPMOSE_ARGS = $(COMPOSE_FILE) -p $(PROJECT_NAME)

COMPOSE = docker-compose $(COPMOSE_ARGS)

ifeq ($(OS),Windows_NT)
    OPEN = start
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
        OPEN = xdg-open
    endif
    ifeq ($(UNAME_S),Darwin)
        OPEN = open
    endif
endif


up:
	$(COMPOSE) up --build -d

custom:
	@>&2 echo $(COMPOSE)
	@echo $(COMPOSE)

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
	$(COMPOSE) logs --follow || exit 0


logs_flask:
	$(COMPOSE) logs --follow flask

open: up open_web

open_web:
	$(OPEN) http://localhost


exec:
	@echo "Para ejecutar exec:\n\t \x24(make custom) exec servicio comando"

watch_ps:
	@watch "$(COMPOSE)" ps
