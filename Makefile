# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jisokang <jisokang@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/30 17:02:16 by jisokang          #+#    #+#              #
#    Updated: 2022/09/04 22:53:29 by jisokang         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= inception
DB_PATH	= /home

all		:	$(NAME)

$(NAME)	:
##Path 변경해야함!
	mkdir -p ./data/mariadb/
	mkdir -p ./data/wordpress/
	docker-compose -f ./srcs/docker-compose.yaml up --build

help	: ## 실행가능한 명령을 출력
	@echo " make [command]"
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m %-5s\033[0m \t%s\n", $$1, $$2}'

down	: ## 컨테이너들을 일괄 정지
	@echo "Down all"
	docker-compose -f ./srcs/docker-compose.yaml down

clean	: ## 컨테이너를 일괄정지 하고 이미지와 연결된 볼륨 전부 삭제
	docker-compose -f ./srcs/docker-compose.yaml down --rmi -volumes

fclean	: clean ## 로컬 볼륨 파일까지 전부 삭제
	rm -rf ./data/mariadb/*
	rm -rf ./data/wordpress/*

re	: fclean all ## fclean 실행 후 다시 make 실행

.PHONY	: help all down clean fclean re
