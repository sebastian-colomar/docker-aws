#!/bin/bash -x
#	./bin/cluster-swarm-init.sh
#########################################################################
#      Copyright (C) 2020        Sebastian Francisco Colomar Bauza      #
#      SPDX-License-Identifier:  GPL-2.0-only                           #
#########################################################################
set +x && test "$debug" = true && set -x				;
#########################################################################
token_worker="                                                          \
  $(                                                                    \
    sudo docker swarm init 2> /dev/null | grep token --max-count 1      \
  )                                                                     \
"                                                                       ;
echo $token_worker                                                      ;
echo RUN THIS TOKEN IN THE WORKERS                                      ;
#########################################################################
token_manager="								\
  $(									\
    sudo docker swarm join-token manager 2> /dev/null | grep token 		\
  )									\
"									;
echo $token_manager                                                     ;
echo RUN THIS TOKEN IN THE MASTERS                                      ;
#########################################################################
