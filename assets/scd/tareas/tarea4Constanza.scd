TAREA 4

F. DE CÓMPUTO MUSICAL

CONSTANZA MONSIVAIS GARCÍA



////////CONSTRUCCIÓN DEL SYNTHDEF


SynthDef(\sonido, {arg freq, dur, pan, amp= #[0.2,0.1,0.3,0.5,0.1];
	var env= EnvGen.kr(Env.triangle(dur), doneAction:2);
	var sig= SinOsc.ar(freq *[1,2,5,6,7,9],0,amp)*env;
	sig= Pan2.ar(sig.sum/6,pan);
	Out.ar(0,sig)
}).add




///////PROBANDO EL SYNTH

Synth(\sonido, [\freq,200, \dur,1, \amp,[0.2,0.1,0.3,0.5,0.1], \pan,1])




//////RUTINA SIMPLE
(
Routine {
	5.do {Synth(\sonido, [\freq,60.midicps, \dur,1, \amp,[0.2,0.1,0.3,0.5,0.1], \pan,1]);
		1.wait;
}}.play
)




///DECIDÍ IR CONSTRUYENDO UNA RUTINA PARA PROBAR CADA PARÁMETRO QUE NECESITÉ MODIFICAR



///////// FRECUENCIA

(
Routine { var f=[74,75,77,79,80,82,84,86].midicps;

	8.do {Synth(\sonido, [\freq,f.choose, \dur,1, \amp,[0.2,0.1,0.3,0.5,0.1], \pan,1]);
		1.wait;
}}.play
)



//////// PANEO

(
Routine { var f=[74,75,77,79,80,82,84,86].midicps;

	8.do {Synth(\sonido, [\freq,f.choose, \dur,1, \amp,[0.2,0.1,0.3,0.5,0.1], \pan,1.0.rand2]);
		1.wait;
}}.play
)


////////// AMP


(
Routine { var f=[74,75,77,79,80,82,84,86].midicps, a= [0.2,0.1,0.3,0.5,0.1];

	8.do {Synth(\sonido, [\freq,f.choose, \dur,1, \amp,a.rand, \pan,1.0.rand2]);
		1.wait;
}}.play
)

/////DURACIÓN


(
Routine { var f=[74,75,77,79,80,82,84,86].midicps, a= [0.2,0.1,0.3,0.5,0.1] ;

	8.do {arg i;
		Synth(\sonido, [\freq,f[i], \dur,rrand(0.0,1.0), \amp,a.rand, \pan,1.0.rand2]);
		1.5.wait;
}}.play
)




////////// EJERCICIO /////////



/// Primer intento


///Primero hice este aparato, pero me di cuenta que no estaba generando una textura ritmica, todas las rutinas están en un mismo índice y sólo suena 1 rutina, porque no me di cuenta que tenía que ponerle play a cada una de las rutinas. Añadí el % en \freq, f [i%8] para que siguiera añadiendo elementos a lo largo de la rutina que puse en infinito.


(
Routine { var f=[74,75,77,79,80,82,84,86].midicps, a= [0.2,0.1,0.4,0.5,0.3] ;

	inf.do {arg i;
		Synth(\sonido, [\freq,f[i%8], \dur,rrand(1.0,2.0), \amp,a.rand, \pan,1.0.rand2]);
		0.5.wait;
}};

Routine { var f=[74,75,77,79,80,82,84,86].midicps, a= [0.2,0.1,0.3,0.5,0.4];

	inf.do {arg i;
		Synth(\sonido, [\freq,f[i%8], \dur,rrand(0.1,0.4), \amp,a.rand, \pan,1.0.rand2]);
		0.3.wait;
}};
Routine { var f=[74,75,77,79,80,82,84,86].midicps, a= [0.2,0.4,0.3,0.5,0.1] ;

	inf.do {arg i;
		Synth(\sonido, [\freq,f[i%8], \dur,rrand(0.0,0.8), \amp,a.rand, \pan,1.0.rand2]);
		0.4.wait;
}};
Routine { var f=[74,75,77,79,80,82,84,86].midicps, a= [0.4,0.1,0.3,0.5,0.2] ;

	inf.do {arg i;
		Synth(\sonido, [\freq,f[i%8], \dur,rrand(0.1,0.3), \amp,a.rand, \pan,1.0.rand2]);
		1.wait;
}};
Routine { var f=[74,75,77,79,80,82,84,86].midicps, a= [0.2,0.1,0.3,0.5,0.4] ;

	inf.do {arg i;
		Synth(\sonido, [\freq,f[i%8], \dur,rrand(0.1,2.0), \amp,a.rand, \pan,1.0.rand2]);
		0.5.wait;
}};
Routine { var f=[74,75,77,79,80,82,84,86].midicps, a= [0.2,0.5,0.3,0.4,0.1] ;

	inf.do {arg i;
		Synth(\sonido, [\freq,f[i%8], \dur,rrand(0.1,0.6), \amp,a.rand, \pan,1.0.rand2]);
		0.3.wait;
}}.play
)



//////// Segundo intento

//Aquí descubrí que podía meter todas las rutinas en una rutina general instanciandolas en varianles, decidí añadir .scramble en la secuencia de sonido, seguí con mis variables de amplitud, cambie de octavas de las frecuencias y puse en cada rutina del \pan diferentes rangos de aleatoreidad.

// Las subrutinas generan capas musicales paralelas. La rutina contenedora organiza el tiempo global (inicio y fin).

(

Routine{

	var f=[74,75,77,79,80,82,84,86].midicps.scramble; //pongo el .scramble en la variable de frecuencia desde afuera para aplicarlas en todas las rutinas.
	var a = [0.2,0.1,0.3,0.5,0.1] ;
	var r1, r2, r3, r4, r5, r6;  // usé variables locales donde instanciaré cada rutina

	r1 = Routine {

		inf.do {|i|

			Synth(\sonido, [\freq,f[i%8]/2, \dur,rrand(0.0,1.0), \amp,a.rand, \pan, rrand (0.5, 1)]);
			0.5.wait;
	}}.play;

	r2 =Routine {

		inf.do {|i|
			Synth(\sonido, [\freq,f[i%8], \dur,rrand(0.0,1.0), \amp,a.rand, \pan, rrand (-0.5, 0)]);
			0.3.wait;
	}}.play;

	r3 =Routine {

		inf.do {arg i;
			Synth(\sonido, [\freq,f[i%8]/4, \dur,rrand(0.0,1.0), \amp,a.rand, \pan, rrand (-1, -0.5)]);
			2.wait;
	}}.play;
	r4 =Routine {

	inf.do {arg i;
			Synth(\sonido, [\freq,f[i%8], \dur,rrand(0.0,1.0), \amp,a.rand, \pan, rrand (0, 0.5)]);
		1.wait;
}}.play;
	r5 =Routine {

	inf.do {arg i;
		Synth(\sonido, [\freq,f[i%8]/8, \dur,rrand(0.0,1.0), \amp,a.rand, \pan,1.0.rand2]);
		0.5.wait;
}}.play;

	r6 =Routine {

	inf.do {arg i;
		Synth(\sonido, [\freq,f[i%8]/16, \dur,rrand(0.0,1.0), \amp,a.rand, \pan,0]);
		1.wait;
}}.play;

	60.wait; // aquí puse el 60.wait para que espera y luego se apaguen todas las rutinas
	[r1, r2, r3, r4, r5, r6].do{|i| i.stop} // aquí la i(índice) indica cada posición de las variables r1, r2, r3, r4, r5, r6, las cuales va aplicando el .stop
}.play
)

















