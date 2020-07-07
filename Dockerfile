# Base Image 

FROM node:14.4.0-alpine3.10 as builder

#Depednecies 

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build 

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html