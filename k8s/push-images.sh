#!/bin/bash

echo "  ______ ______ ______ ______ ______ ______ ______ ______ ______ ______
 |______|______|______|______|______|______|______|______|______|______|
       |__   __| (_)                           | |
          | |_ __ _ _ __  _ __ ___   ___  _ __ | | _____ _   _
          | | '__| | '_ \| '_ \` _ \ / _ \| '_ \| |/ / _ | | | |
          | | |  | | |_) | | | | | | (_) | | | |   |  __| |_| |
          |_|_|  |_| .__/|_| |_| |_|\___/|_| |_|_|\_\___|\__, |
                   | |                                    __/ |
  ______ ______ ___|_| ______ ______ ______ ______ ______|___/__ ______
 |______|______|______|______|______|______|______|______|______|______|
                                                                        "

docker image push sprugit/admin_panel
docker image push sprugit/descriptor-service
docker image push sprugit/keycloak_interface
docker image push sprugit/notification-service
docker image push sprugit/recomendations-service
docker image push sprugit/trends-service
docker image push sprugit/database-service
docker image push sprugit/rest-service
docker image push sprugit/workspace-service
docker image push sprugit/workspace_backup
