FROM node:16.7.0-alpine as builder

WORKDIR /app

COPY package.json .

RUN npm install --only=production

COPY . .

EXPOSE 3000

CMD ["npm", "start"]