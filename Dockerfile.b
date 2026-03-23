FROM python:3.12

WORKDIR /app

RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
COPY . /app

RUN pip install --upgrade pip && pip install -r requirements.txt

CMD ["python", "main.py"]

