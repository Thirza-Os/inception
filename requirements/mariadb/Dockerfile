# Base image: Build on debian distribution
FROM        debian:buster

#Update package manager
RUN         apt-get update -y

# Install mariaDB
RUN         apt-get install mariadb-server -y

# Modify bind address configuration (sed = stream editor)
RUN         sed 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/' -i  /etc/mysql/mariadb.conf.d/50-server.cnf

# SHOULD THIS GO TO BIN????
COPY ./tools/db_setup.sh .
RUN chmod +x ./db_setup.sh

RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:root /var/run/mysqld

EXPOSE 3306

ENTRYPOINT ["./db_setup.sh"]
CMD ["mysqld"]