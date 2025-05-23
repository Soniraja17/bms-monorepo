FROM oven/bun:alpine

WORKDIR /User/src/app

COPY ./packages ./packages
COPY ./bun.lock ./bun.lock
COPY ./package.json ./package.json
COPY ./turbo.json ./turbo.json

COPY ./apps/websocket ./apps/websocket


COPY . .

RUN bun install
RUN bun run db:generate

 

CMD ["bun","run","start:ws"]
