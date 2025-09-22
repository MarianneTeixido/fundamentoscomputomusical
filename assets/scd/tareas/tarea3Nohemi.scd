
(
SynthDef(\organo, { |freq = 440, amp = 0.6, dur = 0.5|
    var env, signal;
    env = EnvGen.kr(Env.perc(releaseTime: dur), doneAction: Done.freeSelf);
    signal = SinOsc.ar(freq) * amp * env;
    Out.ar(0, signal);
}).add;

//Feliz cumpleaños a ti

(
Routine({
    var cumpleNotas = [67, 67, 67, 69, 67, 72, 71];
    var duracionesMexaSwing = [0.34, 0.34, 0.34, 0.8, 0.8, 0.8, 2.0];
    var base = 0;

    cumpleNotas.do { |nota|
        Synth(\organo, [\freq, nota.midicps, \amp, 0.4, \dur, duracionesMexaSwing[base]]);
        duracionesMexaSwing[base].wait;
        base = base + 1;
    };
}).play;
)
/// Feliz cumpleaños, 3 octavs a la vez
(
Routine({
    var cumpleNotas = [67, 67, 67, 69, 67, 72, 71];
    var duracionesMexaSwing = [0.34, 0.34, 0.34, 0.8, 0.8, 0.8, 2.0];
    var base = 0;

    cumpleNotas.do { |nota|
        Synth(\organo, [\freq, nota.midicps, \amp, 0.4, \dur, duracionesMexaSwing[base]]);
        Synth(\organo, [\freq, (nota - 12).midicps, \amp, 0.4, \dur, duracionesMexaSwing[base]]);
        Synth(\organo, [\freq, (nota + 12).midicps, \amp, 0.4, \dur, duracionesMexaSwing[base]]);

        duracionesMexaSwing[base].wait;
        base = base + 1;
    };
}).play;

)























