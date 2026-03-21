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
