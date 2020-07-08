FROM python:3

ENV PYTHONUNBUFFERED 1


# create folder structure
RUN mkdir -p /data/www/


# install pg client
RUN apt-get update && apt-get install -y \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /data/www/


# copy and install requirements
COPY src/requirements.txt /data/www/
RUN pip install -r requirements.txt --upgrade


# copy herbie files
COPY src /data/www/

# setup entrypoint
RUN chmod u+x .docker/entrypoint.sh

ENTRYPOINT [".docker/entrypoint.sh"]

CMD ["gunicorn", "herbie.wsgi:application", "--bind 0.0.0.0:8000"]
