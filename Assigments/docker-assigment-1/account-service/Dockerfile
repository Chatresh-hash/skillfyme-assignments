FROM node:20-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install --production

COPY . .

RUN ls -la /app

EXPOSE 3000


CMD ["node","app.js","npm","start"]