# Étape 1 : Build l'application React
FROM node:18 AS build

WORKDIR /app

# Copier les fichiers essentiels pour l’installation des dépendances
COPY redis-react/package*.json redis-react/yarn.lock ./

# Installer les dépendances
RUN yarn install --frozen-lockfile

# Copier tout le projet et build l'application
COPY redis-react ./

RUN yarn build

EXPOSE 80 

# Lancer l'application en mode développement
CMD ["yarn", "start"]
