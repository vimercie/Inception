# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vimercie <vimercie@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/06 01:46:15 by vimercie          #+#    #+#              #
#    Updated: 2023/11/09 01:49:16 by vimercie         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

USER=			vimercie
COMPOSE=		docker compose -f srcs/docker-compose.yml
VOLUME_DIR=		/home/${USER}/data
MARIADB_VOL=	${VOLUME_DIR}/mariadb
WORDPRESS_VOL=	${VOLUME_DIR}/wordpress

all:
	mkdir -p ${MARIADB_VOL} ${WORDPRESS_VOL}
	${COMPOSE} up

stop:
	${COMPOSE} stop

clean:
	${COMPOSE} down -v

fclean: clean clean-volumes clean-images

clean-images:
	docker image prune -a -f

clean-volumes:
	docker volume prune -a -f

prune:	fclean
	docker system prune -a -f

re: 	fclean all

.PHONY: all stop clean fclean clean-volumes prune re