FROM node:16.14.0

WORKDIR /app

COPY . /app

RUN npm config set registry https://registry.npmmirror.com/ && npm cache clean -f && yarn install && npm run build

EXPOSE 9000

CMD ["npm", "start"]


