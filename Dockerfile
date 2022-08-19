FROM node:16.7.0-alpine as build
WORKDIR /app
COPY package.json .

ARG NODE_ENV
RUN if [ "$NODE_ENV" = "development" ]; \
        then npm install; \
        else npm install --only=production; \
        fi
RUN rm -rf node_modules

###################################################
FROM node:16.7.0-alpine
COPY --from=build /app /app
WORKDIR /app
EXPOSE 3000
CMD ["npm", "start"]