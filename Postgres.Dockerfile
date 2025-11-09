FROM postgres:18.0

EXPOSE 5432

RUN apt-get update && apt-get install -y postgresql-18-cron
