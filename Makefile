# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vimercie <vimercie@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/06 01:46:15 by vimercie          #+#    #+#              #
#    Updated: 2023/11/06 02:43:32 by vimercie         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

USER=			vimercie
COMPOSE=		docker compose -f srcs/docker-compose.yml
VOLUME_DIR=		/home/${USER}/data
MARIADB_VOL=	${VOLUME_DIR}/mariadb-vol
WORDPRESS_VOL=	${VOLUME_DIR}/wordpress-vol

all:
	mkdir -p ${MARIADB_VOL} ${WORDPRESS_VOL}
	${COMPOSE} up -d

clean:
	${COMPOSE} down

fclean: clean clean-volumes clean-images

clean-images:
	docker image prune -a -f

clean-volumes:
	rm -rf ${MARIADB_VOL}/*
	rm -rf ${WORDPRESS_VOL}/*

prune:	fclean
	docker system prune -a -f
	rm -rf ${VOLUME_DIR}

re: 	fclean all

.PHONY: all clean fclean clean-volumes prune re