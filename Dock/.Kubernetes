FROM node:18

# Définir le répertoire de travail à l'intérieur du conteneur
WORKDIR /usr/src/app

# Copier le fichier package.json et yarn.lock (si disponible) dans le conteneur
COPY redis-node/package*.json ./

# Installer les dépendances
RUN npm install --legacy-peer-deps


# Copier tous les fichiers du projet dans le conteneur
COPY redis-node/ ./

# Exposer le port sur lequel votre application va écouter
EXPOSE 3000

# Définir les variables d'environnement
ENV REDIS_URL='redis://fc71ec7b92d1:6379'
ENV REDIS_REPLICAS_URL=$REDIS_URL
ENV PORT=3000

# Démarrer le serveur Node.js
CMD ["node", "main.js"]

