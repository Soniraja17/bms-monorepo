From oven/bun:alpine

WORKDIR /User/src/app

COPY ./packages ./packages
COPY ./bun.lock ./bun.lock
COPY ./package.json ./package.json
COPY ./turbo.json ./turbo.json

COPY ./app/websocket ./app/websocket


COPY . .

RUN bun install
RUN bun run db:generate

 

CMD ["bun","run","start:ws"]
