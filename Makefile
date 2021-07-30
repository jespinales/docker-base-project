default: up

COMPOSE=docker-compose -f docker-compose.yml

up:
	${COMPOSE} up -d

down:
	${COMPOSE} down

build:
	${COMPOSE} up -d --no-deps --build php

bash:
	${COMPOSE} exec -u root php sh
