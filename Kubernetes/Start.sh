#!/bin/bash

"create deployments"



echo "Démarrage de Minikube..."
minikube start --driver=docker &

echo "Lancement du tunnel..."
minikube tunnel &

"lancer le script pour update iP & "

echo "Lancement du dashboard Kubernetes..."
minikube dashboard &
