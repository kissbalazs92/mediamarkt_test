# Használja a selenium/standalone-chrome képet mint alap
FROM python:3.8-slim-buster

# Állítson be egy munkakönyvtárat a konténerben
WORKDIR /app

# Másolja a projekt követelményeit a konténerbe
COPY requirements.txt .

# Telepítse a követelményeket
RUN pip3 install --trusted-host pypi.python.org -r requirements.txt
RUN apt-get install -y wget
RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt-get install ./google-chrome-stable_current_amd64.deb

# Másolja a projekt forráskódját a konténerbe
COPY . .

# Futtassa a teszteket
CMD ["python3", "-m", "robot", "-d", "results", "tests"]
