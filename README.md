# inception

project of 42 school where it is necessary to create LEMP via docker-compose on localhost.

the linked docker network consists of several services like nginx with TLSv1.3 protocol, wordpress + php-fpm and mariaDB.

each service runs in a separate container with a custom dockerfile.

also services have volumes on the server for data safety.

![](inception.png)

## before using

  before launching you need to:
  
  1. install [`docker`](https://docs.docker.com/engine/install/ubuntu/) and [`docker-compose`](https://docs.docker.com/compose/install/) from the official sites and if errors      ocurred you can run folowing commands to change rights of docker sockets:

  ```
  $ sudo chmod 666 /var/run/docker.sock
  ```

  or/and run *docker* in daemon mode

  ```
  $ sudo service docker start
  $ sudo systemctl start docker
  ```
   
  2. set *environment variable* in the `.env` file, such as hostname, password and username for mysql database and other functional parts.

## to launch the project:

  ```
  make
  ```

## to enter any \<container\>:

  ```
  docker exec -it <container> bash
  ```

## to stop *containers*:

  ```
  make stop
  ```
  
## to up *containers*:

  ```
  make up
  ```

## to down *containers* (stop and delete):

  ```
  make down
  ```
  
## to down and immediately up *containers*:

  ```
  make re
  ```
  
## to stop and delete all traces of the project, including *containers*, *images* and *volumes*:

  ```
  make fclean
  ```
  
## to down and immediately up all (long time):

  ```
  make full-fclean
  ```
  
## to get info about current state of *container*, *images*, *volumes* and *networks*:

  ```
  make info
  ```
  
  or type folowing to get separate information of members_of_the_cluster or all on this Linux:
  
  ```
  make ps # containers in the cluster
  make docps # all containers
  make images # images in the cluster
  make docimages # all images
  make netls # networks in the cluster
  make volls # volumes in the cluster
  make volins # configurations of volumes
  ```
