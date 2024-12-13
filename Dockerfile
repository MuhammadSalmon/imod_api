FROM python:3.10-slim

ENV PYTHONUNBUFFERED=1   

WORKDIR /app

COPY requirements.txt ./

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "imod_api.wsgi:application"]
