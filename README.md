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
- Containers
A container is a runnable instance of an image. You can manage it using Docker CLI, connect it to networks, attach storage to it, or even create a new image based on its current state. When a container is removed, any changes to its state that aren't stored in persistent storage disappear.

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

Conteneur : fonctionnalité du kernel linux (cgroups) qui permet de démarer une application sans qu'elle puisse voir autre chose que ce qu'il y a dans le cgroup
	Elle parle donc directement au kernel : app (isolée) -> kernel -> ressources
	C'est donc la même version du kernel
	App container (docker, kubernetes, ...) : Seule l'app et ce dont elle a besoin tourne sur le conteneur
	System container (LXC): Application et OS à l'interieur du conteneur

### Secrets vs Environment Variables :

### Docker Network vs Host Network :

### Docker Volumes vs Bind Mounts :

### Services :
Each service is in a separate container.
We have :
- MariaDb, for the database
- Wordpress,
- NGINX, a services that get HTTP requests, and work with wordpress to send responses to the client


### Docker compose
Similarly to a makefile, it is the file thas lauch the 3 containers and connect them

## INSTRUCTIONS
## RESOURCES
-  Docker documentation : https://docs.docker.com
- 
