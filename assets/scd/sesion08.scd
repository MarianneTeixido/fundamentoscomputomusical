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

//clase agosto 27 !!!!!!!!!!!!!!

//visibilidad
(
  var altura;
  postln("adios");
  { arg peso;
	var color;
	postln("adios2");
  }
)

//arg, var, arreglos, arreglos dobles, orden

(
 var cantPasteles = 5;
 var hacerPasteles = {arg cantidadP;
	var agua = "h20";
	var harina = "c2h4";
	postln(agua + harina + cantidadP);
 };
 hacerPasteles.value(cantPasteles)
)

(
 var edad = 20;
 var altura = 120;
 postln(altura * edad);
)

~caminar = {
	postln("pasito");
}

~caminar.(50)


~caminarAd = {arg vel;
	postln("pasito" + vel);
}

~caminarAd.value("rapido")
~caminarAd.value("lento")

voy para alla
voy pall'a
vy

//arg
(
var alumnos = ["andres", "constanza", "nohemi", "gabriel"];
alumnos.do({arg alu;
	postln(alu);
})
)

(
~a1 = ["andres", 1.74, True];
~a2 = ["Nohemi", 1.67, True];
~a3 = ["Constanza", 1.60, False];
~a4 = ["Gabriel", 1.70, True, "O"];
~alumnos = [~a1, ~a2, ~a3, ~a4];
)


(
~alumnosV2 = [
	["andres", 1.74, True, [8,5,6]],
	["Nohemi", 1.67, True],
	["Constanza", 1.60, False],
	["Gabriel", 1.70, True, "O"]
];
postln(~alumnosV2[0][3][1])
)


//cometnarios
(
5.do{arg c;
	postln((c + 20) + ["r","v","a","n"].choose)
}
)


//operadores lógicos
true
false

a = 5
b = "hola"
c = [4,2]
d = 5.32
e = true

//operadores de comparacion
==
>
<
>=
<=
!= //diferente
5 == 5
5 > 6
6 != 5

5 == 6 || 4 != 5

(true && true && true)
(false && true && true)
(false || true && true)
(false || true)

(
var lloviendo = true;
var tengoDinero = false;
if(lloviendo && tengoDinero,
	{"uber".postln},
	{"caminado".postln});
)

(
var lloviendo = 1.0.rand < 0.95;
var tengoDinero = true;
if(lloviendo && tengoDinero,
	{"uber".postln},
	{"caminado".postln});
)

60.midicps


(
var tiempo = Routine({
	5.do{
		var sonido = Synth("default", [\freq, 1000]);
		"hola".postln;
		2.wait;
		sonido.free;
		2.wait;
	}
});
tiempo.play;
)



///Clase del 1 de septiembre, y estamos contentos!
//hya una diferencia entre symbolo y string
a = "hola"
b = \hola

"hola" + "adios"
"hola" ++ "adios"


a = 6;
b = a;
postln(b);
a = 10;
postln(b);

a = [0,1,2,3]
b = a;
postln(b);
a = [5,6,7,8]
postln(b);

a = Synth(\piano).add;
b = a;
a = Synth(\arpa).add;
b

//mutacion
a = ["perro","gato","perico"]
b = a
a[2] = "chango"
b

a = 6
b = a
a = 4
b

///tema en pausa porque el profe no sabe
~sonido1 = SynthDef.new(\organo, {});
~sonido1 = SynthDef(\organo, {});

~humano1 = Humano.nace("mx", "F", 4.30)
~humano2 = Humano.invitro("fr", "F", 3.30)

~humano1.registrarlo("maria");
~humano2.registrarlo("clear");

~humano1.come("leche");
~humano2.come("formula");

Humano("mx")



SynthDef(\organo, {
	SinOsc.ar(220, mul: 4, phase: 3);
}).add;


{SinOsc.ar(400, add: 1)}.plot

~tortilleria = {arg agua = 0, maseca = 0;
	var tortillas = (agua * 2) + (maseca*3);
	tortillas;
}
~tortilleria.(maseca: 2, agua: 1)


~tortilleria = {arg agua, maseca;
	var tortillas = (agua * 2) + (maseca*3);
	tortillas;
}
~tortilleria.()
//////
//V1
SynthDef(\organo, {
	var signal = SinOsc.ar(220, mul: 4, phase: 3);
	Out.ar(0, signal);
}).add;
Synth(\organo);

//V2
SynthDef(\organo, { arg freq;
	var signal = SinOsc.ar(freq);
	Out.ar(0, signal);
}).add;
Synth(\organo, [\freq, 1000]);


