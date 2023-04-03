# Alapként a hivatalos Python képet használjuk
FROM python:3.8-slim

# Függőségek telepítése
RUN apt-get update && apt-get install -y wget gnupg2 unzip curl && \
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && \
    apt-get install -y google-chrome-stable && \
    rm -rf /var/lib/apt/lists/*

# ChromeDriver telepítése
RUN CHROME_DRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE` && \
    wget -N http://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip -P /usr/src/app && \
    unzip /usr/src/app/chromedriver_linux64.zip -d /usr/src/app && \
    rm /usr/src/app/chromedriver_linux64.zip && \
    ln -s /usr/src/app/chromedriver /usr/bin/chromedriver

# Munkakönyvtár beállítása
WORKDIR /usr/src/app

# Függőségek telepítése
COPY requirements.txt .
RUN pip install -v --no-cache-dir -r requirements.txt

# Teljes projekt másolása a képbe
COPY . .

# Parancs a Robot Framework tesztek futtatásához
CMD ["robot", "-d", "output", "tests"]
