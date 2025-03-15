from fastapi import FastAPI
import subprocess

app = FastAPI()

@app.get("/")
def home():
    return {"message": "Servidor Python rodando no Railway"}

@app.get("/run-python")
def run_python():
    result = subprocess.run(["python3", "-c", "print('Executando Python via API')"], capture_output=True, text=True)
    return {"output": result.stdout}
    
