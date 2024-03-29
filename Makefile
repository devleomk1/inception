# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jisokang <jisokang@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/30 17:02:16 by jisokang          #+#    #+#              #
#    Updated: 2022/10/07 15:14:45 by jisokang         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= inception
BLUE	= \033[36m
COLR	= \033[0m

UNAME	:= $(shell uname -s)
ifeq ($(UNAME),Darwin)	#macOS
	DB_PATH		:= ./data
	HOST_LINK	:=
else					#Linux
	DB_PATH		:= /home/jisokang/data
	HOST_LINK	:= "127.0.0.1	jisokang.42.fr" > /etc/hosts
endif

all		:	$(NAME)

$(NAME)	:
	@echo "inception for $(BLUE)$(UNAME)$(COLR) OS setup start"
	mkdir -p $(DB_PATH)/mariadb/
	mkdir -p $(DB_PATH)/wordpress/
	@sudo echo $(HOST_LINK)
	docker-compose -f ./srcs/docker-compose.yaml up --build

help	: ## 실행가능한 명령을 출력
	@echo " make [command]"
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "$(BLUE) %-5s$(COLR) \t%s\n", $$1, $$2}'

down	: ## 컨테이너들을 일괄 정지
	@echo "Down all"
	docker-compose -f ./srcs/docker-compose.yaml down

clean	: ## 컨테이너를 일괄정지 하고 모든 이미지와 연결된 볼륨 전부 삭제
	docker-compose -f ./srcs/docker-compose.yaml down --rmi "all" --volumes

fclean	: clean ## ⚠️로컬 볼륨 파일까지 전부 삭제
	rm -rf $(DB_PATH)/mariadb/.setup
	rm -rf $(DB_PATH)/mariadb/*
	rm -rf $(DB_PATH)/wordpress/.setup
	rm -rf $(DB_PATH)/wordpress/*

re	: fclean all ## fclean 실행 후 다시 make 실행

.PHONY	: help all down clean fclean re
