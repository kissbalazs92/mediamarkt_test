# Használja a selenium/standalone-chrome képet mint alap
FROM selenium/standalone-chrome:latest

# Állítson be egy munkakönyvtárat a konténerben
WORKDIR /app

# Telepítse a szükséges csomagokat
USER root
RUN apt-get update && \
    apt-get install -y --no-install-recommends python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

# Másolja a projekt követelményeit a konténerbe
COPY requirements.txt .

# Telepítse a követelményeket
RUN pip3 install --trusted-host pypi.python.org -r requirements.txt

# Másolja a projekt forráskódját a konténerbe
COPY . .

# Futtassa a teszteket
CMD ["python3", "-m", "robot", "-d", "results", "tests"]
