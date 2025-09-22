
/*
-- Mali rutinas con glisandos */

(
SynthDef(\sineMove, { |freq = 440, targetFreq = 440, amp = 0.3, dur = 2|
    var env, osc1, osc2, osc3, glide, signal;

    env = EnvGen.kr(Env.perc(0.05, dur, 1), doneAction: 2);
    glide = Line.kr(freq, targetFreq, dur);
    osc1 = SinOsc.ar(glide * 0.995);
    osc2 = SinOsc.ar(glide);
    osc3 = SinOsc.ar(glide * 1.005);

    signal = (osc1 + osc2 + osc3) * (amp / 3);
	signal = signal * env;

    Out.ar(0, signal ! 2);
}).add;
)


(
SynthDef(\bassG, { |freq = 40, targetFreq = 60, amp = 0.5, dur = 1|
    var env, glide, signal;

    env = EnvGen.kr(Env.perc(0.01, dur), doneAction: 2);
    glide = Line.kr(freq, targetFreq, dur);
    signal = SinOsc.ar(glide) * amp * env;

    Out.ar(0, [signal, signal]);
}).add;
)

(
SynthDef(\synthStrings, { |freq = 440, amp = 0.3, dur = 2, targetFreq = 440|
    var env, glide, osc1, osc2, signal;

    env = EnvGen.kr(Env.perc(0.05, dur, 1, -4), doneAction: 2);
    glide = Line.kr(freq, targetFreq, dur);
    osc1 = Saw.ar(glide * 0.995);
    osc2 = Saw.ar(glide * 2.005);

    signal = (osc1 + osc2) * 0.5;
    signal = LPF.ar(signal, 1500);
    signal = signal * amp * env;

    Out.ar(0, signal ! 2);
}).add;
)



(
Routine({
    var x = 0;
    var step = 0.05;

    inf.do {
        var freqM, targetM, ampM, durM, panM;
        var freqB, targetB, ampB, durB, panB;
		var freqS, targetS, ampS, durS, panS;
        var baseWait, nudge;

        freqM = rrand(50, 80).midicps;
        targetM = rrand(30, 80).midicps;
        ampM = rrand(0.2, 0.4);
        durM = rrand(0.5, 2.5);

        freqB = rrand(31, 41).midicps;
        targetB = rrand(36, 50).midicps;
        ampB = rrand(0.3, 0.5);
        durB = rrand(1.0, 2.0);
        panB = rrand(-0.5, 0.5);

		freqS = rrand(71, 91).midicps;
        targetS = rrand(16, 90).midicps;
        ampS = rrand(0.3, 0.35);
        durS = rrand(0.5, 4.0);
        panS = rrand(-0.25, 0.25);

        Synth(\sineMove, [\freq, freqM, \targetFreq, targetM, \amp, ampM, \dur, durM, \pan, panM]);
        Synth(\bassG, [\freq, freqB, \targetFreq, targetB, \amp, ampB, \dur, durB, \pan, panB]);
		Synth(\synthStrings, [\freq, freqB, \targetFreq, targetB, \amp, ampB, \dur, durB, \pan, panB]);

        // Nudge o algo asi
        baseWait = 0.25;
        nudge = (exp(x)-1) * 0.5;
        (baseWait + nudge).wait;

		// actualizar x a 0
        x = (x + step).clip(0, 1);
        if (x >= 1, { x = 0; });
    }
}).play;
)



/* .clip(min, max)  asegura que un valor no salga de los límites
a = 5;
a = a.clip(1, 8); = 5 */
