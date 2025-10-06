
//Hacer una pieza con routinas al estilo Nancarrow, 6 rutinas, cada rutina ejecuta el mismo motivo en tiempos diferentes, modificando el synthef de las clase multiplicando la amplitud con un arreglo. El elejerciio debe durar menos de 1 minuto y un máximo de 6 señales.

// HOMENAJE a NANCARROW

                        //Variable global para usar en todo el ejercicio
(
~altura = 220;
)

                                           // Aquí se añade el sinte.

/*Dejé una siinusoide simple y añadí velocidad de ataque igual a la velocidad de release, esto con el objetivo de
generar la riqueza tímbrica solo con el empalme de señales. */

(
SynthDef (\pianola, {arg freq = ~altura , dur, amp, out;
	var senal, env, altura;
	env = EnvGen.kr(Env.perc (attackTime: dur, releaseTime: dur), doneAction: Done.freeSelf);
	senal = SinOsc.ar (freq);
	Out.ar (out, (senal * env / 4))}).add;

)

                                               //Sinte sin rutina, para probar.
(
Synth (\pianola, [\freq, ~altura * 2, \amp, 0.1, \dur, 1, \out, 1])
)



);
                                                //Seis rutinas

(

Routine ({
	15.do({
		Synth(\pianola,[\freq, ~altura, \amp, 0.1, \dur,2,\out, 0]);
		2.wait;
		2.wait;
					});
}).play;


Routine ({
30.do ({
		Synth(\pianola,[\freq, ~altura * 2 , \amp, 0.9, \dur,1,\out, 1]);
		1.wait;
		1.wait;
			});
}).play;

Routine ({
60.do ({
		Synth(\pianola,[\freq, ~altura * 3 , \amp, 0.07, \dur,0.5,\out, 0]);
	0.5.wait;
	0.5.wait;
			});
}).play;


Routine ({
120.do ({
		Synth(\pianola,[\freq, ~altura * 5 , \amp, 0.05, \dur, 0.25,\out, 1]);
	0.25.wait;
	0.25.wait;
			});
}).play;

Routine ({
	240.do ({
		Synth(\pianola,[\freq, ~altura * 7, \amp, 0.025, \dur,0.125,\out, 0]);
	   0.125.wait;
	   0.125.wait;
			});
}).play;

Routine ({
	480.do ({
		Synth(\pianola,[\freq, ~altura * 11, \amp, 0.015, \dur,0.062,\out, 1]);
	   0.062.wait;
	   0.062.wait;
			});
}).play;

);
s.scope
// LA TAREA ESTÁ INCOMPLETA PUESTO QUE NO ENCONTRÉ LA MANERA DE TRABAJAR CON LAS AMPLITUDES MEDIANTE LA MULTIPLICACIÓN POR UN ARREGLO, QUE ERA UNO DE LOS OBJETIVOS DE LA TAREA. EL CONFLICTO  QUE ENCUENTRO ES QUE LA AMPLITUD GENERAL ESTÁ DETERMINADA POR LA ENVOLVENTE, Y ESTA SE ESPECIFICA EN EL OUT DEL SYNTHDEF, POR LO QUE QUEDA FIJA. EN MI LÓGICA PIENSO QUE DEBERÍA ENTONCES DETERMINARSE DENTRO DE LA ROUTINE,DE ESTA MANERA PODRÍA INCLUSO CAMBIAR EN EL TIEMPO, HACER CRESCENDOS Y DIMINUENDOS, PERONO ME FUNCIONA.

//ASÍ MISMO OBSERVO QUE NO HE ENTENDIDO EL CONCEPTO DE PAN2, PUESTO QUE LOS PANEOS LOS DEJÉ FIJOS CON EL OUT, Y AUNQUE REVISÉ LA DOCUMENTACIÓN, AUN NO COMPRENDO CÓMO ENVIAR SEÑALES AL CANAL DERECHO O IZQUIERDO O HACER BALANCES.

//AQUÍ EL INTENTO QUE HICE POR MODIFICAR LA ENVOLVENTE DE AMPLITUD DENTRO DE LA ROUTINE.

(
Routine ({
	6.do ({
	var amplitud = 0.1;
	var exponencial = 2;

	var sintetizador =
	                SynthDef (\pianola, {arg freq = 55, dur, amp, pan;
		           var senal, env, altura;
	    env = EnvGen.kr(Env.perc (attackTime: dur, level: amplitud, releaseTime: dur), doneAction: Done.freeSelf);
		senal = SinOsc.ar (~altura) * env;
		Out.ar ([0], senal)}).add;
	var fundamental = Synth (\pianola, [\freq, ~altura, \dur, 2, \pan, 1]);

	fundamental;
	2.wait;
	amplitud = amplitud * exponencial;

});
}).play
)
s.scope


(
var tiempo = Routine({
	var factor1 = 3, factor2 = 4, exponencial = 2, base = factor1 * factor2;
	10.do{
		postln(base);
		2.wait;
		base = base ** exponencial;
			}
});
tiempo.play;
)

