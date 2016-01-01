#FROM node:argon
#RUN mkdir -p /usr/src/app
#WORKDIR /usr/src/app
#COPY package.json /usr/src/app/
#RUN npm install
#COPY . /usr/src/app
#EXPOSE 8080
#CMD [ "npm", "start" ]

FROM mhart/alpine-node:base

RUN mkdir /project
WORKDIR /project

COPY . /project

ENTRYPOINT ["node", "server.js"]
