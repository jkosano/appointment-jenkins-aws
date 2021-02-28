FROM mysql
# ENV MYSQL_ROOT_PASSWORD MYSQL_ROOT_PASSWORD
ENV MYSQL_DATABASE appointment-flask
WORKDIR '/sql'
RUN pwd
RUN ls
#create db
# RUN mkdir /usr/sql
# RUN chmod 644 /usr/sql
#COPY appointment-2.sql  ./docker-entrypoint-initdb.d
COPY ./sql/appointment-2.sql  ./docker-entrypoint-initdb.d
# ADD ["../appointment-2.sql", "/usr/sql/appointment-2.sql"]