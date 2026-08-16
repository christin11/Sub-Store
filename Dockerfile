# Builder
FROM node:22-bullseye-slim AS builder
WORKDIR /app
RUN npm install -g pnpm
COPY . .
WORKDIR /app/backend
RUN pnpm install --frozen-lockfile
RUN pnpm build

# Runner
FROM node:22-bullseye-slim AS runner
WORKDIR /app/backend

# 复制构建产物与运行时依赖
COPY --from=builder /app/backend ./

# 添加入口脚本
COPY docker-entrypoint.sh /app/backend/docker-entrypoint.sh
RUN chmod +x /app/backend/docker-entrypoint.sh

ENV NODE_ENV=production
EXPOSE 3000
ENTRYPOINT ["./docker-entrypoint.sh"]
