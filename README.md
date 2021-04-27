# postgis/postgis + Uber H3

Based on [postgis/postgis](https://github.com/postgis/docker-postgis). Only adds necessary packages to pull, compile and install [h3 bindings](https://github.com/bytesandbrains/h3-pg).

For more detailed instructions about how to start and control your Postgres container, see the documentation for the `postgres` image [here](https://registry.hub.docker.com/_/postgres/).

To build: `docker build -t postgres-h3:version .` on the desired version folder.

To run: `docker run --name postgres-h3 -p 5432:5432 -v postgres-h3-volume:/var/lib/postgresql/data -v /path/to/config:/etc/postgresql -e POSTGRES_PASSWORD=password postgres-h3:version -c'config_file=/etc/postgresql/postgres.conf'`

Example docker run:
docker run\
    --name postgres-h3-test\
    -p 54322:5432\
    -v dwh_backup:/var/lib/postgresql/data\
    -v /root/docker-postgis-h3/11-3.0/config:/etc/postgresql\
    --shm-size=1g\
    -e POSTGRES_PASSWORD=mysecretpassword\
    postgres-h3:11\
    -c 'config_file=/etc/postgresql/postgres.conf'
