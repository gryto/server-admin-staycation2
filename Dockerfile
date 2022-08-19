FROM node:16.7.0-alpine as builder

WORKDIR /app

COPY package.json .

RUN npm install --only=production

RUN rm -rf node_modules

#####################################

FROM node:16.7.0-alpine

WORKDIR /app

COPY --from=builder /app /app.

EXPOSE 3000

CMD ["npm", "start"]