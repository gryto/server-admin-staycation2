FROM node:16.7.0-alpine as build

WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install --only=production
RUN rm -rf node_modules

###################################################

FROM node:16.7.0-alpine

COPY --from=build /app /app
WORKDIR /app
EXPOSE 3000
CMD ["npm", "start"]