docker stop postgres-h3
docker volume create --name postgres-h3-v2-data
docker run --rm -it -v ccf4ca0e45f5632af701e49a4098ef847dfdea94497db742bda207fa2ce5bd46:/from -v postgres-h3-v2-data:/to alpine ash -c "cd from ; cp -av . /to"
# docker start postgres-h3

docker run\
    --name postgres-h3-v2\
    -p 54321:5432\
    -v postgres-h3-v2-data:/var/lib/postgresql/data\
    -v /root/docker-postgis-h3/11-3.0/config:/etc/postgresql\
    --shm-size=1g\
    -e POSTGRES_PASSWORD=mysecretpassword\
    postgres-h3:11\
    -c 'config_file=/etc/postgresql/postgres.conf'

