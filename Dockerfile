# Alapként a hivatalos Robot Framework képet használjuk
FROM robotframework/rfdocker:latest

# Munkakönyvtár beállítása
WORKDIR /usr/src/app

# Teljes projekt másolása a képbe
COPY . .

# Létrehozzuk az output könyvtárat és beállítjuk a megfelelő jogosultságokat
RUN mkdir output && chown -R $(id -u):$(id -g) output

# Parancs a Robot Framework tesztek futtatásához
CMD ["robot", "-d", "output", "tests"]
