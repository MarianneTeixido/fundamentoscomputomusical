//PARA REPRODUCIR HAY QUE HACER 3 PASOS: 1. EVALUAR LOS TIMBRES RANDOM, 2. AÑADIR LOS SYNDEF 3. EJECUTAR LA PIEZA

//Timbres Randoms

(
~amprandom1 = {
	var random = [];
	var resultado ;
	3.do({
		random = random.add(rrand(1,100));
	});
	resultado = (random.normalizeSum);
	resultado.sort.reverse;
};

~amprandom2 = {
	var random = [];
	var resultado ;
	4.do({
		random = random.add(rrand(1,100));
	});
	resultado = (random.normalizeSum);
	resultado.sort.reverse;
};

~amprandom3 = {
	var random = [];
	var resultado ;
	5.do({
		random = random.add(rrand(1,100));
	});
	resultado = (random.normalizeSum);
	resultado.sort.reverse;
};

~amprandom4 = {
	var random = [];
	var resultado ;
	6.do({
		random = random.add(rrand(1,100));
	});
	resultado = (random.normalizeSum);
	resultado.sort.reverse;
};

~amprandom5 = {
	var random = [];
	var resultado ;
	10.do({
		random = random.add(rrand(1,100));
	});
	resultado = (random.normalizeSum);
	resultado.sort.reverse;
};

~amprandom6 = {
	var random = [];
	var resultado ;
	20.do({
		random = random.add(rrand(1,100));
	});
	resultado = (random.normalizeSum);
	resultado.sort.reverse;
};
)

//_____________________________________________________//
// Synthdef//


(
SynthDef(\son1, {arg freq, dur, amp, pan;
	var signal, env;
	env = EnvGen.kr(Env.perc(dur), doneAction: Done.freeSelf);
	signal = SinOsc.ar(freq * [1,3,5], mul: ~amprandom1);
	Out.ar(0, Pan2.ar(((signal.sum * amp * env) / 6),pan));
}).add;


SynthDef(\son2, {arg freq, dur, amp, pan;
	var signal, env;
	env = EnvGen.kr(Env.perc(dur), doneAction: Done.freeSelf);
	signal = SinOsc.ar(freq * [1,2,4,8], mul: ~amprandom2);
	Out.ar(0, Pan2.ar(((signal.sum * amp * env) / 5),pan));
}).add;


SynthDef(\son3, {arg freq, dur, amp, pan;
	var signal, env;
	env = EnvGen.kr(Env.perc(dur), doneAction: Done.freeSelf);
	signal = SinOsc.ar(freq * [1,3,5,7,9], mul: ~amprandom3);
	Out.ar(0, Pan2.ar(((signal.sum * amp * env) / 6),pan));
}).add;


SynthDef(\son4, {arg freq, dur, amp, pan;
	var signal, env;
	env = EnvGen.kr(Env.perc(dur), doneAction: Done.freeSelf);
	signal = SinOsc.ar(freq * [1,2,4,8,10, 12], mul: ~amprandom4);
	Out.ar(0, Pan2.ar(((signal.sum * amp * env) / 6),pan));
}).add;


SynthDef(\son5, {arg freq, dur, amp, pan;
	var signal, env;
	env = EnvGen.kr(Env.perc(dur), doneAction: Done.freeSelf);
	signal = SinOsc.ar(freq * [1,2,3,4,5,6,7,8,9,10], mul: ~amprandom5);
	Out.ar(0, Pan2.ar(((signal.sum * amp * env) / 10),pan));
}).add;


SynthDef(\son6, {arg freq, dur, amp, pan;
	var signal, env;
	env = EnvGen.kr(Env.perc(dur), doneAction: Done.freeSelf);
	signal = SinOsc.ar(freq * [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20], mul: ~amprandom6);
	Out.ar(0, Pan2.ar(((signal.sum * amp* env) / 10),pan));
}).add;

)

//________________________________________________________________//
//Tarea "AL SONORO RUGIR"//


