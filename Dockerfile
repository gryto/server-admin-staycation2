FROM node:16.7.0-alpine

WORKDIR /app

COPY package.json .

RUN npm install --only=production

RUN rm -rf node_modules

COPY . .

EXPOSE 3000

CMD ["npm", "start"]