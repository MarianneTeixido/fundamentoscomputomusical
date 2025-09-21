# **Sesion 4 | SynthDef**

## **Temas Revisados**
En esta sesión, profundizamos en conceptos avanzados de programación dentro de SuperCollider, con un enfoque en la creación y manipulación de sonidos. Los temas centrales fueron:

1.  **Revisión de Tareas (Escala Cromática Acelerada):**
    *   Se revisaron las implementaciones de los estudiantes para la tarea de la semana anterior: crear una rutina que genere una escala cromática ascendente con aceleración gradual.
    *   Se analizaron diferentes enfoques para modificar dinámicamente la duración (`wait`) entre notas y la frecuencia, utilizando funciones de conversión de MIDI a frecuencia (`midicps`).

    **Código de Ejemplo (Escala Cromática Acelerada):**
    ```supercollider
    (
    Routine({
        var baseFreq = 60; // Nota MIDI inicial (Do central)
        var minWait = 0.8; // Tiempo inicial entre notas
        var maxWait = 0.1; // Tiempo final entre notas (aceleración)
        var steps = 36; // Número de notas a tocar

        steps.do({ |i|
            var note = baseFreq + i; // Escala cromática ascendente
            var freq = note.midicps; // Conversión MIDI a frecuencia
            var waitTime = minWait - ((minWait - maxWait) * (i / steps)); // Aceleración gradual

            Synth(\default, [\freq, freq]); // Tocar la nota
            waitTime.wait; // Pausa variable
        });
    }).play;
    )
    ```

2.  **Referencias y Mutación de Objetos:**
    *   **Variables y Referencias:** Diferenciación entre variables que almacenan **valores primitivos** (como números) y aquellas que almacenan **referencias a objetos** (como arreglos).
        *   Los primitivos se copian al asignarlos a otra variable.
        *   Los objetos (como los arreglos) se referencian. Modificar un elemento de un arreglo referenciado afecta a todas las variables que apuntan a él.
    *   **Ejemplo práctico:** Se demostró cómo modificar un elemento dentro de un arreglo afecta a todas las variables que referencian ese mismo arreglo.

    **Código de Ejemplo (Referencias y Mutación):**
    ```supercollider
    // Primitivos: Se copian
    a = 5;
    b = a;
    a = 10;
    b.postln; // Output: 5 (b mantiene su valor)

    // Objetos (Arreglos): Se referencian
    x = [1, 2, 3];
    y = x;
    x[0] = 99;
    y.postln; // Output: [99, 2, 3] (y es afectado por el cambio en x)
    ```

3.  **Definición y Uso de Sintetizadores Personalizados (`SynthDef`):**
    *   **Arquitectura Cliente-Servidor:** Reforzamiento del concepto: el lenguaje (cliente) define los sintetizadores, y el motor de audio (servidor) los ejecuta.
    *   **Creación de un `SynthDef`:** Construcción de un instrumento personalizado llamado `\organo` utilizando un oscilador de onda sinusoidal (`SinOsc`).
    *   **Argumentos en `SynthDef`:** Cómo definir parámetros personalizados (como `freq` para frecuencia y `amp` para amplitud) para controlar el sonido desde fuera de la definición.
    *   **Velocidades de Cálculo (AR vs. KR):** Diferencias entre `ar` (audio rate, para señales de audio) y `kr` (control rate, para señales de control moduladoras, más eficientes).
    *   **Envío al Servidor:** Uso de `.add` o `send` para compilar y enviar la definición del sintetizador al servidor para su uso.

    **Código de Ejemplo (SynthDef Básico):**
    ```supercollider
    // Definición de un sintetizador simple
    (
    SynthDef(\organo, { |freq=440, amp=0.5|
        var sig;
        sig = SinOsc.ar(freq, 0, amp); // Oscilador sinusoidal a audio rate
        Out.ar(0, sig); // Salida al canal 0 (izquierdo)
    }).add;
    )

    // Uso del sintetizador
    Synth(\organo, [\freq, 660, \amp, 0.3]);
    ```

4.  **Generadores de Unitarios (UGens) y Señales:**
    *   **`SinOsc`:** Generador de onda sinusoidal. Se exploraron sus argumentos: `freq` (frecuencia), `phase` (fase), `mul` (multiplicación/amplitud) y `add` (desplazamiento DC).
    *   **`EnvGen`:** Generador de envolventes. Se utilizó para crear un sonido percutivo que se apaga automáticamente después de un tiempo (`releaseTime`), usando la acción `doneAction: 2` (liberar el nodo del sintetizador al terminar la envolvente).
    *   **Operaciones con Señales:** Cómo las operaciones de multiplicación (`mul`) y suma (`add`) afectan la forma y el rango de una señal.

    **Código de Ejemplo (Envolvente Percutiva):**
    ```supercollider
    (
    SynthDef(\organo_perc, { |freq=440, amp=0.5, dur=0.25|
        var sig, env;
        env = EnvGen.kr(
            Env.perc(attackTime: 0.01, releaseTime: dur), // Envolvente percutiva
            doneAction: 2 // Liberar automáticamente al terminar
        );
        sig = SinOsc.ar(freq, 0, amp) * env; // Aplicar envolvente al sonido
        Out.ar(0, sig);
    }).add;
    )

    // Ejecutar el sintetizador con duración personalizada
    Synth(\organo_perc, [\freq, 880, \dur, 0.5]);
    ```

