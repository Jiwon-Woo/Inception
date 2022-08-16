include ./srcs/.env
export $(shell sed 's/=.*//' ./srcs/.env)

NAME = Inception
YAML = srcs/docker-compose.yml
TOOL_SH = srcs/requirements/tools/tool.sh

DOCKER_COMPOSE = docker-compose -p $(NAME) -f $(YAML)
# SUDO = sudo

all: volume #domain
	$(DOCKER_COMPOSE) up -d --build
clean:
	$(DOCKER_COMPOSE) down --rmi all --volumes
	$(SUDO) rm -rf ${VOLUME_PATH}
fclean: clean
	docker system prune --force --all
	./$(TOOL_SH)
re: fclean all

volume:
	$(SUDO) mkdir -p ${VOLUME_PATH_DB} && $(SUDO) mkdir -p ${VOLUME_PATH_WP}

domain:
	sudo chmod +x /etc/hosts
	sed -i '/${DOMAIN_NAME}/d' /etc/hosts
	echo "0.0.0.0 ${DOMAIN_NAME}" >> /etc/hosts

up:
	$(DOCKER_COMPOSE) up -d

down:
	$(DOCKER_COMPOSE) down

start:
	$(DOCKER_COMPOSE) start

stop:
	$(DOCKER_COMPOSE) stop


.PHONY: all clean re volume up down start stop