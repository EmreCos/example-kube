FROM node:18-slim

ENV HOME=/home/app

# apt-get benötigt -y, sonst bricht der Build ab
RUN apt-get update && apt-get install -y htop

COPY package.json package-lock.json $HOME/node_docker/

WORKDIR $HOME/node_docker

RUN npm install --silent --progress=false

COPY . $HOME/node_docker

CMD ["npm", "start"]
