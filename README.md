*This project has been created as part of the 42 curriculum by sconiat*

# INCEPTION
## DESCRIPTION

Docker is an open platform used for developing, shipping and running applications. As a virtual machine, Docker enables you to :
- Separate your applications from your infrastructure in a isolated environment called a container
- Run many containers simutaneously on a given host
- Not rely on what is installed on the host

The container becomes the unit for distributing andn testing your application as everyone you share it with gets the same container that works in the same way.

### Docker objects :
- Images
An image is a read-only template with instructions for creating a Docker container. It is often based on another image with some additionnal customization.
To build your own image, you create a Dockerfile with a simple syntax for defining the steps needed to create the image and run it.
Each instruction in a Dockerfile creates a layer in the image, and when you change the Dockerfile and rebuild the image, only those layers which have changed are rebuilt
Base image vs child image : no parent image, usualy with an OS vs image that build on base images and add functionalities
- Containers
A container is a runnable instance of an image. You can manage it using Docker CLI, connect it to networks, attach storage to it, or even create a new image based on its current state. When a container is removed, any changes to its state that aren't stored in persistent storage disappear.

Other Docker terminology :
- Docker Daemon : The background service running on the host that manages building, running and distributing Docker containers. The daemon is the process that runs in the operating system which clients talk to.
- Docker Client - The command line tool that allows the user to interact with the daemon. More generally, there can be other forms of clients too - such as Kitematic which provide a GUI to the users.
- Docker Hub - A registry of Docker images. You can think of the registry as a directory of all available Docker images. If required, one can host their own Docker registries and can use them for pulling images.

### Virtual Machines vs Docker :
A container virtualizes the kernel, not the whole machine. So it runs on the same kernel as the host OS, while the VM has its own kernel
With a VM, every piece of hardware is virtualized

Bare metal : laptop, raspberry pi, ...
	notre application parle au kernel, qui a directement accès aux ressources matérielles (mémoire, cpu, ram, disque dur, carte réseau)
	app -> os -> ressources

