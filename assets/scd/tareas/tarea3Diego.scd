s.boot;
(
// toca una senoidal durante el numero de periodos especificados.
SynthDef(\sini,
	{
		|freq=300, periods=300|
		var period = 1/freq;
		var atk = period/100; // esto parece que no funciona tan bien como se esperaría (i.e. se escuchan "clips", parece que el mínimo son ~2 periodos)
		var dur = (period*periods)-(2*atk);
		var env = EnvGen.kr(Env([0, 1 ,1 ,0], [atk, dur, atk]), doneAction: Done.freeSelf);
		Out.ar(0, (SinOsc.ar(freq) * 0.5 * env)!2);
}).add;
)

(
// arpegio de acorde mayor, 6 octavas a partir de midi 36
var notes = (36+(12*(0..6)))
.collect(_+[0, 4, 7])
.flatten;
var periodLengths = (1..15)*2; // 2 a 30 periodos, por pasos de 2
Routine({
	periodLengths.do({|periods|
		("==== periods"+periods+"====").postln;
		notes.do({|note|
			var freq = note.midicps;
			("note/freq:" + note+ "/" + freq).postln;
			Synth(\sini, [\freq, freq, \periods, periods]);
			0.5.wait;
		});
	});
}).play;
)

