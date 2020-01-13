FROM nginx:1.17.7

RUN apt update && apt install nodejs npm -y

# https://github.com/nodejs/help/issues/1877
RUN npm install npm@latest -g
RUN npm install -g yarn

COPY theia /var/www/theia

WORKDIR /var/www/theia

RUN yarn && yarn theia build

COPY ./nginx  /etc/nginx
#COPY ./nginx/nginx.conf  /etc/nginx/nginx.conf
#COPY ./nginx/stream.js /etc/nginx/stream.js

ENTRYPOINT [ "yarn", "theia", "start", "/home/project", "--hostname=0.0.0.0" ]
