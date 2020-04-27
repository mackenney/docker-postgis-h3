# postgis/postgis + Uber H3

Based on [postgis/postgis](https://github.com/postgis/docker-postgis). Only adds necessary packages to pull, compile and install [h3 bindings](https://github.com/bytesandbrains/h3-pg).

For more detailed instructions about how to start and control your Postgres container, see the documentation for the `postgres` image [here](https://registry.hub.docker.com/_/postgres/).

To build: `docker build -t postgres-h3 .` on folder `12-3.0`.

To run: `docker run --name postgres-h3 -p 5432:5432 -v postgres-h3-volume -e POSTGRES_PASSWORD=password postgres-h3`