(
var notas = [60, 64,
	67, 67, 67, 67, 67, 69, 71,
	72, 67, 64, 64,
	62, 64, 64, 65, 67, 67,
	64, 60, 72, 72,

	71, 70, 70, 69, 68, 68,
	67, 72, 69, 71,
	72, 64, 65, 67, 65, 64, 62,
	60];

var durs  = [1.5, 0.5,
	2, 1.5, 0.5, 2, 2/3, 2/3, 2/3,
	4, 2, 1.5, 0.5,
	2, 1.5, 0.5, 2, 1.5, 0.5,
	2, 4, 1.5, 0.5,

	2, 1.5, 0.5, 2, 1.5, 0.5,
	2, 4, 1.5, 0.5,
	2, 1.5, 0.5, 2, 2/3, 2/3, 2/3,
	2];

var durrand1 = (durs/(3..5).choose);

var dursfast = (durs/10);

var dursultrafast = (durs/100);

//bajo

Routine({
    notas.size.do { |i|
        Synth(\son1, [
			\freq, (notas[i] - 36).midicps,
			\dur, durs[i],
			\amp, 0.4,
			\pan, rrand(-1.0,1.0)
        ]);
		durs[i].wait;
    };
}).play;

// rapido armonizado paneado

Routine({
	6.wait;
    notas.size.do { |i|
        Synth(\son2, [
			\freq, (notas[i] - rand(-24,24)).midicps,
			\dur, durrand1[i],
			\amp, rrand(0.05, 0.1)/2,
				\pan, -0.8,
        ]);
		durrand1[i].wait;
    };
}).play;


Routine({
	6.wait;
    notas.size.do { |i|
        Synth(\son3, [
			\freq, (notas[i] - rand(-24,24)).midicps,
			\dur, durrand1[i],
			\amp, rrand(0.05, 0.1)/2,
				\pan, -0.8,
        ]);
		durrand1[i].wait;
    };
}).play;

//rapido armonizado al otro lado

Routine({
	14.wait;
    notas.size.do { |i|
        Synth(\son4, [
			\freq, (notas[i] - rand(-24,24)).midicps,
			\dur, durrand1[i],
			\amp, rrand(0.1, 0.2)/2,
				\pan, 0.6,
        ]);
		durrand1[i].wait;
    };
}).play;


Routine({
	14.wait;
    notas.size.do { |i|
        Synth(\son5, [
			\freq, (notas[i] - rand(-24,24)).midicps,
			\dur, durrand1[i],
			\amp, rrand(0.1, 0.2)/2,
				\pan, 0.6,
        ]);
		durrand1[i].wait;
    };
}).play;

// melodía a la mitad

Routine({
	22.wait;
    notas.size.do { |i|
        Synth(\son6, [
			\freq, (notas[i] + 4).midicps,
			\dur, (durs[i]/2),
			\amp, 0.2,
				\pan, 0,
        ]);
		(durs[i]/2).wait;
    };
}).play;

Routine({
	22.wait;
    notas.size.do { |i|
        Synth(\son6, [
			\freq, (notas[i] + 7).midicps,
			\dur, (durs[i]/2.1),
			\amp, 0.4,
			\pan, rrand(-1.0, 1.0),
        ]);
		(durs[i]/2.1).wait;
    };
}).play;

// rapido 1


Routine({
	30.wait;
    notas.size.do { |i|
        Synth(\son1, [
			\freq, (notas[i] + 20).midicps,
			\dur, dursfast[i],
			\amp, 0.1,
				\pan, rrand(-1.0, 1.0),
        ]);
		dursfast[i].wait;
    };
}).play;

Routine({
	30.wait;
    notas.size.do { |i|
        Synth(\son1, [
			\freq, (notas[i] + 26).midicps,
			\dur, dursfast[i],
			\amp, 0.1,
			\pan, rrand(-1.0, 1.0),
        ]);
		dursfast[i].wait;
    };
}).play;

//ultrarapido

Routine({
	35.9.wait;
	30.do{
    notas.size.do { |i|
        Synth(\son1, [
			\freq, (notas[i] + 12).midicps,
			\dur, dursultrafast[i],
			\amp, rrand(0.01,0.05),
				\pan, rrand(-1.0, 1.0),
        ]);
		dursultrafast[i].wait;
    };
	};
}).play;

Routine({
	35.9.wait;
	30.do{
    notas.size.do { |i|
        Synth(\son1, [
			\freq, (notas[i] - 12).midicps,
			\dur, dursultrafast[i],
				\amp, rrand(0.01,0.05),
			\pan, rrand(-1.0, 1.0),
        ]);
		dursultrafast[i].wait;
    };
		};
}).play;


// rapido 2


Routine({
	40.wait;
	3.do{
    notas.size.do { |i|
        Synth(\son3, [
			\freq, (notas[i] + 20).midicps,
				\dur, dursfast[i],
			\amp, 0.1,
				\pan, 0,
        ]);
		dursfast[i].wait;
    };
	};
}).play;

Routine({
	40.wait;
	2.do{
    notas.size.do { |i|
        Synth(\son4, [
			\freq, (notas[i] + 24).midicps,
				\dur, dursfast[i],
			\amp, 0.1,
			\pan, rrand(-1.0, 1.0),
        ]);
		dursfast[i].wait;
    };
		};
}).play;

Routine({
	40.wait;
    notas.size.do { |i|
        Synth(\son5, [
			\freq, (notas[i] + 27).midicps,
			\dur, dursfast[i],
			\amp, 0.1,
			\pan, rrand(-1.0, 1.0),
        ]);
		dursfast[i].wait;
    };
}).play;


)

//_____________FIN___________________//

//¿Como controlar los niveles para que no sature cuando uno tiene tantos osciladores?



