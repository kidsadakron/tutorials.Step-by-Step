FROM node:carbon-alpine

ARG GIT_COMMIT
ENV GIT_COMMIT ${GIT_COMMIT} \
	WEB_APP_PORT "3000" \
	DUMMY_DEVICES_PORT "3001"


# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY ./context-provider/package*.json ./

RUN npm install --production && \
    rm -rf /root/.npm/cache/*
# If you are building your code for production
# RUN npm install --only=production

# Bundle app source
COPY ./context-provider .

# Ports used by application
EXPOSE ${WEB_APP_PORT} ${DUMMY_DEVICES_PORT}

CMD ["npm", "start" ]