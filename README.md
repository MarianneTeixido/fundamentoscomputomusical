# Fundamentos de Cómputo Musical

Seminario impartido por el Dr. Hugo Solis García con el apoyo de Stephanie Marianne Teixido como parte de la curricula ofertada por el Posgrado en Música en el área de Tecnología Musical.

Este repositorio despliega el sitio web del laboratorio utilizando [GitHub Pages](https://docs.github.com/es/pages).

El objetivo de este sitio es documentar el contenido de las clases, procesos, trabajo y reflexiones de este seminario. 

## Despliegue local del sitio 
Este proyecto utiliza **Jekyll** y el tema **Minimal** de GitHub Pages.  
Sigue estos pasos para verlo en tu máquina.

### 1. Requisitos

- **WSL** o Linux
- **Ruby** (>= 2.7)
- **Bundler** y **Jekyll**

Instala las dependencias necesarias:

``` bash
sudo apt update
sudo apt install ruby-full build-essential zlib1g-dev -y
```

Agrega Ruby a tu PATH:

``` bash
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

Instalar Jekyll y Bundler:

``` bash
gem install jekyll bundler
```

## 2. Clonar el repositorio 

``` bash
git clone git@github.com:MarianneTeixido/fundamentoscomputomusical.git 
cd fundamentoscomputomusical
```

## 3. Instala las dependencias del proyecto

Este proyecto usa las mismas gemas que GitHub Pages.
Instálalas:

``` bash
bundle install
```

## 4. Levantar el servidor local

Ejecuta:

``` bash
bundle exec jekyll serve
```

Si todo va bien, verás algo como:

``` bash
Server address: http://127.0.0.1:4000
``` 

Abre http://localhost:4000 en tu navegador.