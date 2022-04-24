FROM node:16-alpine as builder
WORKDIR '/usr/src/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
#RUN ls -la $WORKDIR
COPY .next/server/pages /usr/share/nginx/html
#CMD ["npm","start"]
