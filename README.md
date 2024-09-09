# Terraform-Azure-AWS

Repositorio para hacer experimentos, praticas y casos reales con [Terraform][1] en [Azure][4] y [AWS][2].

Este repositorio ha sido creado como un recurso para prácticas y casos reales de **Infraestructura como Código** que he implementado a la hora de aprender y a lo largo de mi experiencia laboral.


## ¿Qué es Terraform?

[Terraform][1] es una herramienta de [infraestructura como código][4] (_Infraestructure as Code, IaC_) que permite crear, modificar y eliminar infraestructura de forma automática. 

[Terraform][1] puede gestionar los recursos de diferentes proveedores de servicios en la nube. 


## Instalación de Terraform

Para realizar la instalación de Terraform se recomienda seguir los pasos de la [documentación oficial](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli). 


## Instalación de Visual Code 

Para poder trabajar con terraform se recomienda un editor de codigo fuente. En este caso vamos a trabajar con visual code ya que es ligero, rápido, y altamente personalizable, además de ser gratuito y de código abierto. Está diseñado para escribir, depurar y ejecutar código en una amplia variedad de lenguajes de programación y plataformas.

Para su instalacion podemos descargarlo desde la [web de visual code][5], seleccionamos sistema operativo e instalamos. 


## Instalación del _plugin_ de Terraform para Visual Studio Code

Se recomienda la instalación del _plugin_ de Terraform para Visual Studio Code. 

El _plugin_ se llama **HashiCorp Terraform** y ha sido desarrollado por la empresa HashiCorp.


## Comandos básicos

### Inicializar el directorio de trabajo

En primer lugar hay que descargar los plugins necesarios del proveedor que se especifica en el archivo de configuración.

```
terraform init
```

### Formatear y validar el archivo de configuración

Terraform nos proporciona un comando para formatear el archivo de configuración para que sea más legible. Algunas de las tareas que realiza este comando son, ajustar la indentación, ordenar los argumentos de los bloques de configuración, etc.

```
terraform fmt
```

Para validar la sintaxis del archivo de configuración podemos utilizar el siguiente comando.

```
terraform validate
```

### Mostrar los cambios que se van a realizar

Compara la configuración del archivo de Terraform con la que existe actualmente en el proveedor de infraestructura y muestra las acciones que se tienen que realizar para conseguir la configuración deseada. Permite al usuario verificar los cambios antes de aplicarlos en el proveedor.

```
terraform plan
```

### Aplicar los cambios

Crea los recursos del archivo de configuración en su cuenta de AWS.

```
terraform apply
```

Si queremos crear los recursos sin tener que escribir `yes` para confirmar la ejecución del comando, podemos utilizar la opción `-auto-approve`.

```
terraform apply -auto-approve
```

### Mostrar el estado actual de los recursos

Muestra los recursos creados en el proveedor y su estado actual.

``` 
terraform show
```

### Eliminar los recursos

Elimina los recursos indicados en el proveedor.

``` 
terraform destroy
```

## Practicas, ejemplos y caso reales.

- [Ejemplo 1](terraform-project-01). Proyecto Instalacion Nginx.
- [Ejemplo 2](terraform-project-02). 
- [Ejemplo 3](terraform-project-03). 


[1]: https://www.terraform.io
[2]: https://aws.amazon.com/es/
[3]: https://es.wikipedia.org/wiki/Infraestructura_como_c%C3%B3digo
[4]: https://azure.microsoft.com/es-es/
[5]: https://code.visualstudio.com/download
