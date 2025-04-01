#!/bin/bash

echo "🚀 Démarrage de Minikube..."
minikube start

echo "🛣️ Lancement du tunnel..."
minikube tunnel &

# Attendre quelques secondes pour éviter tout problème avec le tunnel
sleep 10

echo "📦 Création des déploiements..."
kubectl apply -f redis-deployment.yml
kubectl apply -f front-deployment.yml
kubectl apply -f frontend-configmap.yml
kubectl apply -f serveur-deployment.yml
kubectl apply -f redis-replica-deployment.yml

# Attendre que les services soient bien créés avant de mettre à jour le ConfigMap
sleep 10

echo "🔄 Lancement du script pour récupérer l'IP du serveur..."
./update-configmap.sh

echo "📊 Lancement du dashboard Kubernetes..."
minikube dashboard &

