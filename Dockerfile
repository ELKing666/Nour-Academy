FROM node:22-slim

WORKDIR /app

RUN npm install -g pnpm

COPY . .

RUN pnpm install --no-frozen-lockfile

ARG BASE_PATH=/
ENV BASE_PATH=$BASE_PATH

RUN BASE_PATH=/ pnpm --filter @workspace/nour-academy build

RUN pnpm --filter @workspace/api-server build

CMD ["pnpm", "--filter", "@workspace/api-server", "start"]
