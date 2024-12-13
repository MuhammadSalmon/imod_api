FROM python:3.11

ENV PYTHONUNBUFFERED=1   

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["gunicorn", "imod_api.wsgi:application", "--bind", "0.0.0.0:8000"]
