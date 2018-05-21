FROM node:8
COPY . /home/node/app
WORKDIR /home/node/app
RUN apt-get update \
    && apt-get install -y libx11-xcb1 libxcomposite1 libxcursor1 \
      libxdamage1 libxi6 libxtst6 libnss3 libcups2 libxss1 libxrandr2 libasound2 \
      libatk1.0-0 libatk-bridge2.0-0 libgtk-3-0 sendemail \
    && apt-get clean \
    && rm -rf /root/.cache \
    && rm -rf /var/lib/apt/lists/*
RUN npm install puppeteer && npm install
CMD "./run.sh"
