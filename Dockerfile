FROM node:alpine3.22

WORKDIR /tmp

COPY package*.json ./
RUN npm install --only=production

COPY . .

EXPOSE 3000

RUN apk add --no-cache openssl curl gcompat bash

CMD ["node", "index.js"]
