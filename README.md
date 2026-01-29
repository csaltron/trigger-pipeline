# Trigger Pipeline

Script automatizado para activar pipelines de CI/CD en múltiples repositorios mediante la creación de ramas y commits automáticos.

## Descripción

Este script bash permite activar pipelines de CI/CD en varios repositorios de forma automatizada. Para cada repositorio configurado, el script:

1. Actualiza la rama `master` con los últimos cambios
2. Crea una nueva rama con un nombre único basado en la fecha/hora
3. Modifica el archivo `.pipeline-trigger` para activar el pipeline
4. Realiza commit y push de los cambios

## Requisitos

- `bash` (versión 4.0 o superior)
- `git` instalado y configurado
- Acceso a los repositorios listados en el script
- Los repositorios deben estar clonados localmente en el mismo directorio donde se ejecuta el script

## Configuración

1. Edita el archivo `trigger-pipelines.sh` y modifica el array `REPOS` con los nombres de tus repositorios:

```bash
REPOS=("repo1" "repo2" "repo3")
```

2. Asegúrate de que los repositorios estén clonados en el mismo directorio donde se encuentra el script.

## Uso

1. Otorga permisos de ejecución al script:

```bash
chmod +x trigger-pipelines.sh
```

2. Ejecuta el script:

```bash
./trigger-pipelines.sh
```

## Funcionamiento

El script realiza las siguientes operaciones para cada repositorio:

- **Checkout y actualización**: Cambia a la rama `master` y actualiza con `git pull`
- **Creación de rama**: Crea una nueva rama con el formato `auto-trigger-devSecOps-YYYYMMDDHHMMSS`
- **Modificación del trigger**: Agrega un comentario con la fecha al archivo `.pipeline-trigger`
- **Commit y push**: Realiza commit con el mensaje `chore: trigger weekly pipeline [skip ci]` y hace push de la rama

## Notas

- El mensaje de commit incluye `[skip ci]` para evitar bucles infinitos de pipelines
- El script asume que los repositorios están en el mismo directorio padre
- Cada ejecución crea una nueva rama con un timestamp único
- El archivo `.pipeline-trigger` debe existir en cada repositorio o el script lo creará

## Ejemplo de salida

```
Inicio de trigger pipeline
Creando pipeline para repo repo1
Pipeline Ok
Creando pipeline para repo repo2
Pipeline Ok
Creando pipeline para repo repo3
Pipeline Ok
Fin de trigger pipeline
```

## Licencia

Este proyecto es de uso interno.

