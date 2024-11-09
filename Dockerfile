## build stage ##
FROM node:18.20-alpine AS build

WORKDIR /app

COPY . .
RUN npm install
RUN npm run build

## run stage ##
FROM nginx:alpine

COPY --from=build app/build/ /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]