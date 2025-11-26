/*
  Crea el briefing / diario de misión.
*/

execVM "scripts\diary.sqf";

/*
    Remueve las gafas del jugador local al iniciar la misión.
*/

removeGoggles player;

/*
    Configuración de CH View Distance (CHVD)
*/

// Permitir la opción de "sin pasto" en el menú de CHVD.
// true = el jugador puede seleccionar No Grass.
// false = solo niveles de pasto estándar.
CHVD_allowNoGrass = true; 

// Distancia máxima de visión (en metros) que el jugador
// puede configurar usando el menú de CHVD.
// Aunque el jugador suba el slider, no podrá pasar de este valor.
CHVD_maxView = 7000; 

// Distancia máxima a la que se renderizan objetos (en metros)
// a través de CHVD. Limita el slider de "Object View Distance".
CHVD_maxObj = 7000;
