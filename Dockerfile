FROM rust:1.81.0
RUN cargo install --locked stellar-cli --features opt
RUN apt-get update
RUN apt-get install -y python3
RUN apt-get -y install python3-pip
RUN apt-get install -y python3-venv
WORKDIR /app
RUN python3 -m venv ./opt/venv 
COPY requirements.txt .
RUN . ./opt/venv/bin/activate && pip install -r requirements.txt
COPY . .
EXPOSE 5000

CMD . ./opt/venv/bin/activate && exec python3 main.py