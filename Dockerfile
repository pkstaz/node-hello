# FROM node:9

# WORKDIR /app

# RUN npm install -g contentful-cli

# COPY package.json .
# RUN npm install

# COPY . .

# USER 0
# EXPOSE 8080

# CMD ["npm", "run", "start:dev"]





FROM quay.io/centos7/nodejs-12-centos7:latest
# Add application sources to a directory that the assemble script expects them 
# and set permissions so that the container runs without root access 
USER 0 
ADD app-src /tmp/src 
RUN chown -R 1001:0 /tmp/src USER 1001 
# Install the dependencies 
RUN /usr/libexec/s2i/assemble 
# Set the default command for the resulting image 
CMD /usr/libexec/s2i/run