FROM mhart/alpine-node:14@sha256:9cd7d62ecd745f058931c42d32c60edd9a8f6c8eaa0a65c1547ae2bce4859652

WORKDIR /src
COPY package*.json ./

# Install dependencies

RUN npm ci --only=production

FROM mhart/alpine-node:slim-14

ENV NODE_ENV production

WORKDIR /app

COPY --from=0 /app .
COPY . .
RUN ls -a

# start
CMD ["npm", "run", "start"]
EXPOSE 3001