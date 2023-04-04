# Használja a selenium/standalone-chrome képet mint alap
FROM python:3.8-slim-buster

# Állítson be egy munkakönyvtárat a konténerben
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

# Frissítsük a package manager cache-ét újra, majd telepítsük a Google Chrome-ot
RUN apt-get update && \
    apt-get install -y google-chrome-stable

# Adjuk hozzá a Firefox repository-ját a package manager-hez
RUN echo "deb http://deb.debian.org/debian/ sid main" >> /etc/apt/sources.list.d/firefox.list

# Frissítsük a package manager cache-ét újra, majd telepítsük a Firefox-ot
RUN apt-get update && \
    apt-get install -y firefox

# Adjuk hozzá az Edge repository-ját a package manager-hez
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" >> /etc/apt/sources.list.d/microsoft-edge-dev.list

# Frissítsük a package manager cache-ét újra, majd telepítsük az Edge-et
RUN apt-get update && \
    apt-get install -y microsoft-edge-dev

# Másolja a projekt forráskódját a konténerbe
COPY . .

# Futtassa a teszteket shellben
CMD ["sh", "-c", "python3 -m robot -d results v- BRWOSER:$BROWSER -V ./resources/common_variables.py tests"]

