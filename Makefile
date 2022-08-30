# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jisokang <jisokang@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/30 17:02:16 by jisokang          #+#    #+#              #
#    Updated: 2022/08/30 13:55:50 by jisokang         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= inception

all		:	$(NAME)

help	: ## Show make commands
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m  %-30s\033[0m %s\n", $$1, $$2}'

down	: ## Down all containers
	@echo "Down all"
	docker-compose -f ./srcs/docker-compose.yaml down

clean	:


.PHONY	: help, all, down, clean, fclean, re
