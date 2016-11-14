# Makefile for building RabbitMQ/WS/MQTT

BASE_COMPOSE = ./compose/docker-compose.yml
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
	$(COMPOSE) logs --follow $(ENV)


logs_flask:
	$(COMPOSE) logs --follow flask

open: up
	@# Flask port
	$(OPEN) http://localhost
	$(OPEN) http://localhost/jupyter

watch:
	echo "TODO!"

exec:
	$(COMPOSE) exec $(CMD)
