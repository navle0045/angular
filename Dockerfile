#stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prods


#stage2
FROM nginx:alpine
COPY --from=node /app/dist/my-project /usr/share/nginx/html 