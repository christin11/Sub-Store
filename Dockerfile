FROM node:18-alpine

WORKDIR /app

# 安装 pnpm
RUN npm install -g pnpm

# 复制文件
COPY backend ./backend

WORKDIR /app/backend

# 安装依赖
RUN pnpm install

# 构建
RUN pnpm build

# 暴露端口
EXPOSE 3000

# 启动
CMD ["node", "dist/index.js"]
