# Usa uma imagem base do Alpine com Python
FROM python:3.10-alpine

# Instala dependências
RUN apk add --no-cache chromium chromium-chromedriver

# Instala Selenium
RUN pip install selenium webdriver-manager

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos do projeto
COPY . .

# Comando padrão ao iniciar o container
CMD ["python3", "test_selenium.py"]
