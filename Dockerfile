# Alap kép
FROM python:3.8-slim

# Munkakönyvtár beállítása
WORKDIR /usr/src/app

# Függőségek telepítése
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Chrome telepítése
RUN apt-get update && apt-get install -y wget gnupg2 \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list \
    && apt-get update \
    && apt-get install -y google-chrome-stable

# ChromeDriver telepítése
RUN CHROME_DRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE` && \
    wget -N http://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip -P /usr/src/app && \
    unzip /usr/src/app/chromedriver_linux64.zip -d /usr/src/app && \
    rm /usr/src/app/chromedriver_linux64.zip && \
    ln -s /usr/src/app/chromedriver /usr/bin/chromedriver

# Teljes projekt másolása a képbe
COPY . .

# Tesztek futtatása
CMD ["robot", "--outputdir", "output", "tests"]