5.  **Rutinas y Estructuras de Control de Tiempo:**
    *   **Composición Estocástica:** Creación de una rutina infinita (`inf.do`) que ejecuta indefinidamente instancias del sintetizador `\organo` con parámetros aleatorios (frecuencia, amplitud, duración) y pausas aleatorias entre ellas.
    *   **Ejecución en Paralelo:** Discusión sobre cómo iniciar múltiples rutinas simultáneamente para crear texturas sonoras más complejas.

    **Código de Ejemplo (Rutina Estocástica):**
    ```supercollider
    (
    Routine({
        inf.do({
            var freq = rrand(60, 80).midicps; // Frecuencia aleatoria entre Do2 y Sol#2
            var amp = rrand(0.1, 0.3); // Amplitud aleatoria
            var dur = rrand(0.1, 0.5); // Duración aleatoria para la envolvente
            var waitTime = rrand(0.2, 1.0); // Pausa aleatoria entre notas

            Synth(\organo_perc, [\freq, freq, \amp, amp, \dur, dur]);
            waitTime.wait; // Pausa antes de la próxima nota
        });
    }).play;
    )
    ```

#### **Ejercicios Prácticos Revisados**
*   **Revisión de Tareas:** Se mostraron y discutieron distintas soluciones a la escala cromática acelerada, destacando el uso de contadores, operaciones matemáticas para la aceleración y la función `midicps`.
*   **`\organo` Básico:** Construcción colaborativa de un sintetizador simple con parámetros de frecuencia y amplitud.
*   **`\organo` con Envolvente:** Extensión del sintetizador para incluir una envolvente percutiva (`Env.perc`) y auto-liberación (`doneAction: 2`), evitando la necesidad de usar `s.free` manualmente.
*   **Composición Aleatoria:** Creación de una rutina que genera un paisaje sonoro continuo y aleatorio utilizando el sintetizador `\organo` personalizado.

#### **Recursos y Materiales Mencionados**
*   **Repositorio de la Clase:** [Archivo de SuperCollider Sesión 4 (.scd)](../assets/scd/sesion04.scd)  
*   **Grabación de la sesión 4** Disponible en este <iframe width="560" height="315" src="https://www.youtube.com/embed/juHjeTlVfFs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
*   **Libros de Referencia:**
    *   The SuperCollider Book (2nd ed.) editado por Scott Wilson, David Cottle y Nick Colllins disponible en este [link](../assets/pdf/The-supercollider-book-second-edition.pdf)
*   **Ayuda Interna de SuperCollider:** Recuerda que puedes hacer uso de `Ctrl+D` (o `Cmd+D`) sobre cualquier clase o método para acceder a su documentación oficial. Especialmente útil para entender `SynthDef`, `SinOsc`, `EnvGen`, `Env.perc`.
*   **Precaución con ChatGPT:** Es una herramienta útil para descubrir métodos y sintaxis, pero se debe usar para comprender, no solo para copiar código. Puede sugerir soluciones avanzadas o complejas que deben entenderse a fondo.


#### **Tarea Asignada**
Basándose en los conceptos vistos, especialmente en la **rutina de composición aleatoria** y el **`SynthDef` con envolvente**, la tarea para la siguiente sesión es:

**"Composición Estocástica con Múltiples Capas"**

1.  **Extiende el Sintetizador:** Modifica el `SynthDef` `\organo` o crea uno nuevo (`\mi_sonido`) experimentando con otros UGens (ej. `LFSaw`, `Pulse`, `RLPF`) o añadiendo más parámetros modulables (ej. `rate` de un LFO, `rq` de un filtro).

2.  **Crea una Rutina Principal:** Desarrolla una rutina (`Routine` o `inf.do`) que gestione la ejecución de tu sintetizador. Debe incluir:
    *   **Aleatoriedad Controlada:** Parámetros como frecuencia, amplitud y duración deben variar dentro de rangos musicalmente interesantes que definas.
    *   **Estructura:** La rutina no debe ser necesariamente infinita. Puede tener secciones (ej. 5 eventos de una manera, luego 3 eventos de otra, luego un silencio, etc.).

3.  **Capas en Paralelo (Opcional Avanzado):** Para elevar la complejidad, intenta ejecutar **dos o más rutinas simultáneamente** (ej. una para sonidos graves y otra para agudos) que together creen una textura más rica.

4.  **Comenta tu Código:** Usa comentarios (`//`) para explicar brevemente qué hace cada sección importante de tu código. Esto demuestra comprensión y facilita la revisión.

**El objetivo principal es demostrar el dominio de los bloques fundamentales: definición de sintetizadores, uso de rutinas para el control del tiempo y la aplicación de aleatoriedad para generar material musical.**

