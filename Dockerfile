# Kiinduló kép
FROM python:3.8-slim-buster

# Munkaknyvtár létrehozása
WORKDIR /app

# Másolja a projekt követelményeit a konténerbe
COPY requirements.txt .

# Telepítse a követelményeket
RUN pip3 install --trusted-host pypi.python.org -r requirements.txt

RUN apt-get update && \
    apt-get install -y wget gnupg curl unzip

# Adjuk hozzá a Google Chrome repository-ját a package manager-hez
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list

# Adjuk hozzá a Firefox repository-ját a package manager-hez
RUN echo "deb http://deb.debian.org/debian/ stable main" >> /etc/apt/sources.list.d/debian.list

# Frissítsük a package manager cache-ét újra, majd telepítsük a Google Chrome-ot és Firefox-ot
RUN apt-get update && \
    apt-get install -y google-chrome-stable firefox-esr

# Ellenőrizzük a Chrome és Firefox verzióit
RUN google-chrome --version && \
    firefox --version

# Másolja a projekt forráskódját a konténerbe
COPY . .

# Futtassa a teszteket shellben
ENTRYPOINT python3 -m robot -d results -v BROWSER:$BROWSER -V ./resources/common_variables.py tests
CMD []