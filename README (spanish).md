# Version en Espanol (Traduccion)

## Nota de reproduccion academica

Este repositorio se usa como una reproduccion del experimento original del articulo:
Rode, A., Carleton, T., Delgado, M. et al. *Estimating a social cost of carbon for global energy consumption*. Nature 598, 308-314 (2021). https://doi.org/10.1038/s41586-021-03883-8

Esta reproduccion se realiza en el marco de la materia **Gestion de Proyectos de Innovacion y Ciencia Abierta** de la **Universidad de los Andes**, en la **Maestria en Economia Aplicada (MEcA)**.

Busca reproducir el Step 1 y Step 2 del repositorio original. Para más 
contexto puede consultar el **README.md** original del estudio, que se encuentra en este repositorio. 

Para comprender el flujo de trabajo se construyeron tres archivos .mermaid que contienen los pasos que se siguieron en la replicación. A continuación se da una breve descripción: 
-  **Configurar_entorno.mermaid**: Contiene flujo de trabajo necesario para configurar ambiente de trabajo.
-  **Step 1**: Mapeo de un entendimiento general del proceso de generación de la base de datos maestra
-  **Step 1.1**: Se detalla cómo generear la base de datos maestra, los insumos utilizados y los outputs esperados.
-  **Step 2**: Contiene el flujo de trabajo para entender el proceso de replicación de la estimación econométrica.


## Acerca de este repositorio

Este repositorio contiene el codigo y las instrucciones para producir los resultados del articulo. 

## Requisitos para usar el codigo

1. Necesitas contar con entornos o capacidades para ejecutar `python`, `Stata` y `R`.
2. Se usa `conda` para administrar entornos de Python, por lo que se recomienda instalarlo si aun no lo has hecho.

## Configuracion

1. Clona este repositorio en un directorio de trabajo (llamado `yourREPO`):

```bash
cd C:\Users\juago\Documents\GitHub\energy-code-release-2020-GPICA
git clone https://github.com/ClimateImpactLab/energy-code-release-2020.git
```

2. Instala el entorno `conda` incluido en el repositorio:

```bash
cd C:/Users/juago/Documents/GitHub/energy-code-release-2020-GPICA


conda env create -f energy_env_py3.yaml
conda activate energy_env_py3
```

Tambien se requiere Jupyter para el calculo de SCC:

```bash
conda install -c conda-forge jupyterlab
```

3. (Opcional) Si quieres correr proyecciones de impacto por tu cuenta, clona e instala `impact-calculations`, `open-estimate` e `impact-common` dentro de `yourREPO` usando `pip install -e .` en cada repositorio, con el entorno `energy_env_py3` activado.

4. Instala los paquetes de R desde la raiz de este repo:

```bash
cd <yourREPO>/energy-code-release-2020
Rscript install_R_packages.R
```

5. Descarga los datos desde `https://doi.org/10.5281/zenodo.5099834` y descomprimelos en una ruta con mas de 50 GB de espacio (llamada `yourDATA`).

6. Define variables de entorno para que el codigo corra correctamente:

```bash
export REPO=<yourREPO>
export DATA=<yourDATA>/DATA
export OUTPUT=<yourDATA>/OUTPUT
export LOG=<yourDATA>/LOG
```

En Windows, configura estas variables desde el sistema operativo.

7. El repositorio fue probado con Stata/SE y usa `stata-se -b` en los scripts. Si usas otra version, reemplaza por `stata-mp -b` o `stata -b` segun corresponda.

8. Luego de la configuracion general, sigue los `README` de cada subdirectorio para ejecutar cada parte del analisis.

## Costo social del consumo global de energia por cambio climatico

El analisis del articulo se organiza en cinco pasos:

1. Limpieza y consolidacion de datos historicos de consumo de energia y clima, junto con covariables (poblacion e ingreso).
2. Analisis econometrico para estimar la relacion empirica energia-temperatura.
3. Uso de esa relacion para proyectar impactos futuros del cambio climatico con un conjunto de modelos climaticos.
4. Traduccion de esos impactos en funciones de dano empiricas (danos monetizados vs. calentamiento).
5. Calculo de un costo social del carbono parcial, solo para energia.

## Descripcion de carpetas

- `0_make_dataset`: construccion del dataset para estimar los modelos.
- `1_analysis`: estimacion y graficacion de modelos econometricos.
- `2_projection`: proyeccion de impactos del cambio climatico hasta 2300.
- `3_post_projection`: figuras y productos posteriores a las proyecciones.
- `4_misc`: figuras y calculos adicionales del paper.
- `projection_inputs`: insumos necesarios para correr proyecciones.

## Resumen de pasos

### Paso 1 - Construccion de base historica de energia y clima

Se integran datos de consumo final de energia (IEA), clima historico (GMFD), ingreso y poblacion. Esto incluye limpieza, armonizacion, fusion y preparacion de datos para econometria.

### Paso 2 - Analisis econometrico

Se estiman tres familias de modelos: no interactuados globales, por deciles de ingreso e interactuados con covariables de ingreso y clima. Se generan resultados intermedios (`.ster`) y figuras del paper/apendices.

### Paso 3 - Proyecciones de impactos futuros

Con los coeficientes del Paso 2 se proyectan impactos de cambio climatico sobre consumo de energia. Esta etapa es computacionalmente costosa. Se incluyen insumos para ejecutar ejemplos y salidas `.csv` necesarias para pasos posteriores.

### Paso 4 - Estimacion de funciones de dano

Con las proyecciones del Paso 3 se estiman funciones de dano empiricas y se generan visualizaciones espaciales, temporales y de incertidumbre, ademas de coeficientes por escenarios de precios.

### Paso 5 - Calculo del SCC parcial de energia

Usando las funciones de dano estimadas, se calcula el costo social del carbono parcial (solo energia) y se generan los valores reportados en las tablas del paper.

Actualmente, el repositorio no incluye aun el codigo para propagar la incertidumbre de estos valores de SCC.
