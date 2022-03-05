FROM node:alpine as builder

WORKDIR /var/opt/rapp

COPY ./package.json .

RUN npm config set strict-ssl false
RUN npm install

COPY . .

RUN npm run build

FROM nginx
COPY --from=builder /var/opt/rapp/build /usr/share/nginx/html