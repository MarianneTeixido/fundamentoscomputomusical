(
SynthDef(\bajo, {|freq = 440, amp = 0.2, dur = 0.5, out = 0|
	var sig, env;
	env = EnvGen.kr(Env.perc(releaseTime: dur), doneAction: Done.freeSelf);
	sig= SinOsc.ar(freq) * amp * env;
	Out.ar(out, sig);
}).add
)

(
SynthDef(\burbujas, {|freq = 440, amp = 0.2, dur = 0.5, out = 0|
	var sig, env;
	env = EnvGen.kr(Env.perc(releaseTime: dur), doneAction: Done.freeSelf);
	sig= SinOsc.ar(freq) * amp * env;
	Out.ar(out, sig);
}).add
)

(
SynthDef(\melo, {|freq = 440, amp = 0.2, dur = 0.5, out = 0|
	var sig, env;
	env = EnvGen.kr(Env.triangle(releaseTime: dur), doneAction: Done.freeSelf);
	sig= SinOsc.ar(freq) * amp * env;
	Out.ar(out, sig ! 2);
}).add
)
// agregar rrands o choose dentro de los argumentos cuando uno define un synth parece que no funciona ¿como meter un midicps dentro de la definición del synth?

Synth(\bajo, [\freq, 40.midicps, \amp, rrand(0.1,0.5), \dur, [0.25,0.5, 1].choose, \out, rand(2)]); //ya probé que funcionan los midicps, rrand y los choose como argumentos al llamar al sinte.

//BAJOS
(
(
Routine({
	160.do({
		var duracion = [0.25, 0.25, 0.25, 0.25, 0.5, 0.5, 1].choose;
		Synth(\bajo, [
			\freq, 36.midicps,
			\amp, rrand(0.2,0.5),
			\dur, duracion,
			\out, rand(2)
		]);
		duracion.wait;
	});
}).play;
);


// me imagino que debe haber una forma más elegante, pero puse más veces el 0.25 para que haya más posibilidad de que salgan corcheas

(
Routine({
	160.do({
		var duracion = [0.25, 0.25, 0.25, 0.25, 0.5, 0.5, 1].choose;
		Synth(\bajo, [
			\freq, [48,48,48,48,48, 48, 60, 60].choose.midicps,
			\amp, rrand(0.2,0.5),
			\dur, duracion,
			\out, rand(2)
		]);
		duracion.wait;
	});
}).play;
))



/// Definir variable global modosmayor, las notas clave estan repetidas

(
~modosmayor = [
    // 0 Lidio
    [48, 48, 50, 52, 54, 54, 54, 54, 55, 57, 59, 60, 60, 62, 64, 66, 66, 66, 66, 67, 69, 71, 72, 72],

    // 1 Jónico
    [48, 48, 50, 52, 53, 53, 55, 57, 59, 59, 60, 60,  62, 64, 65, 65, 67, 69, 71, 71, 72, 72],

    // 2 Mixolidio
    [48,48, 50, 52, 53, 55, 57, 58, 58, 58, 58, 60, 60,  62, 64, 65, 67, 69, 70,70, 70, 70, 72, 72],

    // 3 Dórico
    [48, 48, 50, 51, 51, 53, 55, 57, 57, 58, 60, 60, 62, 63, 63, 65, 67, 69, 69, 70, 72, 72],

    // 4 Eólico
    [48, 48, 50, 51, 53, 55, 56, 56, 58, 60, 60, 62, 63, 65, 67, 68,68, 70, 72, 72],

    // 5 Frigio
    [48, 48, 49, 49, 49, 49, 51, 53, 55, 56, 58, 60, 60, 61, 61, 61, 61, 63, 65, 67, 68, 70, 72],

    // 6 Locrio
    [48, 48, 49, 51, 53, 54, 54, 54, 54, 56, 58, 60, 60, 61, 63, 65, 66, 66, 66, 66, 68, 70, 72, 72]
];
)


// duración burbujitas
 ~durrapida = [0.0625, 0.125, 0.125, 0.25, 0.5]
 ~durlenta = [0.5, 1, 1, 2]


// Burbujitas y melodías por modos consecutivos

(
(
Routine({
	~modosmayor.do { |modo|
		modo.scramble.do {|nota|
		Synth(\burbujas, [
			\freq, nota.midicps,
			\dur, ~durrapida.choose,
			\amp, 0.3,
			\out, rand(2)
			]);
         ~durrapida.choose.wait;
	};
		4.wait;
	};
}).play;
);

(
Routine({
	~modosmayor.do { |modo|
		modo.scramble.do {|nota|
		Synth(\burbujas, [
			\freq, nota.midicps,
			\dur, ~durlenta.choose,
			\amp, 0.3,
			\out, rand(2)
			]);
         ~durrapida.choose.wait;
	};
		4.wait;
	};
}).play;
);

(
Routine({
	~modosmayor.do { |modo|
		modo.do {|nota| // ESTE VA A TOCAR LA ESCALA EN ORDEN
		Synth(\melo, [
			\freq, nota.midicps,
			\dur, ~durrapida.choose,
			\amp, 0.05,
			]);
         ~durrapida.choose.wait;
	};
		4.wait;
	};
}).play;
);

)

// burbujitas seleccionando modo manualmente

(
(
Routine({
	~modosmayor[1].scramble.do { |nota|
		Synth(\burbujas, [
			\freq, nota.midicps,
			\dur, ~durrapida.choose,
			\amp, 0.2,
			\out, rand(2)]);
         0.1.wait;
    };
}).play;
);

(
Routine({
	~modosmayor[1].scramble.do { |nota|
		Synth(\burbujas, [
			\freq, nota.midicps,
			\dur, ~durlenta.choose,
			\amp, 0.2,
			\out, rand(2)
		]);
        ~durrapida.choose.wait
    };
}).play;
)
)









