# Define variables
IMAGE_NAME = renoncule_pg_image
CONTAINER_NAME = renoncule_pg_container
VOLUME_NAME = renoncule_pg_data
DOCKERFILE = postgres.Dockerfile

# Targets
.PHONY: build rebuild purge start restart stop create_volume

# Build the PostgreSQL Docker image
build:
	docker build -f $(DOCKERFILE) -t $(IMAGE_NAME) .

# Rebuild the PostgreSQL Docker image
rebuild: purge build

# Purge all related data, images, and containers
purge:
	@echo "Stopping and removing container..."
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true
	@echo "Removing image..."
	docker rmi $(IMAGE_NAME) || true
	@echo "Removing volume..."
	docker volume rm $(VOLUME_NAME) || true

# Create the PostgreSQL Docker volume
create_volume:
	docker volume create $(VOLUME_NAME)

# Start the PostgreSQL container
start: build create_volume
	docker run -d --name $(CONTAINER_NAME) \
		-v $(VOLUME_NAME):/var/lib/postgresql/data \
		-p 5432:5432 \
		$(IMAGE_NAME)

# Rebuild and start the PostgreSQL container
restart: rebuild create_volume
	docker run -d --name $(CONTAINER_NAME) \
		-v $(VOLUME_NAME):/var/lib/postgresql/data \
		-p 5432:5432 \
		$(IMAGE_NAME)

# Stop the PostgreSQL container
stop:
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true
