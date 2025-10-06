# **Sesión 7 | Fundamentos de Audio Digital y Análisis Espectral**

## **Temas Revisados**
En esta sesión teórica profundizamos en los fundamentos del audio digital y las representaciones espectrales, esenciales para comprender el procesamiento digital de señales.

### **1. Fundamentos de Audio Digital**
- **Sistemas Digitales vs Analógicos:** Los sistemas digitales son discretos, no continuos, debido a la granularización de los valores.
- **Principios Físicos del Sonido:** 
  - Funcionamiento de bocinas mediante bobinas e imanes que convierten señales eléctricas en movimiento de aire
  - Funcionamiento de micrófonos como proceso inverso
  - Sistemas de amplificación y transformación de señales

### **2. Parámetros Clave del Audio Digital**
- **Frecuencia de Muestreo (Sample Rate):**
  - **Teorema de Nyquist:** Para muestrear una señal sin pérdida, debe hacerse al doble de la frecuencia máxima a registrar
  - **44.1 kHz:** Estándar CD (doble del límite auditivo humano teórico de 20 kHz)
  - **Otros estándares:** 48 kHz, 96 kHz, 192 kHz para aplicaciones profesionales

- **Resolución (Bit Depth):**
  - **16 bits:** 65,536 valores posibles (estándar CD)
  - **24 bits:** Mayor rango dinámico para registro profesional
  - **Relación con el rango dinámico:** A mayor bit depth, mayor capacidad para registrar sonidos muy potentes y muy suaves

### **3. Sistemas Numéricos en Computación**
- **Binario (Base 2):** Sistema fundamental con valores 0 y 1
- **Hexadecimal (Base 16):** 
  - Representación compacta: 0-9, A-F
  - Usado en programación y representación de colores (HTML/CSS)
  - Relación directa con bytes (2 caracteres hex = 1 byte)

- **Protocolo MIDI:** 
  - 7 bits de resolución (128 valores) debido a bits de control en transmisión serial
  - Estructura de mensajes: 3 bytes (tipo, canal, valores)

### **4. Análisis Espectral y Transformada de Fourier**
- **Transformada de Fourier:** 
  - Descomposición de señales complejas en sinusoidales simples
  - **FFT (Fast Fourier Transform):** Algoritmo eficiente para análisis espectral digital

- **Espectrograma:**
  - Representación 2D que combina tiempo, frecuencia y energía (color)
  - **Resolución temporal vs espectral:** Trade-off entre ventana de tiempo y detalle frecuencial
  - **Ventanas típicas:** 512, 1024, 2048 muestras (potencias de 2)

## **Ejercicios Conceptuales**

### **1. Cálculo de Tamaño de Archivos de Audio**
- **Archivo estéreo 1 minuto a 44.1kHz/16bit:**
  ```
  44,100 muestras/seg × 60 seg × 2 canales × 16 bits = 84,672,000 bits
  ```

### **2. Interpretación de Espectrogramas**
- **Sonidos puros:** Líneas verticales delgadas
- **Sonidos armónicos:** Múltiples líneas en relaciones matemáticas precisas
- **Ruido:** Energía distribuida en todo el espectro
- **Evolución temporal:** Cambios en las columnas armónicas a lo largo del tiempo

## **Aplicaciones Prácticas**

### **Análisis de Timbre**
- Los espectrogramas permiten identificar características tímbricas mediante:
  - Distribución de energía en armónicos
  - Evolución temporal del ataque y decaimiento
  - Presencia de ruido y componentes no armónicas

### **Procesamiento Digital de Señales**
- **Reconocimiento automático:** Identificación de instrumentos y voces
- **Efectos y transformaciones:** Convoluciones espectrales
- **Restauración y análisis:** Aplicaciones forenses y musicológicas

## **Recursos y Materiales**
*   **Grabación de la sesión 7**

<iframe width="560" height="315" src="https://www.youtube.com/embed/E2jDWF7STRg?si=WCzl_RL0td_PqRuo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

<br>

## **Próximos Temas: Síntesis y Procesamiento Espacial**
En la siguiente sesión aplicaremos estos conceptos a:
*   **Síntesis espectral y aditiva**
*   **Procesamiento binaural y espacialización**
*   **Técnicas de convolución y morphing espectral**
