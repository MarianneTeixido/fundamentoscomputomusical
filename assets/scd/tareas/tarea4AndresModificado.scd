//PARA REPRODUCIR HAY QUE HACER 3 PASOS: 1. EVALUAR LOS TIMBRES RANDOM, 2. AÑADIR LOS SYNDEF 3. EJECUTAR LA PIEZA

//Timbres Randoms

(
~amprandomfull = {arg cant;
	var random = [];
	var resultado ;
	.do({
		random = random.add(rrand(1,100));
	});
	resultado = (random.normalizeSum);
	resultado.sort.reverse;
};
)

)

~generadoSinte = {arg nom, arrArm;
	SynthDef(nom, {arg freq, dur, amp, pan;
	var signal, env;
	env = EnvGen.kr(Env.perc(dur), doneAction: Done.freeSelf);
		signal = SinOsc.ar(freq * arrArm, mul: ~amprandom.(arrArm.size));
	Out.ar(0, Pan2.ar((signal.sum * amp* env / 10),pan));
}).add;
}

~generadoSinte.(\ar3, [1,2,3])
~generadoSinte.(\ar4, [1,2,5,7])
~generadoSinte.(\ar8, (1..8))
~generadoSinte.(\ar20, (1.20))


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

~generadoMotivo = {arg pausaInicial, sinte, trans, vel, sirand;
Routine({
	pausaInicial.wait;
    notas.size.do { |i|
        Synth(sinte, [
			\freq, if(sirand, {(notas[i] + trans).midicps}, {rrand(60,72)}),
			\dur, durs[i] * vel,
			\amp, 0.1,
			\pan, rrand(-1.0, 1.0),
        ]);
		durs[i] * vel.wait;
    };
}).play;
}

(
~generadoMotivo.(0, \arm4, 0, 1, false)
~generadoMotivo.(6, \arm4, 0, 1/100, false)
~generadoMotivo.(12, \arm20, 12, 1/3, true)
)

)

//_____________FIN___________________//

//¿Como controlar los niveles para que no sature cuando uno tiene tantos osciladores?



