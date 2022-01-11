FROM node:12

WORKDIR /app

RUN npm install -g contentful-cli

COPY package.json .
RUN npm install

COPY . .

USER 0
EXPOSE 8080

RUN /usr/libexec/s2i/assemble 
CMD /usr/libexec/s2i/run