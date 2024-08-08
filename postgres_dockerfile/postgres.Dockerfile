# Use the official PostgreSQL image from the Docker Hub
FROM postgres:16-alpine

# Set environment variables for PostgreSQL
ENV POSTGRES_DB=renonculeDB
ENV POSTGRES_USER=dev
ENV POSTGRES_PASSWORD=dev

# Expose the default PostgreSQL port
EXPOSE 5432

# Default command to run PostgreSQL
CMD ["postgres"]
