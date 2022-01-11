FROM node:9

WORKDIR /app

RUN npm install -g contentful-cli

COPY package.json .
RUN npm install

COPY . .

USER node
EXPOSE 3000

RUN sudo chown -R $USER:$(id -gn $USER) /.config

CMD ["npm", "run", "start:dev"]