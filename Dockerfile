FROM node:9

WORKDIR /app

RUN npm install -g contentful-cli

COPY package.json .
RUN npm install

COPY . .

USER 0
EXPOSE 8080

CMD ["npm", "run", "start:dev"]