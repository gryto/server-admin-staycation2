FROM node:16.7.0-alpine as builder
WORKDIR /app
COPY package.json .

ARG NODE_ENV
RUN npm install --only=production

# ==== Final Image
FROM node:16.7.0-alpine as final
USER node:node
WORKDIR /app
# Copying required resources
COPY --chown=node:node resources resources
# Copying build output
COPY --from=builder --chown=node:node /app/package*.json ./
COPY --from=builder --chown=node:node /app/build/ build
# Copying production only node modules
COPY --from=builder --chown=node:node /app/node_modules/ node_modules

COPY . .
EXPOSE 3000
CMD ["npm", "start"]