FROM node:22-alpine

WORKDIR /app

RUN npm install -g pnpm

COPY . .

WORKDIR /app/backend

RUN pnpm install --frozen-lockfile
RUN pnpm build

EXPOSE 3000

CMD ["node", "dist/index.js"]
