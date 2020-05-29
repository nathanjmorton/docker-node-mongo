
FROM node:12
# move node_modules up in the app's directory to hide from the host mapping (to avoid conflicts with binaries of desktop versus container image) and install
WORKDIR /opt/node_app
COPY ./package*.json ./
RUN npm i --no-optional && npm cache clean --force
# put the node modules' binaries on the PATH
ENV PATH /opt/node_app/node_modules/.bin:$PATH
# set the app directory
WORKDIR /opt/node_app/app
COPY ./ ./ 
# ENV PORT=8080
# EXPOSE 8080
CMD npm start
