#!/bin/bash

set -e  # Detiene el script si ocurre un error

# Actualizar el repositorio de paquetes
sudo apt-get update
apt-get upgrade -y

# Instalar NGINX
sudo apt-get install -y nginx

# Iniciar el servicio de NGINX
sudo systemctl start nginx

# Habilitar el servicio para que inicie automáticamente al arrancar la máquina
sudo systemctl enable nginx




