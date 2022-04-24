FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

RUN ls -la $WORKDIR
FROM nginx
COPY --from=builder /app/.next/ /usr/share/nginx/html
#CMD ["npm","start"]
