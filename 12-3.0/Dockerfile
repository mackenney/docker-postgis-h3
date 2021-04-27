FROM postgis/postgis:12-3.0

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

COPY ./initdb-h3.sh /docker-entrypoint-initdb.d/1_h3.sh
