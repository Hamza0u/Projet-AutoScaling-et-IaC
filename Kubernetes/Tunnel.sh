#!/bin/bash

echo "🚀 Démarrage de Minikube..."
minikube start

echo "🛣️ Lancement du tunnel..."
minikube tunnel
