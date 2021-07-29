default: up

COMPOSE=docker-compose -f docker-compose.yml

up:
	${COMPOSE} up -d

down:
	${COMPOSE} down

bash:
	${COMPOSE} exec -u root php sh
