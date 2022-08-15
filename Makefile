include ./srcs/.env
export $(shell sed 's/=.*//' ./srcs/.env)

NAME = Inception
YAML = srcs/docker-compose.yml

DOCKER_COMPOSE = docker-compose -p $(NAME) -f $(YAML)

all: volume #domain
	$(DOCKER_COMPOSE) up -d --build
clean:
	$(DOCKER_COMPOSE) down --rmi all --volumes
	rm -rf ${VOLUME_PATH}
#	sudo rm -rf /home/${LOGIN}
fclean: clean
	docker system prune --force --all
re: fclean all

volume:
	mkdir -p ${VOLUME_PATH_DB} && mkdir -p ${VOLUME_PATH_WP}
#	sudo mkdir -p ${VOLUME_PATH_DB} && sudo mkdir -p ${VOLUME_PATH_WP}

domain:
#	echo 'AZsxdc970503!' | sudo -kS chmod +x /etc/hosts
#	echo 'AZsxdc970503!' | sudo -kS sed -i '' '/${DOMAIN_NAME}/d' /etc/hosts
#	echo 'AZsxdc970503!' | echo "127.0.0.1 ${DOMAIN_NAME}" >> /etc/hosts
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