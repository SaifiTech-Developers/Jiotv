# Use a lightweight PHP image with Apache
FROM php:8.1-apache

# Set the working directory in the container
WORKDIR /var/www/html

# Copy all files and folders from the current directory on the host to the container
COPY . /var/www/html

# Set the ServerName to suppress the warning message
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Change Apache's default listening port to 8000
RUN sed -i 's/80/8000/g' /etc/apache2/ports.conf /etc/apache2/sites-available/000-default.conf

# Set ownership and permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Enable Apache modules (if needed)
RUN a2enmod rewrite

# Expose port 8000
EXPOSE 8000

# Start Apache server
CMD ["apache2-foreground"]
