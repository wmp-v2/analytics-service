FROM        docker.io/redhat/ubi9:latest
RUN         dnf install -y python3.12 python3.12-pip python3.12-devel gcc
WORKDIR     /app
COPY        ./ /app/
RUN         pip3.12 install --no-cache-dir .
ENTRYPOINT  [ "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--workers", "4" ]

