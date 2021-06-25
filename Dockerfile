# Base image as alpine
FROM alpine:3.11.11 AS builder
RUN apk add git
# wordir

WORKDIR /app
# clone the repo
RUN git clone https://github.com/monobasic/Angular-Reactive-Demo-Shop.git

# installing node and npm
RUN apk add --update nodejs
RUN apk add --update npm
RUN apk add --no-cache python3

# FROM builder AS build1
RUN npm install -g @angular/cli
WORKDIR /app/Angular-Reactive-Demo-Shop
# COPY node_modules /app/Angular-Reactive-Demo-Shop
RUN ls
RUN npm install
RUN npm install grpc --verbose
RUN npm install @angular/cli
RUN npm install firebase@7.24.0 angularfire2 --save
RUN npm install --save-dev @angular-devkit/build-angular
RUN npm install @angular/cli

ENTRYPOINT ng serve
