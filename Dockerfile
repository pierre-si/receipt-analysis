FROM python:3.7

# WORKDIR /app
WORKDIR /

# copy the requirements.txt file into our image.
COPY requirements.txt requirements.txt

# git and gcc are included in the default python image.
# RUN apt-get update \
#  && apt-get install -y --no-install-recommends git gcc \
#  && apt-get purge -y --auto-remove \
#  && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -r requirements.txt
# takes all the files located in the app directory and copies them into the image
COPY app/ app/

EXPOSE 80

CMD ["sh", "-c", "streamlit run --browser.serverAddress 0.0.0.0 --server.enableCORS False --server.port 80 /app/streamlit_app.py" ]

