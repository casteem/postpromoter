
FROM keymetrics/pm2:8

COPY package.json package.json.lock /var/app/
COPY pm2.json /var/app/


# RUN apk add --no-cache git nano

ENV NPM_CONFIG_LOGLEVEL warn
RUN npm config set unsafe-perm true

# Install app dependencies
RUN npm install --production

COPY . /var/app

# Show current folder structure in logs
RUN ls -al -R

CMD [ "pm2-runtime", "start", "pm2.json" ]
