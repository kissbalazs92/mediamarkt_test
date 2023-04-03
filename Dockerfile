# Alapként a hivatalos Robot Framework képet használjuk
FROM robotframework/rfdocker:latest

# Munkakönyvtár beállítása
WORKDIR /opt/robotframework

COPY tests/ ./tests/

CMD ["-d", "output", "tests"]