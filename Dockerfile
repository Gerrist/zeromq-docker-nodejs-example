FROM node:14.17-buster-slim

WORKDIR /app

# Install dependencies
COPY package*.json ./
COPY tsconfig.json ./
RUN apt-get update && apt-get install -y curl cmake python3 pkg-config build-essential libzmq3-dev
RUN npm install
RUN npm install -g typescript

# Copy application code
COPY src/ ./src/
RUN tsc
COPY dist/ ./dist/

EXPOSE 3000

CMD ["node", "dist/index.js"]