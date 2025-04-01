#!/bin/bash

# Récupérer la nouvelle IP du LoadBalancer
NEW_IP=$(kubectl get svc serveur-service -o jsonpath='{.status.loadBalancer.ingress[0].ip}')

# Vérifier si l'IP a bien été récupérée
if [ -z "$NEW_IP" ]; then
    echo "❌ Impossible de récupérer l'IP du LoadBalancer. Assurez-vous que minikube tunnel est en cours d'exécution."
    exit 1
fi

echo "✅ Nouvelle IP du backend : $NEW_IP"

# Mettre à jour le ConfigMap avec la nouvelle IP
kubectl create configmap frontend-config --from-literal=REACT_APP_API_URL="http://$NEW_IP:3001" --dry-run=client -o yaml | kubectl apply -f -

echo "✅ ConfigMap mis à jour avec succès !"

# Redémarrer le pod du frontend pour prendre en compte la mise à jour
kubectl delete pod -l app=front

