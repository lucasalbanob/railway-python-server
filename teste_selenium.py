from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager

# Configurar opções do Chrome
chrome_options = Options()
chrome_options.add_argument("--headless")  # Rodar em modo headless (sem UI)
chrome_options.add_argument("--no-sandbox")
chrome_options.add_argument("--disable-dev-shm-usage")

# Iniciar o driver do Chrome
service = Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=service, options=chrome_options)

# Acessar uma página de teste
driver.get("https://www.google.com")

# Capturar o título da página
print("Título da página:", driver.title)

# Fechar o navegador
driver.quit()
