JOB_NAME=php
PROJECT_NAME=${JOB_NAME}
USER_ID=${shell id -u}
GROUP_ID=${shell id -g}
COMPOSE=docker-compose -f docker-compose.yml

.EXPORT_ALL_VARIABLES:
DOCKER_UID=${USER_ID}
DOCKER_GID=${GROUP_ID}

up:
	${COMPOSE} build
	${COMPOSE} up -d

refresh:
	${COMPOSE} down
	${COMPOSE} build
	${COMPOSE} up -d

bash:
	${COMPOSE} exec -u root php sh
