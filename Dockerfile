# Use a lightweight PHP image with Apache
FROM php:8.1-apache

# Set the working directory in the container
WORKDIR /var/www/html

# Copy all files and folders from the current directory on the host to the container
COPY . /var/www/html

# Set the ServerName to localhost to prevent the warning message
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Ensure the Apache user owns the files and set permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Enable Apache modules (if needed)
RUN a2enmod rewrite

# Expose port 80 to allow HTTP traffic
EXPOSE 80

# Start Apache server
CMD ["apache2-foreground"]
