# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setting.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jisokang <jisokang@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/28 16:29:57 by jisokang          #+#    #+#              #
#    Updated: 2022/07/28 17:28:53 by jisokang         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
ENDCOLOR="\e[0m"

# Make sure only root can run our script
if (( $EUID != 0 )); then
	echo -e "root Privileges\t${RED}KO${ENDCOLOR}"
    echo -e "${YELLOW}This script must be run as root${ENDCOLOR}"
    echo -e $EUID
    exit
fi
echo -e "root Privileges\t${GREEN}OK${ENDCOLOR}"
echo -e $EUID

# Repository 인덱스 업데이트
apt-get update

# sudo 설치
apt-get install -y sudo

# 패키지 관리자가 https를 이용할 수 있도록 설정
sudo apt-get install -y apt-transport-https

# SSL 통신이 가능하도록 CA (Certificate Authorities)로부터 인증서를 획득
sudo apt-get install -y ca-certificates

# 다양한 통신 프로토콜을 지원하는 데이터 송,수신 패키지
sudo apt-get install -y curl

# Repository를 추가 및 삭제할 수 있도록 설정하는 패키지
sudo apt-get install -y software-properties-common

# git 설치
sudo apt-get install -y git

# make 설치
sudo apt-get install -y make

# vim 설치
sudo apt-get install -y vim

# systemd 설치
sudo apt-get install -y systemd

echo -e "${GREEN}Deabian Setting Done! ${ENDCOLOR}"
