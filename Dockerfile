FROM node:16.7.0-alpine
WORKDIR /app
COPY package.json .

ARG NODE_ENV
RUN npm install --only=production
COPY . .
EXPOSE 3000
CMD ["npm", "start"]