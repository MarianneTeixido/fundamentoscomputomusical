
s.boot;

//TAREA DE NOHEMÍ RASCÓN



//Opción 1: Sinte Magic Music Box
SynthDef(\dark, { |freq = 440, amp = 0.3, dur = 1, env = 0.3|
    var sig, e;
    e = EnvGen.kr(Env.perc(0.01, env), doneAction: 2);
    sig = SinOsc.ar(freq, 0, amp) * e;
    Out.ar(0, Pan2.ar(sig * env / 6, 0));
}).add;


//Opción 2: Sinte Circense
SynthDef(\dark, {arg freq, dur, amp, pan;
	var signal, env;
	env = EnvGen.kr(Env.triangle(dur), doneAction: Done.freeSelf);
	signal = SinOsc.ar(freq * [1,2,3,4,5,6]);
	Out.ar(0, Pan2.ar(signal.sum * env / 6),pan);
}).add;




// Routine con 2 motifs

Routine({
    var motif1 = [65, 62, 65, 62, 65, 64, 61, 57].dup(2).flat;
	var motif2 = [57, 69, 69, 67, 67, 65, 65, 64, 61, 57].dup(2).flat;
    var duraciones  = [0.25, 0.5, 0.25, 0.5, 0.25, 0.5, 0.25, 0.5].dup(5).flat; //aqui tuve que ponerle 5 y no 4 en dup
	var motif = motif1 ++ motif2;
    var base = 0;

    motif.do { |nota|
        Synth(\dark, [
            \freq, nota.midicps,
            \amp, 0.4,
            \dur, duraciones[base],
            \env, rrand(0.05, 3.0),   // envolvente aleatorio
			\pan, 0
        ]);

0.5.wait;


        Synth(\dark, [
            \freq, (nota - 16).midicps, //con la tercera -4
            \amp, 0.4,
            \dur, duraciones[base+2],
            \env, rrand(0.05, 6.0),
			\pan, -0.6
        ]);
0.3.wait;

        Synth(\dark, [
            \freq, (nota +12).midicps,
            \amp, 0.4,
            \dur, duraciones[base+3],
            \env, rrand(0.05, 3.0),
			\pan, 0.6
        ]);
0.2.wait;

        base = base + 1;
    };
}).play;
)

s.scope

