VM : Fonctionne grâce à un hyperviseur (programme qui va faire semblant qu'on est dans une machine physique)
	notre app parle à l'hyperviseur
	Virtual Box etc : hyperviseur de type 2 -> bcp de perte de performances
	type 1 : app -> os de la vm -> hyperviseur (au même niveau que ton os) -> ressources
	type 2 : app -> os de la vm -> hyperviseur (= application sur ton os) -> os -> ressources

micro vm (Firecracker): pas de bios, pas de driver pour périphériques, pas de gpu, cartes réseaux, ..., pas de SystemD et de boot de tous les programmes -> on envele tout ce qui ne sert pas à notre application
	ultra léger, mais aussi isolé qu'une vm
	conteneur dans micro vm pour le meilleur compromis sécurité et performance

Conteneur : fonctionnalité du kernel linux (cgroups = Control Groups) qui permet de démarer une application sans qu'elle puisse voir autre chose que ce qu'il y a dans le cgroup
	Elle parle donc directement au kernel : app (isolée) -> kernel -> ressources
	C'est donc la même version du kernel
	App container (docker, kubernetes, ...) : Seule l'app et ce dont elle a besoin tourne sur le conteneur
	System container (LXC): Application et OS à l'interieur du conteneur

### Secrets vs Environment Variables :
Environment variables are the key-value pairs used to configure applications.
Use them instead of hard-coding the values in the code to keep the configuration clean and reusable.
You can set variables inline in the docker-compose.yml file using the environment attribute.
Simple methode, but it can expose sensitive data. Using a .env file is the best practice.
Docker Compose automatically loads .env from the same directory.
Or use attribute env_file to explicitly tell Docker Compose to use a specific .env file.

Environment variables are available at container runtime, if you want to access them at buildtime, use ARG in Dockerfile and args attribute in docker-compose.yml.

A secret is sensitive data (passwords, keys, tokens) that must be protected from unauthorized access.

Environment variables are often available to all processes inside a container, and can be visible in logs/debugging or using docker inspect, and it can be difficult to track access.
Docker Compose provides a way to set secrets without having to store them in environment variables.

### Docker Network vs Host Network :
Containers are isolated by default. Docker offers multiple ways to configure a network.
Bridge is the default network, Host give better performances.

A Docker bridge network has an IPv4 subnet
By default containers join the default bridge : docker0. Each container receive a private IP adress which allow them to talk to other containers on the same switch using service names.
It is strongly recommanded to use custom bridges to provide better isolation and easy configuration. 
Linked containers on the default bridge share environment variables

The host network allow you to suppress the isolation between the host and a container.
For example if you run a container which binds to port 80 and you use host networking, the container's application is available on port 80 on the host's ip address.
It can be useful to optimize performance, or in situations where a container needs to handle a large range of ports, but not for Inception.

### Docker Volumes vs Bind Mounts :
Both are used to store persistent data in a Docker architecture.
In both cases it is possible to mount a same volume into several containers, allowing them to share a space.

Contrary to the bind mount, if an empty volume is mounted on a container where the destination isn't empty, the files will be copied into the host volume before starting the container.
Docker volumes are entirely managed by the docker API.


### Services :
Each service is in a separate container.
We have :
- MariaDb : one of the most popular open source relational database, made by the original developers of MySQL
Relational databases : ACID (atomicity, consistency, isolation, durability)
SQL (structured query language) is based on the relational model, a mathematical model. It uses tables to represent data. 
EX : 
users
id (primary key) | blabla | task (foreign key)
0								5
1							{6, 9}
2
task
id | user_id
5		0
6		1
9		1
Constraint : we cannot enter a user_id that doesn't exist in the user table
Join : lier primary key and foreign key
SELECT *
FROM task
WHERE category = 'work';
-> renvoie toute les taches ayant "work" en colonne "category"
UPDATE task
SET text = "Learn SQL"
WHERE id = 7;
-> for task 7, update colon text

CREATE TABLE categories(
	iv SERIAL PRIMARY KEY, // 1ere colone : int
	name VARCHAR(100) NOT NULL // 2e colone : nom non vide
) ENGINE = MyRocks;
-> table optimized for write-heavy usage
There is a lot of usage for a database, and search algorithms are adapted to them (write-heavy/read-heavy, scalable, analytical/transactional, ...)
MariaDB is more interesting than most databases because it proposes a general purpose database (one layer of SQL) and multiple purpose-built storage engines
ex : InnoDB (mixed), MyRocks (write-heavy), Spider (scalable), ColumnStore (analytical), Aria (read-heavy)
with mariadb, it is possible to do cross engine joins

- Wordpress : an open source content management platform used for creating websites, blog sites and apps using PHP and MySQL
- NGINX : an HTTP web server, reverse proxy, content cache, load balancer, TCP/UDP proxy server, and mail proxy server



### Docker compose
Similarly to a makefile, it is the file thas lauch the 3 containers and connect them.


## INSTRUCTIONS


## RESOURCES
- Docker documentation : https://docs.docker.com
- https://docker-curriculum.com/
- Mariadb documentation : https://mariadb.com/docs/
- NGINX documentation : https://nginx.org/en/docs/
- Cocadmin tutorials on docker : https://youtube.com/playlist?list=PL8SZiccjllt1jz9DsD4MPYbbiGOR_FYHu&si=iJ8u-v3EGz3BohMr
- Docker tutorial : https://youtube.com/playlist?list=PL4cUxeGkcC9hxjeEtdHFNYMtCpjNBm3h7&si=yv3npuXCnlkEsObe
- Article on environment variables : https://medium.com/@kilamaelie beginners-guide-to-environment-variables-with-docker-f716f65af5ec
- About networks : https://blog.stephane-robert.info/docs/conteneurs/moteurs-conteneurs/docker/network/#vue-densemble-des-types-de-r%C3%A9seaux
- Docker Hub for the documentation on the official images
- Difference between ENTRYPOINT and CMD : https://stackoverflow.com/questions/21553353/what-is-the-difference-between-cmd-and-entrypoint-in-a-dockerfile
- About Docker compose Makefile : https://medium.com/freestoneinfotech/simplifying-docker-compose-operations-using-makefile-26d451456d63

