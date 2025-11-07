# # Use official MySQL base image
# FROM mysql:8.0

# # Set default environment variables
# ENV MYSQL_ROOT_PASSWORD=MyStrongPassword123!
# ENV MYSQL_DATABASE=testdb
# ENV MYSQL_USER=contactsapp
# ENV MYSQL_PASSWORD=123

# # Optionsl: Copy initial SQL scripts (if any)
# # COPY ./init.sql /docker-entrypoint-initdb.d/
# #RUN mysql -h localhost -u root -p'MyStrongPassword123!' -e "CREATE DATABASE IF NOT EXISTS contacts_app;"


# COPY ./mysql-init/init.sql /docker-entrypoint-initdb.d/

# # Expose MySQL port
# EXPOSE 3306


# Use official MySQL base image
FROM mysql:8.0

# Copy initial SQL scripts (if any)
COPY ./mysql-init/init.sql /docker-entrypoint-initdb.d/

# Expose MySQL port
EXPOSE 3306
