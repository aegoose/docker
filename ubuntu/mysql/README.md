# MySQL Dockerfile

Sources from https://github.com/frodenas/docker-mysql

# MySQL version
```
$ docker build -t aegoose/mysql .
```

# Run the image
```
$ docker run -d --name mysql -p 3306:3306 frodenas/mysql
```

```
$ docker run -d \
    --name mysql \
    -p 3306:3306 \
    -e MYSQL_USERNAME=myusername \
    -e MYSQL_PASSWORD=mypassword \
    aegoose/mysql
```

```
$ docker run -d \
    --name mysql \
    -p 3306:3306 \
    -e MYSQL_USERNAME=myusername \
    -e MYSQL_PASSWORD=mypassword \
    -e MYSQL_DBNAME=mydb \
    frodenas/mysql
```


```
$ mkdir -p /tmp/mysql
$ docker run -d \
    --name mysql \
    -p 3306:3306 \
    -v /tmp/mysql:/data \
    aegoose/mysql
```

