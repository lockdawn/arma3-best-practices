# Configuración de CH View Distance (CHVD) en Arma 3

Este documento explica **qué hacen las variables de CHVD**, si es correcto configurarlas en `init.sqf`, y cuál es la **mejor práctica recomendada** para misiones multijugador (MP).

---

## 🔍 ¿Qué es CHVD?

**CH View Distance (CHVD)** es un mod que permite a cada jugador ajustar:

- Distancia de visión (View Distance)
- Distancia de renderizado de objetos (Object View Distance)
- Nivel de vegetación (Grass settings)

Estas configuraciones son *100% cliente*, es decir:  
👉 afectan solo al jugador, no al servidor ni a la simulación.

---

## 🔧 Variables principales de CHVD

### `CHVD_allowNoGrass`
Permite habilitar en el menú CHVD la opción de **sin pasto**.  
- `true` → el jugador puede elegir “No Grass”.  
- `false` → solo niveles estándar de vegetación.

### `CHVD_maxView`
Define la **distancia máxima de visión** (en metros) que el jugador puede seleccionar desde el menú CHVD.  
Si el slider se mueve más arriba, no podrá pasar este límite.

### `CHVD_maxObj`
Define la **distancia máxima de renderizado de objetos** (en metros).  
Afecta edificios, vehículos, unidades, etc.

---

## ❓ ¿Es correcto configurar CHVD en `init.sqf`?

Funcionar, **sí funciona**.  
Pero **no es recomendable**, especialmente en multijugador.

### ❌ Problemas de usar `init.sqf`
- `init.sqf` puede ejecutarse:
  - en servidor
  - en host
  - en clientes  
  Arma 3 es inconsistente y depende del contenido.
- Jugadores que entran tarde (JIP) *no reciben la configuración*.
- El servidor ejecuta variables que no necesita.
- Puede causar conflictos si otros scripts leen CHVD demasiado temprano.

### ✔ Para qué sirve realmente `init.sqf`
- Lógica global
- Scripts del servidor
- Condiciones generales de inicio

Pero **no** para configuraciones del jugador ni ajustes gráficos.

---

## 🟩 ¿Por qué usar `initPlayerLocal.sqf`?

`initPlayerLocal.sqf` se ejecuta:

- una vez por jugador
- siempre en su cliente
- también para jugadores que entran tarde (JIP)

Esto lo hace **el mejor lugar** para:

- configuraciones gráficas
- configuraciones de CHVD
- scripts de interfaz
- scripts locales del jugador

### ✔ Ventajas
- Se ejecuta solo en el cliente.
- No carga nada en el servidor.
- Asegura que todos los jugadores reciban la configuración.
- Compatible con JIP.
- Recomendado por los autores de CHVD.

---

## ⭐ Conclusión

### ✅ **La mejor práctica es mover las configuraciones CHVD a `initPlayerLocal.sqf`.**

Porque:

- CHVD es un sistema **local al jugador**.
- Evita que el servidor procese variables innecesarias.
- Funciona para jugadores que llegan tarde.
- Previene comportamientos inconsistentes.
- Es la forma más limpia y confiable.

---

## 🧩 Script recomendado (comentado)

Guárdalo en:  
**`initPlayerLocal.sqf`**

```sqf
/*
    Configuración de CH View Distance (CHVD)
    Se ejecuta en cada cliente al entrar en la misión.
*/

// Permite la opción de "sin pasto" en el menú de CHVD.
// true = el jugador puede seleccionar No Grass.
// false = solo niveles estándar de pasto.
CHVD_allowNoGrass = true;

// Distancia máxima de visión que el jugador puede configurar
// desde el menú CHVD (en metros).
CHVD_maxView = 7000;

// Distancia máxima de renderizado de objetos (en metros).
// Controla cuánto se muestran edificios, vehículos y unidades.
CHVD_maxObj = 7000;
