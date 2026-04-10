MARIADB		= ./srcs/requirements/mariadb/database
WORDPRESS	= ./srcs/requirements/wordpress/database

all: up

up:
	mkdir -p $(MARIADB)
	mkdir -p $(WORDPRESS)
	docker compose up

start:

stop:

down:

build:

clean:
	docker compose down

.PHONY: up clean stop start build down
