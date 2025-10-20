(
SynthDef(\tono, {arg freq = 440, dur = 1, amp = 0.5;
	var signal;
	var env;
	env = EnvGen.kr(Env.perc(releaseTime: dur), doneAction: 2);
	signal = SinOsc.ar(freq, mul: amp);
	Out.ar(0, Pan2.ar(signal * env));
}).add
)

(
var window, boton, arInt, nomInter;
var nDifu;
var pausa = 0;
nDifu = 3;
arInt = [4,7,12,5,3,6,11,2,0,1,8,9,10];
nomInter = ["3M", "5J", "Oc", "4J", "3m", "Tr", "7M", "2M", "Un", "2m", "6m", "6M", "7m"];

window = Window(\entrenado, Rect(300,400, 800,400)).front;
boton = Button(window, Rect(0,0,50,50));
boton.string = "Intervalo";
boton.action = {
	var fs1, fs2, intervalo;
	"intervalo".postln;
	fs1 = rrand(60,72);
	intervalo = arInt[0..(nDifu -1)].choose;
	fs2 = fs1 + intervalo;
	Routine({
		Synth(\tono, [\freq, fs1.midicps]);
		pausa.wait;
		Synth(\tono, [\freq, fs2.midicps]);
	}).play;
	intervalo.postln;
};

nomInter.do({arg texto, contador;
	var bTmp = Button(window, Rect(contador * 60 + 10, 60, 50, 50));
	bTmp.string = texto;
	contador.postln;
	bTmp.action = {
		"revisar que soy el bueno!".postln;
	};
});
)


