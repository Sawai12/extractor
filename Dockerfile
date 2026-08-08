```dockerfile
FROM python:3.12.6

WORKDIR /app

COPY . .

RUN apt-get update && \
    apt-get install -y wget nodejs npm && \
    rm -rf /var/lib/apt/lists/*

RUN node appx_server.js > server.txt && \
    node aes.js > aesserver.txt && \
    node cipher.js > cipher.txt && \
    node youtube.js > yt.txt

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir \
    pyrofork \
    tgcrypto==1.2.5 \
    requests \
    aiohttp \
    aiofiles \
    certifi \
    pycryptodomex \
    bs4 \
    PyJWT \
    cloudscraper \
    pymongo \
    pytz \
    motor \
    emoji \
    aiocron

CMD ["python", "./main.py"]
```
