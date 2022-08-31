# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jisokang <jisokang@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/30 17:02:16 by jisokang          #+#    #+#              #
#    Updated: 2022/08/31 12:21:53 by jisokang         ###   ########.fr        #
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
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m %-5s\033[0m \t%s\n", $$1, $$2}'

down	: ## 컨테이너들을 일괄 정지
	@echo "Down all"
	docker-compose -f ./srcs/docker-compose.yaml down

clean	: down ## 컨테이너를 일괄정지 하고 이미지까지 전부 삭제

fclean	: ## 볼륨까지 전부 삭제

re	: fclean all ## fclean 실행 후 다시 make 실행

.PHONY	: help all down clean fclean re