(
SynthDef(\organo, { arg freq, amp;
	var signal = SinOsc.ar(freq, 0, amp);
	Out.ar(0, signal);
}).add;
)
Synth(\organo, [\freq, 500, \amp, 0.7]);



//
SynthDef(\organo, { |freq = 440, amp = 0.5|
    var signal;
    signal = SinOsc.ar(freq) * amp;
    Out.ar(0, signal);
}).add;

Synth(\organo, [\freq, 1000, \amp, 0.1]);



SynthDef(\organo, { |freq = 440, amp = 0.5, dur = 0.25|
    var signal, env;
	env = EnvGen.kr(Env.perc(releaseTime: dur), doneAction: Done.freeSelf);
    signal = SinOsc.ar(freq) * amp * env;
    Out.ar(0, signal);
}).add;

Synth(\organo, [\freq, 60.midicps, \amp, 0.4, \dur, 1]);

(
Routine({
	5.do({
		Synth(\organo, [\freq, rrand(48,70).midicps, \amp, rrand(0.2,0.3), \dur, rrand(2.0,5.0)]);
		rrand(0.5,1.0).wait;
	});
	5.do({
		Synth(\organo, [\freq, rrand(48,70).midicps, \amp, rrand(0.2,0.3), \dur, rrand(2.0,5.0)]);
		rrand(0.5,1.0).wait;
	});
}).play;

Routine({
	5.do({
		Synth(\organo, [\freq, rrand(48,70).midicps, \amp, rrand(0.2,0.3), \dur, rrand(2.0,5.0)]);
		rrand(0.5,1.0).wait;
	});
	5.do({
		Synth(\organo, [\freq, rrand(48,70).midicps, \amp, rrand(0.2,0.3), \dur, rrand(2.0,5.0)]);
		rrand(0.5,1.0).wait;
	});
}).play;

)



///CLASE 8 de sep

[3,8,2].wchoose([0.2,0.7,0.1]);
[50,3,8,2].normalizeSum
[3,8,2].wchoose([20,200,10]);
Scale.directory
Scale.all
Tuning

Scale.minor

//Array.fill(10,{0})

a = [2]
a = a.add(10)


~damediezrandom = {
	var resultado = [];
	10.do({
		resultado = resultado.add(rrand(0,10));
	});
	resultado;
};

~damediezrandom.()

~arregloAl = 10.collect({rrand(0,10)});


5.collect({arg note;
	note + [0,4,7]
})

5.collect(
	_ + [0,4,7]
)


5.do({arg contador;
	contador*3;
}
)

5.do(
	_*3;
)

[36, 48, 60].collect({
	note+[0, 4,7]
})

[1,4,7,8] + [6,8,5]

[[5,9],[3,6],[2,7,[6,3,8]]].flatten(4)

5.collect.nomralize.scramble.revelre.sum
5.collect(_ * 3).scramble.sum


/////
(
SynthDef(\sonido, {arg freq, dur, amp, pan;
	var signal, env;
	env = EnvGen.kr(Env.triangle(dur), doneAction: Done.freeSelf);
	signal = SinOsc.ar(freq * [1,2,3,4,5,6]);
	Out.ar(0, Pan2.ar(signal.sum * env / 6),pan);
}).add;
)

Synth(\sonido, [\freq, 69.midicps, \dur, 3, \amp, 0.2, \pan, 0.25]);

s.scope
Conlon Nancarrow

1. minuto max
2. a lo mas 6 capas => rutinas
3. un unico motivo en todas
4. cada capa con un juego particular de paneo
5. es basicamente un juego de politempos
6. modificar con un arreglo de amplitudes, la t{imbirica del sinte
7. sin libreria



///clase 22 de sep
[5,3,5,7].dup(6).flat




//clase 6 de octubre
	{(SinOsc.ar(freq: [440,442,443], mul: [0.2, 0.1, 0.3])).sum}.play

SynthDef(\campana, {arg amp = 1, dur = 1, freq = 440, pos = 0;
		var signal, env;
		var freqsTodas = freq * [0.56, 0.56, 0.92, 0.92, 1.19, 1.7, 2, 2.74, 3, 3.76, 4.07];
		var ampTodas = [ 1, 0.67, 1, 1.8, 2.67, 1.67, 1.46, 1.33, 1.33, 1, 1.33];
		freqsTodas[3] = freqsTodas[3] + 1; //OJO con esto
		env = EnvGen.kr(Env.perc(releaseTime: dur)); //no matarols
		signal = SinOsc.ar(freqsTodas, 0, amp * ampTodas * env / ampTodas.sum);
		Out.ar(0, Pan2.ar(signal.sum , pos));
}).add;

Synth(\campana,  [\amp, 1, \dur, 5, \freq, 60.midicps, \pos, 0.2]);

s.scope









