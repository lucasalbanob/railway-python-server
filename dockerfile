# Use uma imagem base do Python
FROM python:3.10-slim

# Instale dependências necessárias
RUN apt-get update && \
    apt-get install -y wget gnupg unzip && \
    apt-get install -y libnss3 libgconf-2-4 libxi6 libxrandr2 libatk1.0-0 libatk-bridge2.0-0 libcups2 libxkbcommon0 libxcomposite1 libxdamage1 libxshmfence1 libgbm1 libasound2 libwayland-client0 libgtk-3-0

# Adicione a chave e o repositório do Google Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

# Instale o Google Chrome
RUN apt-get update && apt-get install -y google-chrome-stable

# Baixe e instale o ChromeDriver
RUN CHROME_DRIVER_VERSION=$(curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE) && \
    wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip && \
    unzip /tmp/chromedriver.zip -d /usr/local/bin/ && \
    rm /tmp/chromedriver.zip

# Instale o Selenium
RUN pip install selenium

# Defina variáveis de ambiente
ENV DISPLAY=:99
