# Alapként a hivatalos Robot Framework képet használjuk
FROM robotframework/rfdocker:latest

# Munkakönyvtár beállítása
WORKDIR /usr/src/app

# Teljes projekt másolása a képbe
COPY . .

# Parancs a Robot Framework tesztek futtatásához
CMD ["robotframework", "-d", "output", "tests"]
