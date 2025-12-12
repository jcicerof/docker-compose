# https://chatgpt.com/g/g-p-690ef4916dac8191a0390fbecb0216c9-docker/c/693b74a3-8f58-8325-9e66-4826aa1d68c4

# Ultra-minimal AlmaLinux base
FROM almalinux:9-minimal

# Install PostgreSQL server and admin tools
# All comments must be in English (user preference)
RUN microdnf install -y \
        postgresql-server \
        postgresql \
        postgresql-contrib \
        postgresql-utils \
        bash \
        openssl \
        findutils \
        coreutils \
        iputils \
        procps-ng \
        tar \
        gzip \
        which \
    && microdnf clean all

# Create data directory
RUN mkdir -p /var/lib/pgsql/data && chown -R postgres:postgres /var/lib/pgsql

USER postgres

# Initialize database (only if empty)
RUN /usr/bin/initdb -D /var/lib/pgsql/data

# Expose PostgreSQL port
EXPOSE 5432

# Start PostgreSQL server
CMD ["/usr/bin/postgres", "-D", "/var/lib/pgsql/data"]

