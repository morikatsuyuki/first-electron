FROM node:20-bullseye
WORKDIR /app

RUN apt-get update && \
    apt-get install -y \
    git \
    nano \
    libnss3 \
    libxss1 \
    libasound2 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdrm2 \
    libxcomposite1 \
    libxrandr2 \
    libgbm1 \
    libgtk-3-0 \
    libnspr4 \
    && rm -rf /var/lib/apt/lists/*

# npm init -yでpackage.jsonを作成し、
# 必要なパッケージをインストール（例：electron）
RUN npm init -y && npm install electron --save-dev 

# Dockerfile の最後に追加（例）
# root ではなく 一般ユーザーとして実行する方法
RUN useradd -m electronuser
USER electronuser

CMD ["npx", "electron", "."]

