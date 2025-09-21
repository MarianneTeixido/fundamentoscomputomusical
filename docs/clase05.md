# Sesion 5 

¡Claro! Aquí tienes un resumen detallado de la clase, con fragmentos de código integrados en cada sección, listo para publicar en un blog.

---

### **Resumen de la Clase: Programación en SuperCollider - Sesión 4**

#### **Temas Revisados**
En esta sesión, revisamos las tareas de los estudiantes y utilizamos sus códigos como pretexto para profundizar en conceptos clave de SuperCollider. Los temas centrales fueron:

1.  **Revisión de Tareas (Composición Estocástica y Melodías):**
    *   Se analizaron implementaciones de composiciones que utilizaban rutinas, `SynthDefs` personalizados y estructuras de control para generar materiales sonoros aleatorios o melódicos.
    *   Se destacó la importancia de la planificación en la arquitectura del código (ej: definir todos los `SynthDefs` al inicio) y se discutieron errores comunes.

2.  **Arreglos y Métodos de Iteración Avanzados (`collect`, `do`):**
    *   Uso de `collect` para transformar arreglos de manera concisa, aplicando una función a cada elemento y devolviendo un nuevo arreglo.
    *   **Azúcar sintáctico (`{arg item; item * 2}` vs `{ |item| item * 2 }` vs `_. * 2`):** Se introdujo la notación `_` para escribir funciones de iteración de forma más compacta.
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

#### **Ejercicios Prácticos Revisados (Con Fragmentos de Código)**
Los estudiantes presentaron una variedad de ejercicios. Aquí se muestran fragmentos clave:

1.  **Andrés: Composición Modal con Múltiples Capas**
    *   Uso de arreglos para definir escalas modales y rutinas paralelas para bajos y melodías.
    ```supercollider
    // Definición de un modo (Ej: Dorico)
    ~modo = [0, 2, 3, 5, 7, 9, 10]; // Grados de la escala
    ~notas_base = 36 + (12 * [0,1,2,3,4,5,6]); // Notas base en diferentes octavas
    ~acordes = ~notas_base.collect({ |nota_base| ~modo + nota_base }); // Generar acordes para cada octava
    ~acordes = ~acordes.flatten; // Aplanar para tener un array de notas individuales

    // Rutina para una línea de bajo
    ~rutina_bajos = Routine({
        inf.do({
            var nota = ~acordes.choose; // Elige una nota aleatoria del array
            var duracion = rrand(0.5, 2.0);
            Synth(\bajo, [\freq, nota.midicps, \dur, duracion]);
            duracion.wait;
        });
    }).play;
    ```

2.  **Constanza: Melodía Simple con Envolvente**
    *   Implementación de una melodía conocida ("Cumpleaños Feliz") con un `SynthDef` básico.
    ```supercollider
    (
    SynthDef(\organo, { |freq=440, amp=0.5, dur=0.5|
        var sig, env;
        env = EnvGen.kr(Env.perc(0.01, dur), doneAction: 2);
        sig = SinOsc.ar(freq, 0, amp) * env;
        Out.ar(0, sig ! 2); // Duplica la señal mono a estéreo
    }).add;
    )

    // Melodía: "Cumpleaños Feliz" (notas MIDI)
    ~melodia = [60, 60, 62, 60, 65, 64, 60, 60, 62, 60, 67, 65];
    ~duraciones = [0.4, 0.4, 0.8, 0.4, 0.4, 1, 0.4, 0.4, 0.8, 0.4, 0.4, 1];

    // Rutina que reproduce la melodía
    Routine({
        ~melodia.size.do({ |i|
            Synth(\organo, [\freq, ~melodia[i].midicps, \dur, ~duraciones[i]]);
            ~duraciones[i].wait;
        });
    }).play;
    ```

3.  **Diego: Exploración Psicoacústica (Percepción del Pitch)**
    *   Investigación de cuántos periodos de una onda son necesarios para percibir claramente su altura.
    ```supercollider
    (
    SynthDef(\pitchexperiment, { |freq=440, periodos=10, amp=0.1|
        var periodo, ataque, duracion_total, sig, env;
        periodo = 1 / freq; // Duración de un periodo en segundos
        ataque = periodo * periodos; // Tiempo de ataque basado en el nº de periodos
        duracion_total = ataque * 2; // Duración total del sonido
        env = EnvGen.kr(Env.triangle(duracion_total, amp), doneAction: 2);
        sig = SinOsc.ar(freq, 0, env);
        Out.ar(0, sig);
    }).add;
    )
    // Probar con diferente número de periodos
    Synth(\pitchexperiment, [\freq, 440, \periodos, 2]); // ¿Se percibe la altura?
    Synth(\pitchexperiment, [\freq, 440, \periodos, 16]); // ¿Se percibe más claramente?
    ```

4.  **Malitzin: Glissandos y Batimentos con `Line.kr`**
    *   Uso de `Line.kr` para crear cambios progresivos (glissandos) de frecuencia y amplitud.
    ```supercollider
    (
    SynthDef(\glissando, { |freqInicio=200, freqFin=800, dur=3, amp=0.2, pan=0|
        var frec, sig, env;
        frec = Line.kr(freqInicio, freqFin, dur); // Controla el glissando
        env = EnvGen.kr(Env.perc(0.1, dur), doneAction: 2);
        sig = SinOsc.ar(frec, 0, amp * env);
        sig = Pan2.ar(sig, pan); // Panea la señal
        Out.ar(0, sig);
    }).add;
    )
    // Ejecutar el glissando
    Synth(\glissando, [\freqInicio, 100, \freqFin, 1000, \dur, 5, \pan, -1]);
    ```

#### **Recursos y Materiales Mencionados**
*   **Documentación de SuperCollider:** Se enfatizó el uso de `Ctrl+D` (o `Cmd+D`) sobre cualquier clase o método para acceder a su documentación oficial. Especialmente útil para `Env`, `Pan2`, `Line`, `collect`, `flatten`.
*   **Libro de Referencia:** "The SuperCollider Book" (MIT Press) para teoría y ejemplos avanzados.
*   **Compositor de Referencia:** **Conlon Nancarrow**, conocido por sus estudios para piano mecánico que exploran politempos y polirritmos complejos mediante la superposición de capas a diferentes velocidades. [Documental recomendado](https://www.youtube.com/watch?v=3g1P3j1932s).

#### **Tarea Asignada: "Estudio à la Nancarrow"**
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
