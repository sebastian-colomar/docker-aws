#!/bin/bash -x
#        ./bin/app-deploy-swarm.sh
#########################################################################
#      Copyright (C) 2020        Sebastian Francisco Colomar Bauza      #
#      SPDX-License-Identifier:  GPL-2.0-only                           #
#########################################################################
set +x && test "$debug" = true && set -x                                ;
#########################################################################
apps="                                                                  \
        php.yaml                                                        \
"                                                                       ;
branch_app=manual                                                       ;
domain=github.com                                                       ;
mode=swarm                                                              ;
repository_app=docker-aws                                               ;
username_app=secobau                                                    ;
#########################################################################
B=$username_app/$repository_app                                         ;
path=etc/docker/$mode                                                   ;
uuid=/tmp/$( uuidgen )                                                  ;
#########################################################################
git clone                                                               \
        --single-branch --branch $branch_app                            \
        https://$domain/$B                                              \
        $uuid                                                           \
                                                                        ;
for app in $apps                                                        ;
do                                                                      \
        sudo docker stack deploy --compose-file $uuid/$path/$app $app   ;
done                                                                    ;
rm --force --recursive $uuid                                            ;
#########################################################################
sudo docker stack ls                                                    ;
sudo docker service ls                                                  ;
#########################################################################
