FROM node
WORKDIR ./
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000

COPY package*.json ./

ENTRYPOINT npm start
