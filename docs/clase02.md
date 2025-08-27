# Sesión 2: Funciones, arreglos, iteraciones y MIDI
__Lunes 18 de Agosto, 2025__  
__Lugar: Zoom__

El objetivo de esta clase profundizar en la sintaxis de las funciones y entender la relación entre frecuencias en relación al protocolo MIDI  

## Índice de Temas
1. [Repaso y profundización de sintaxis](#sintaxis)
2. [Funciones](#funciones)
3. [Arreglos](#arreglos)
4. [Aleatoriedad](#aleatoriedad)
5. [Conversión de MIDI a Frecuencia](#midi-a-frecuencia)
6. [Concatenación de Strings](#concatenacion-strings)
7. [Ciclos (Loops)](#ciclos-loops)
8. [Ejercicios](#ejercicios)
9. [Recursos de la sesión](#recursos-sesion)
10. [Recursos adicionales](#recursos-adicionales)

## Temas revisados 

### 1. Repaso y profundización de sintaxis {#sintaxis}
- Variables y scope (alcance):
    - Variables globales (con ~): ~miVariable
    - Variables de contexto (locales): definidas con var dentro de ( )
    - Variables de entorno (predefinidas): letras minúsculas (ej: a, b), inicializadas en nil (excepto s, ya que es exclusiva del server).
- Manejo de errores:
    - "Variable not defined": variable no declarada.
    - "Syntax error": error gramatical (paréntesis, ;, etc.).
    - Los errores a menudo se originan en la línea anterior a la reportada.

### 2. Funciones {#funciones}
- Definición
```
  ~miFuncion = { arg param1, param2; 
      // Cuerpo de la función
      param1 * param2; // Última línea es el valor de retorno
  };
)
``` 
- Ejecución `~miFuncion.value(5, 10);`
- Argumentos con valores por defecto.
``` 
(
  ~miFuncion = { arg param1 = 0, param2 = 1; 
      param1 + param2;
  };
)
``` 

### 3. Arreglos {#arreglos}
- Creación:
    - Explícita `[40, 30, 32, 39, 31, 40, 33, 49]`
    - Con rango `(0..12)`
- Métodos útiles:
    - `.sum`: Suma todos los elementos.
    - `.size`: Devuelve el número de elementos.
    - `.scramble`: Devuelve una copia revuelta del arreglo.
    - `.choose`: Devuelve un elemento aleatorio.
- Iteración con `.do`:
``` sclang
(0..127).do({ arg nota; 
    // Código a ejecutar para cada valor de 'nota'
}); 
```

### 4. Aleatoriedad {#aleatoriedad}
- Métodos 
    - `5.rand`: Entero aleatorio entre 0 y 4.
    - `5.0.rand`: Flotante aleatorio entre 0.0 y 5.0.
    - `rrand(3, 6)`: Entero aleatorio entre 3 y 6 (inclusive).
    - `exprand(2.0, 4.0)`: Flotante aleatorio entre 2.0 y 4.0.

### 5. Conversión de MIDI a Frecuencia {#midi-a-frecuencia}
- <a href="https://newt.phys.unsw.edu.au/jw/notes.html" target="_blank">Fórmula de Frecuencia a MIDI</a>: `freq = 440 * (2 ** ((midiNote - 69) / 12))`
- Método nativo de SuperCollider: `midicps` (ej: `69.midicps` devuelve `440`).

### 6. Concatenación de Strings {#concatenacion-strings}
- Uso del operador `+` para concatenar:
```
("Nota: " + 60 + " Hz: " + 261.625).postln;
```
### 7. Ciclos (Loops) {#ciclos-loops}
- `.do` en números: Itera `n` veces (ej: `5.do{ ... }` itera 5 veces con valores de 0 a 4).
- `.do` en arreglos: Itera sobre cada elemento del arreglo.

## Ejercicios {#ejercicios}
### 1.  Función de Conversión MIDI a Frecuencia
Escribir una función que convierta un valor MIDI (0-127) a su frecuencia correspondiente en Hz usando la fórmula proporcionada.

### 2. Iteración y Aleatoriedad
Generar e imprimir las frecuencias de todas las notas MIDI (0 a 127) usando un ciclo.

Modificar el ejercicio para que también imprima el número de nota MIDI junto a su frecuencia.

### 3. Composición Serial (Ejercicio Silencioso)
Crear una serie de 12 notas (0 al 11), revolverla (`scramble`), y luego iterar sobre ella.

Para cada nota, imprimir algo como: `"Nota [nota+60]: [dinámica aleatoria]"`, donde las dinámicas sean elegidas aleatoriamente de un arreglo predefinido (ej: `["pp", "p", "mf", "f", "ff"]`).

**Objetivo**: Practicar el manejo de arreglos, iteración, aleatoriedad y concatenación de strings.


## Recursos de la sesión {#recursos-sesion}

[Archivo SuperCollider Sesión 2 (.scd)](../assets/scd/sesion02.scd)  
<a href="https://www.youtube.com/watch?v=8ESSVsGFGxA&list=PL7lm0VTw8-QE7YSEg_A0puKEIanOK_7wh&index=2&ab_channel=HugoSol%C3%ADs" target="_blank">Grabación de la Sesión 2</a>  

## Recursos adicionales {#recursos-adicionales}
<a href="https://doc.sccode.org/Tutorials/Getting-Started/04-Functions-and-Other-Functionality.html" target="_blank">SuperCollider | Funciones y otras funcionalidades</a>

