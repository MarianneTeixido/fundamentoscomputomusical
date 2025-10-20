# **Clase 9 | Programación de un Entrenador Auditivo y Refinamiento de Síntesis**

## **Introducción**
En esta sesión, continuamos explorando las posibilidades de la programación en SuperCollider, utilizando la síntesis de sonido como pretexto para ejercitar conceptos fundamentales de programación como variables, arreglos, ciclos y condicionales. El objetivo central fue comenzar el desarrollo de un **entrenador auditivo interactivo** que genera intervalos melódicos o armónicos de manera aleatoria.

---

## **Temas Revisados**

### **1. Revisión y Refinamiento de Tareas (Síntesis de Campanas)**
- **Análisis de código:** Se revisaron en detalle las implementaciones de lxs estudiantes para la síntesis aditiva de campanas, basadas en los modelos de Risset.
- **Mejoras de estilo y eficiencia:**
    - Uso de valores booleanos (`true`/`false`) en lugar de `1`/`0` para una lógica más clara.
    - Utilización de **nombres de argumentos** en las funciones para mejorar la legibilidad del código.
    - Ajuste de amplitudes para evitar saturación (dividiendo la señal resultante por la suma total de amplitudes).
    - Uso de la función `dbamp` para manejar dinámicas de manera más perceptual (decibeles a amplitud).

### **2. Programación de un Entrenador Auditivo (GUI Básica)**
- **Introducción a las Interfaces Gráficas (GUI):** Uso de la clase `Window` para crear una ventana interactiva.
- **Creación de elementos:**
    - **Botones:** Clase `Button` para generar interacción. Se practicó el posicionamiento dinámico de múltiples botones en una cuadrícula.
    - **Lógica del programa:** Generación aleatoria de dos frecuencias (notas) para formar un intervalo.
- **Parámetros del entrenador:**
    - **Intervalos:** Generación de intervalos desde unísono hasta octava (valores de 0 a 12 en semitonos).
    - **Niveles de Dificultad:** Uso de un arreglo para definir y seleccionar subconjuntos de intervalos según la dificultad (ejemplo: comenzar solo con terceras mayores y quintas justas).
    - **Modo de reproducción:** Flexibilidad para que los intervalos suenen de forma **melódica** (con pausa) o **armónica** (simultáneos).

### **3. Conceptos de Programación Aplicados**
- **Manejo de Arreglos:** Uso de `collect` para transformar arreglos de manera eficiente.
- **Placeholder (`_`) para funciones:** Atajo sintáctico para escribir funciones de una sola línea de manera más concisa.
- **Control de Flujo:** Uso de condicionales (`if`) para modificar el comportamiento del sonido (ejemplo: activar/desactivar un "pedal" o una nota fundamental).
- **Rutinas y Tasks:** Para manejar la ejecución de procesos en el tiempo, permitiendo pausas y control de patrones.

---

## **Ejercicio Práctico en Clase: Entrenador de Intervalos**

### **Objetivo**
Implementar la base de un entrenador auditivo que genere intervalos aleatorios y permita al usuario practicar su identificación.

### **Funcionalidades Implementadas**
1.  **Generación de Sonido:** Un sintetizador simple (`SinOsc`) con envolvente (`Env.perc`) para producir las notas.
2.  **Interfaz Gráfica:**
    - Una ventana con un botón "Intervalo" que, al presionarlo, genera y reproduce un nuevo intervalo.
    - Una serie de botones (en desarrollo) que representarán los diferentes intervalos para que el usuario seleccione su respuesta.
3.  **Lógica del Juego (Tarea):**
    - Al presionar el botón "Intervalo", el programa debe generar dos notas y calcular el intervalo entre ellas.
    - El usuario debe identificar el intervalo y seleccionar el botón correspondiente.
    - La consola debe indicar "Correcto" o "Incorrecto" según la elección del usuario.

---

## **Ejercicio de Composición | Tarea**

### **Instrucciones**
1.  **Completar el Entrenador Auditivo:**
    - Desarrollar la lógica para que, al hacer clic en un botón de intervalo, se compare con el intervalo generado aleatoriamente.
    - Mostrar el resultado ("Correcto" o "Incorrecto") en la **post window**.
2.  **Ampliar Funcionalidades (Opcional):**
    - Implementar un sistema de puntuación que lleve la cuenta de aciertos y errores.
    - Agregar un `Slider` o otro control para cambiar el nivel de dificultad dinámicamente.
    - Mejorar la interfaz gráfica para que sea más intuitiva y visualmente atractiva.

---

## **Recursos y Referencias**

### **Material de la Clase**
* **Grabación de la sesión 9**: [Enlace al video](https://youtu.be/ILvmaUm5lXw?si=i8gTvq7fu2_6edR9)
* **[Código Base del Entrenador Auditivo:(.scd)](../assets/scd/entrenamiento.scd) **  
* **Documentación de SuperCollider:**
    - Clase `Window`: [Ayuda de Window](https://doc.sccode.org/Classes/Window.html)
    - Clase `Button`: [Ayuda de Button](https://doc.sccode.org/Classes/Button.html)
    - Clase `Slider`: [Ayuda de Slider](https://doc.sccode.org/Classes/Slider.html)

### **Lecturas y Ejemplos Recomendados**
- `GUI.help` dentro de SuperCollider para explorar todos los elementos de interfaz disponibles.
- Ejemplos en `Help > GUI > Introduction` y `Help > GUI > Using GUI`.

---

**Nota:** El enfoque de esta clase no es solo la síntesis de sonido, sino el uso de problemas musicales para dominar los fundamentos de la programación. La práctica constante es clave para internalizar estos conceptos.