FROM node:alpine as builder

WORKDIR "/app"

COPY package.json .

RUN npm install 

COPY . .   

RUN npm run build

FROM nginx
# expose is for ebs to map port for incoming traffic
EXPOSE 80

COPY --from=builder /app/build /usr/share/nginx/html

