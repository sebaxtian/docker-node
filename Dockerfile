# 
# FROM node:lts-alpine
# 
# https://hub.docker.com/_/node
# 
# Configuración de Docker para contener aplicaciones que se ejecutan con Node
#
FROM node:lts-alpine

# Argumentos por defecto para hacer build
ARG DIR_APP=example-app
ARG NODE_ENV=production
ARG PORT_APP=3000

# Create src directory
RUN mkdir -p /home/node/src
WORKDIR /home/node/src

# Install src dependencies
COPY src/$DIR_APP/package.json /home/node/src/
# [--production] for production
RUN npm install $(if [ "$NODE_ENV" = "production" ] ; then echo --$NODE_ENV ; else echo  ; fi)

# Copy the app source
COPY src/$DIR_APP /home/node/src/

# Replace this with your application's default port
EXPOSE $PORT_APP

# Run aplication [dev, prod]
CMD npm run $(if [ "$NODE_ENV" = "production" ] ; then echo start:prod ; else echo start:dev ; fi)
