//clase del 11 de agosto
//comentarios

//operadores matematicos
5 % 12 //modulo

//contexto

//variables entorno, globales, locales

//clase 18 de agosto
(
var eG = 40, eM = 38, eA = 32, eD = 39, eN = 31,eNo = 40, eMa = 33, eH = 49;
var suma = eG + eM + eA + eD + eN + eNo + eMa + eH;
var promedio = suma / 8;
postln(promedio);
)

(
var eG = 40, eM = 38, eA = 32, eD = 39, eN = 31,eNo = 40, eMa = 33, eH = 49;
postln((eG + eM + eA + eD + eN + eNo + eMa + eH) / 8);

)
 //parentesis tambien para establecer el orden de las operaciones
//orden de prioridades
5 + 5 * 2
5 + (5 * 2)
(5 + 5)  * 2

//arreglos
(
var edades = [40,38,32,39,31,40,33,49];
postln(edades[0] + edades[7]);
)

Array
//funciones
~tortilleria = {
	var agua = 2;
	var maseca = 4;
	var tortillas = agua * maseca;
	tortillas;
}

~tortilleria.value()

//
//funciones
~tortilleria = {arg agua, maseca;
	var tortillas = agua * maseca;
	tortillas;
}

~tortilleria.value(2,5)
~tortilleria.value(20,100)
~tortilleria.value(20)

~tortilleria = {arg agua = 0, maseca = 0;
	var tortillas = agua * maseca;
	tortillas;
}

~tortilleria.value(20,40)

~miarreglo = [40,23,678];
~miarreglo.replace(40,444)

(
var edades = [40,38,32,39,31,40,33,49,30];
postln(edades.sum() / edades.size());
)

(
var edades = [40,38,32,39,31,40,33,49,30];
postln(edades.mean);
)

(
var edades = [40,38,32,39,31,40,33,49,30];
postln(edades.mean);
)

postln([40,38,32,39,31,40,33,49,30].mean())

postln("hola")
"hola".postln

postln([40,38,32,39,31,40,33,49,30].mean)

[40,38,32,39,31,40,33,49,30].mean.postln

69.midicps
440.cpsmidi

//hacer funcion que convierta de valor midi a frequencia
//similar a la de la tortilleria
//ver en internet la formula

func = {arg ent1, ent2, ent3;
	var in1, int2;
	//hacer
}

func = {|ent1, ent2, ent3|
	var in1, int2;
	//hacer
}


~midi2freq = { arg midi;
	440 * (2 ** ((midi - 69) / 12));
}

(
~midi2freq.value(12).postln;
~midi2freq.value(13).postln;
~midi2freq.value(14).postln;
~midi2freq.value(15).postln;
~midi2freq.value(16).postln;
~midi2freq.value(17).postln;
~midi2freq.value(18).postln;
)

(
//ciclos -> iteraciones
// for, while
5.do({
	arg contador;
	contador.postln;
});
)

(
//ciclos -> iteraciones
// for, while
[5,3,8,4].do({
	arg elemento;
	elemento.postln;
});
)


//TODO JUNTO
(
var m2f = { arg midi;
	440 * (2 ** ((midi - 69) / 12));
};

128.do({arg nota;
	postln("nota " + nota + " es " + m2f.value(nota) + "Hz.");
});
)

rand(5)
rand(5.3)
rrand(3,6)
rrand(2.0,4.0)

//composcion TAREA 1 Silencios schoemberg :-(
(
var escala = (0..11);
var serie = escala.scramble;
var dinamica = ["ppp", "pp", "p", "mp", "f", "ff", "fff"];
var m2f = { arg midi;
	440 * (2 ** ((midi - 69) / 12));
};
serie.do({arg notaSch;
	postln("NOTA" + m2f.value(notaSch + 60) + dinamica.choose);
});
)