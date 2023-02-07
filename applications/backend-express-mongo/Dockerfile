FROM node:14

WORKDIR /example-api
COPY package.json .
RUN npm install
COPY . .
CMD npm start
