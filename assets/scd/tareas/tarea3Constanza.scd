

TAREA 3


///// Synth 1

(
SynthDef(\prueba_2, {|freq= 450, amp= 0.5|
var sig, env;
	env= EnvGen.kr(Env.perc(0.05,0.5),doneAction:Done.freeSelf);
    sig = SinOsc.ar(freq) * amp * env;
Out.ar(0,sig!2);
}).add;
)




(
Routine({
    inf.do {
		var notas= [60,61,62,63,64,65,66,67];
        Synth(\prueba_2, [\freq, notas.choose.midicps, \amp, rrand(0.2, 0.9)]);
		(0.03).wait;
    }
}).play;
)




////// Synth 2


(
SynthDef(\prueba, {|freq= 440, amp= 0.5, dur=1.0|
    var sig, env;
    env = EnvGen.kr(Env.perc(0.01, dur), doneAction: Done.freeSelf); // env con duración variable
    sig = SinOsc.ar(freq) * amp * env;
    Out.ar(0, sig!2); // estéreo
}).add;
)

(
Routine({
    inf.do {
        var notas = (56..80).choose;
        var durNota = rrand(0.5, 2.0);
        var pausa = rrand(0.1, 1.0);

        Synth(\prueba, [\freq, notas.midicps,\amp, rrand(0.1, 0.5) \dur, durNota]);

		pausa.wait;
    }
}).play;
)


////// Synth 3


(
SynthDef(\prueba2, {|freq= 440, amp= 0.5|
var sig, env;
	env= EnvGen.kr(Env.perc(3,2),doneAction:Done.freeSelf);
    sig = SinOsc.ar(freq) * amp * env;
Out.ar(0, sig);
}).add;
)




(
Routine({
    inf.do {
        var notas = (56..80).choose;
        Synth(\prueba2, [\freq, notas.midicps,\amp, rrand(0.1, 0.5)]);
		(3.0).wait;
    }
}).play;
)


















