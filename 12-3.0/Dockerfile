FROM postgres:12

LABEL maintainer="PostGIS Project - https://postgis.net"

ENV POSTGIS_MAJOR 3
ENV POSTGIS_VERSION 3.0.1+dfsg-2.pgdg100+1

RUN apt-get update \
      && apt-cache showpkg postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR \
      && apt-get install -y --no-install-recommends \
           postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR=$POSTGIS_VERSION \
           postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR-scripts=$POSTGIS_VERSION \
      && rm -rf /var/lib/apt/lists/*

# H3 stuff 
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        cmake \
        gcc \
        git \
        make \
        pgxnclient \
        postgresql-server-dev-all \
    && pgxn install h3 \
    && apt-get remove -y \
        cmake \
        gcc \
        git \
        make \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


RUN mkdir -p /docker-entrypoint-initdb.d
COPY ./initdb-postgis.sh /docker-entrypoint-initdb.d/10_postgis.sh
COPY ./initdb-h3.sh /docker-entrypoint-initdb.d/11_h3.sh
COPY ./update-postgis.sh /usr/local/bin
