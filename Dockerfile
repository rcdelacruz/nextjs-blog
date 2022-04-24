# FROM node:16-alpine as builder
# WORKDIR '/app'
# COPY package.json .
# RUN npm install
# COPY . .
# RUN npm run build && npm start &

# #FROM nginx
# #COPY --from=builder /app/.next/server/pages /usr/share/nginx/html
# #CMD ["npm","start"]
FROM node:12.18.3-alpine

ARG NODE_ENV="production"
ENV NODE_ENV=${NODE_ENV}

WORKDIR '/app'
COPY package.json .
RUN npm install
# This docker file will copy code from app directory
# including the node_modules and .next folder.
COPY . .
RUN npm run build
COPY . .

EXPOSE 3000
# This run the server at default port 3000
CMD ["npm", "run", "start"]
