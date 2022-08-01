# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jisokang <jisokang@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/31 13:21:51 by jisokang          #+#    #+#              #
#    Updated: 2022/08/01 16:21:53 by jisokang         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

LABEL	maintainer="jisokang <jisokang@student.42seoul.kr>"

RUN		apt-get update -y && \
		apt-get upgrade -y && \
		apt-get -y install nginx openssl vim

RUN		mkdir /etc/nginx/ssl

RUN		openssl req -newkey rsa:4096 -days 365 -nodes -x509 \
		-subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Gon/CN=localhost" \
		-out /etc/nginx/ssl/jisokang.42.fr.crt \
		-keyout /etc/nginx/ssl/jisokang.42.fr.key
# openssl은 Nginx등과 같은 웹서버에 HTTPS를 적용하기 위한 테스트용 SSL 인증서를 생성할 때 사용하는 프로그램이다.
# 	* rsa:4096  : SSL/TLS에 가장 많이 사용하는 공개키 알고리즘. 뒤의 숫자는 키 비트수
# 	* -days 365 : 인증서 유효기간
# 	* -nodes	: no des 개인키를 비밀번호로 보호하고 싶지 않을 때, 이 옵션을 생략하면 매번 비밀번호를 입력해야함.
# 	* -x509		: 이 옵션을 사용하면 인증서명요청 대신 Self Signed 인증서를 생성한다.
# 	* -subj ""	: 인증서 안에 들어갈 정보를 명시.
# 	* -keyout (~.key) : [개인키 이름]
# 	* -out (~.crt)	  : [인증서 이름]

COPY	conf/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE	443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
# CMD와 무엇이 다른거지?
# 변경하지 않을 동작이면 entrypoint를 추천한다.

