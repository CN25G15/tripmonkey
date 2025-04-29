@ECHO OFF

ECHO "  ______ ______ ______ ______ ______ ______ ______ ______ ______ ______  "
ECHO " |______|______|______|______|______|______|______|______|______|______| "
ECHO "       |__   __| (_)                           | |                       "
ECHO "          | |_ __ _ _ __  _ __ ___   ___  _ __ | | _____ _   _           "
ECHO "          | | '__| | '_ \| '_ ` _ \ / _ \| '_ \| |/ / _ | | | |          "
ECHO "          | | |  | | |_) | | | | | | (_) | | | |   |  __| |_| |          "
ECHO "          |_|_|  |_| .__/|_| |_| |_|\___/|_| |_|_|\_\___|\__, |          "
ECHO "                   | |                                    __/ |          "
ECHO "  ______ ______ ___|_| ______ ______ ______ ______ ______|___/__ ______  "
ECHO " |______|______|______|______|______|______|______|______|______|______| "

minikube addons enable metrics-server
minikube start
kubectl apply -f 'https://strimzi.io/install/latest?namespace=default' -n default
kubectl apply -f mongodb-kubernetes-operator/config/crd/bases/mongodbcommunity.mongodb.com_mongodbcommunity.yaml
kubectl apply -k mongodb-kubernetes-operator/config/rbac/ --namespace default
kubectl create -f mongodb-kubernetes-operator/config/manager/manager.yaml --namespace default
