#FROM node:argon
#RUN mkdir -p /usr/src/app
#WORKDIR /usr/src/app
#COPY package.json /usr/src/app/
#RUN npm install
#COPY . /usr/src/app
#EXPOSE 8080
#CMD [ "npm", "start" ]

FROM mhart/alpine-node:4

ENV VERSION=v4.2.4 NPM_VERSION=2

RUN mkdir /project
WORKDIR /project

COPY . /project/
#COPY server.js server.js
#COPY node_modules node_modules
#COPY public public
#COPY views views

ENTRYPOINT ["node", "server.js"]
