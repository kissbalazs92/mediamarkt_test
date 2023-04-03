# Alapként a hivatalos Python képet használjuk
FROM python:3.8-slim

# Munkakönyvtár beállítása
WORKDIR /usr/src/app

# Függőségek telepítése
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Teljes projekt másolása a képbe
COPY . .

# Parancs a Robot Framework tesztek futtatásához
CMD ["robot", "-d", "output", "tests"]
