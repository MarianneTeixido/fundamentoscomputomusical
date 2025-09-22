
# **Sesion 5**

## **Temas Revisados**
En esta sesión, revisamos las tareas de los estudiantes y utilizamos sus códigos como pretexto para profundizar en conceptos clave de SuperCollider. Los temas centrales fueron:

1.  **Revisión de Tareas (Composición Estocástica y Melodías):**
    *   Se analizaron implementaciones de composiciones que utilizaban rutinas, `SynthDefs` personalizados y estructuras de control para generar materiales sonoros aleatorios o melódicos.
    *   Se destacó la importancia de la planificación en la arquitectura del código (ej: definir todos los `SynthDefs` al inicio) y se discutieron errores comunes.

2.  **Arreglos y Métodos de Iteración Avanzados (`collect`, `do`):**
    *   Uso de `collect` para transformar arreglos de manera concisa, aplicando una función a cada elemento y devolviendo un nuevo arreglo.
    *   **Sintáxis (`{arg item; item * 2}` vs `{ |item| item * 2 }` vs `_. * 2`):** Se introdujo la notación `|` para escribir funciones de iteración de forma más compacta.
    *   **`flatten`:** Método para "aplanar" arreglos anidados (ej: convertir `[[1,2], [3,4]]` en `[1,2,3,4]`).

3.  **Manipulación de Señales Multicanal:**
    *   **Expansión de Señales:** Cuando un UGen (como `SinOsc`) recibe un arreglo como argumento (ej: `freq: [440, 880]`), genera una señal multicanal (una para cada frecuencia).
    *   **Suma de Señales (`sum`):** Método para mezclar (sumar) los canales de una señal multicanal en una sola señal mono.
    *   **Paneo (`Pan2`):** UGen para distribuir una señal mono en el campo estéreo. Recibe un argumento `pos` entre -1 (izquierda) y 1 (derecha).

4.  **Síntesis de Sonidos Complejos:**
    *   **Batimentos:** Creación de batimentos utilizando múltiples osciladores con frecuencias ligeramente diferentes (ej: `[0.995, 1, 1.005] * freq`).
    *   **Envolventes (`Env`):** Uso de envolventes personalizadas con `Env.new` para definir formas complejas (niveles y duraciones) más allá de las predefinidas como `Env.perc`.
    *   **Filtros (`RLPF`):** Uso de filtros (ej: `RLPF`) para modificar el timbre de una señal recortando ciertas frecuencias.

5.  **Estructuración de Código y Buenas Prácticas:**
    *   **Arreglos para Datos Musicales:** Uso de arreglos para almacenar estructuras musicales como melodías y ritmos de manera organizada (ej: `[[nota, duración], [nota, duración], ...]`).
    *   **Rutinas Paralelas:** Cómo ejecutar múltiples rutinas simultáneamente para crear capas o secciones independientes en una composición.
    *   **Manejo de Amplitud:** Prevención de clipping (distorsión por exceder 1.0) al sumar señales, dividiendo la amplitud total entre el número de señales (ej: `amp / 3`).

## **Ejercicios Prácticos Revisados (Con Fragmentos de Código)**
Los estudiantes presentaron una variedad de ejercicios. Aquí se muestran fragmentos clave:

1.  **Andrés: Composición Modal con Múltiples Capas**
    *   Uso de arreglos para definir escalas modales y técnicas como scramble para aleatoriedad.     

[Código disponible aquí](../assets/scd/tareas/tarea3Andres.scd)

2.  **Constanza: Melodía Simple con Envolvente**
    *   Generación de patrones melódicos y rítmicos usando Routine y bucles do.  

[Código disponible aquí](../assets/scd/tareas/tarea3Constanza.scd)

3.  **Diego: Exploración Psicoacústica (Percepción del Pitch)**
    *   Investigación de cuántos periodos de una onda son necesarios para percibir claramente su altura.

[Código disponible aquí](../assets/scd/tareas/tarea3Constanza.scd)


4.  **Malitzin: Glissandos y Batimentos con `Line.kr`**
    *   Uso de `Line.kr` para crear cambios progresivos (glissandos) de frecuencia y amplitud.

[Código disponible aquí](../assets/scd/tareas/tarea3Ana.scd)

5.  **Nohemí: Señales multicanal y paneo**
    *   Expansión de señales mono a estéreo con !2 y paneo con Pan2.

[Código disponible aquí](../assets/scd/tareas/tarea3Nohemi.scd)


## **Recursos y Materiales**
*   **Repositorio de la Clase:** [Archivo de SuperCollider Sesión 5 (.scd)](../assets/scd/sesion05.scd)  
*   **Grabación de la sesión 4** 

<iframe width="560" height="315" src="https://www.youtube.com/embed/zE1JMhwzQs0?si=-831SXpRT7jImqXY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

*   **Libros de Referencia:**
    *   The SuperCollider Book (2nd ed.) editado por Scott Wilson, David Cottle y Nick Colllins disponible en este [link](../assets/pdf/The-supercollider-book-second-edition.pdf)

*   **Compositor de Referencia:** **Conlon Nancarrow**, conocido por sus estudios para piano mecánico que exploran politempos y polirritmos complejos mediante la superposición de capas a diferentes velocidades. Documentales recomendados: 

1.    
<iframe width="560" height="315" src="https://www.youtube.com/embed/f2gVhBxwRqg?si=ow3y85AE6wr44xts" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

2. 
<iframe width="560" height="315" src="https://www.youtube.com/embed/4AsT-wIxte0?si=YUVfeRhBlsdBoH0t" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>


## **Tarea Asignada: "Estudio a la Nancarrow"**
Basándose en los conceptos vistos, la tarea es crear una composición que explore politempos y timbres, inspirándose en el trabajo de Conlon Nancarrow.

**Instrucciones Detalladas:**
1.  **`SynthDef` Principal (`\nancarrow`):** Crea un `SynthDef` que genere un timbre interesante. Debe utilizar:
    *   **Múltiples Osciladores:** Para crear un sonido más rico (ej: 3x `SinOsc` con frecuencias multiplicadas por `[0.995, 1, 1.005]`).
    *   **Envolvente de Amplitud:** Usa `EnvGen` con una envolvente personalizada (`Env.triangle` o `Env.perc`).
    *   **Paneo:** Incorpora `Pan2` para controlar la posición estéreo.
    ```supercollider
    
2.  **Motivo Musical Único:** Define un array que represente un motivo melódico-rítmico breve. Usa el formato `[[nota, duración], ...]`.
    
3.  **Seis Rutinas Paralelas:** Crea seis rutinas que reproduzcan el mismo `~motivo`, pero con diferentes características:
    *   **Velocidad (Tempo):** Cada rutina debe reproducir el motivo a una velocidad diferente (ej: `0.5x`, `0.75x`, `1x`, `1.5x`, `2x`).
    *   **Registro (Altura):** Transpone el motivo a diferentes octavas (ej: `-12`, `-5`, `0`, `+7`, `+12`).
    *   **Paneo:** Asigna una posición estéreo fija o cambiante a cada rutina (ej: `-1`, `-0.5`, `0`, `0.5`, `1`).
    
4.  **Duración y Formato:** La pieza debe durar entre **30 segundos y 1 minuto**. El código debe estar **comentado** para explicar la función de cada sección.

**El objetivo es demostrar el dominio de la creación de `SynthDefs` complejos, la manipulación de arreglos para datos musicales y el uso de rutinas paralelas para generar estructuras polifónicas y politémicas.**
