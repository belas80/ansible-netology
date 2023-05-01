FROM ubuntu:22.10

RUN apt update -y && apt install python3 python3-pip -y
COPY requirements.txt /app/requirements.txt
RUN pip3 install -r /app/requirements.txt

COPY app.py /app/app.py
EXPOSE 5290
CMD ["python3", "/app/app.py"]