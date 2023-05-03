FROM node:14.17.0-alpine AS build
WORKDIR /app
COPY . .
RUN npm install && npm run build

FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html/reactapp
COPY ./.nginx/nginx.conf /etc/nginx/conf.d/default.conf
