# Estándar de Estructura de Misión para Arma 3  

Se debe utilizar una **estructura uniforme, ordenada y profesional** para organizar misiones de Arma 3. El objetivo es evitar desorden, nombres inconsistentes y recursos tirados en la raíz, y ofrecer un estándar claro para cualquier editor.

---

# 1. Archivos “mágicos” reconocidos por Arma 3

Estos archivos, si existen **en la raíz de la misión**, el motor los ejecuta automáticamente en diferentes momentos.

## Inicialización del Servidor
| Archivo | Ejecución | Uso recomendado |
|--------|-----------|-----------------|
| **init.sqf** | Una vez por máquina (cliente/servidor) | Config global ligera (hoy se prefiere evitarlo y usar init específicos). |
| **initServer.sqf** | Solo en el servidor | IA, objetos globales, sistemas que deben correr en el host. |
| **initPlayerLocal.sqf** | En cada cliente, incluyendo JIP | HUDs, marcadores locales, acciones locales, efectos visuales/sonoros. |
| **initPlayerServer.sqf** | En el servidor, por cada jugador | Registros, whitelists, asignación de datos por jugador. |

## Eventos de jugador
| Archivo | Momento | Uso |
|--------|---------|-----|
| **onPlayerRespawn.sqf** | Cada respawn | Reaplicar loadout, reactivar scripts locales, acciones. |
| **onPlayerKilled.sqf** | Muerte del jugador | Logs, contadores, penalizaciones. |

## Configuración de la misión
| Archivo | Función |
|--------|---------|
| **description.ext** | Archivo central: sonidos, música, funciones, diálogos, params, respawn, briefing, etc. |
| **briefing.sqf** (legacy) | Briefing clásico, ahora reemplazado por `createDiaryRecord` o tareas BIS. |

---

# 2. Carpetas recomendadas (estándar FEL)

Arma 3 permite carpetas personalizadas, por lo que se recomienda un orden profesional, modular y fácil de entender.

## 2.1. Estructura sugerida
| Carpeta | Uso recomendado |
|---------|-----------------|
| **functions/** | Funciones registradas en `CfgFunctions`. Separar por cliente/servidor/común. |
| **scripts/** | Scripts sueltos ejecutados por triggers/objetos (`execVM`). |
| **images/** | Imágenes `.paa/.jpg/.png` para UI, briefing, loadscreens. Subcarpetas sugeridas. |
| **sounds/** | Sonidos `.ogg/.wss` organizados por categoría. |
| **music/** | Música usada en briefing, intro, radios. |
| **dialogs/** | Interfaces (HPP) y scripts de UI. |
| **cfg/** | Archivo de configuraciones incluidos en `description.ext`. |
| **loadouts/** | Loadouts por rol o script de equipamiento. |
| **modules/** | Sistemas completos organizados por carpetas (rescate, CHVD, baterías, etc.). |
| **docs/** | Documentación interna, referencias, notas del editor. |

---

# 3. Nomenclatura recomendada

## 3.1. Reglas generales
- **Minúsculas siempre.**
- Sin espacios, acentos ni “ñ”.
- Nombres cortos pero descriptivos.
- Usar `_` como separador.
- Evitar mezclar inglés/español.

## 3.2. Prefijos sugeridos
| Tipo | Prefijo | Ejemplo |
|------|---------|---------|
| Funciones | `fn_` | `fn_spawn_patrol.sqf` |
| Imágenes | `img_` | `img_brief_hostage.paa` |
| Sonidos | `snd_` | `snd_radio_incoming.ogg` |
| Música | `mus_` | `mus_theme_intro.ogg` |
| Funciones del clan | `fel_` | `fel_fn_setLoadout.sqf` |

---

# 4. Estructura recomendada de una misión

```text
MyMission.Map/
├─ mission.sqm
├─ description.ext
├─ initServer.sqf
├─ initPlayerLocal.sqf
├─ onPlayerRespawn.sqf
├─ cfg/
│  ├─ CfgFunctions.hpp
│  ├─ CfgSounds.hpp
│  └─ CfgDebriefing.hpp
├─ functions/
│  ├─ server/
│  │  ├─ fn_spawnPatrol.sqf
│  │  └─ fn_initObjectives.sqf
│  ├─ client/
│  │  ├─ fn_updateMarkers.sqf
│  │  └─ fn_initHud.sqf
│  └─ common/
│     └─ fn_shuffleArray.sqf
├─ scripts/
│  └─ ambient_fireworks.sqf
├─ images/
│  ├─ ui/
│  │  └─ img_ui_scoreboard.paa
│  ├─ briefing/
│  │  └─ img_brief_hostage_01.paa
│  └─ map/
│     └─ img_map_overview.paa
├─ sounds/
│  ├─ radio/
│  │  └─ snd_radio_incoming.ogg
│  └─ ambience/
│     └─ snd_amb_crowd.ogg
├─ music/
│  └─ mus_briefing_theme.ogg
├─ loadouts/
│  ├─ fn_setRifleman.sqf
│  └─ fn_setMedic.sqf
```

# 5. Archivos adicionales “oficiales” o recomendados

## Reconocidos por Arma 3
- `campaign.sqm` — Para campañas.
- `params.hpp` — Parámetros del lobby (incluido por `description.ext`).
- `defines.hpp` / `common.hpp` — Macros y estilos, usados en UI.
- Funciones con `preInit` / `postInit` en `CfgFunctions`.

## Importancia de description.ext

Este archivo define:

- CfgFunctions
  - [Arma 3: CfgFunctions](https://community.bistudio.com/wiki/Arma_3:_CfgFunctions)
- CfgSounds
  - [Arma 3: CfgSounds](https://community.bistudio.com/wiki/Description.ext#CfgSounds)
- CfgMusic
  - [Arma 3: CfgMusic](https://community.bistudio.com/wiki/Arma_3:_CfgMusic)
- CfgDebriefing
  - [Arma 3: CfgDebriefing](https://community.bistudio.com/wiki/Arma_3:_Debriefing#Debriefing)
- CfgRespawn
  - [Arma 3: CfgRespawn](https://community.bistudio.com/wiki/Arma_3:_Respawn)
- CfgTaskDescriptions
  - [Arma 3: CfgTaskDescriptions](https://community.bistudio.com/wiki/Arma_3:_Task_Framework)
- Dialogs (UI)
  - [Arma 3: Dialogs](https://community.bistudio.com/wiki/Arma:_GUI_Configuration)
- Overview / loadscreen
  - [Arma 3: Overview](https://community.bistudio.com/wiki/Arma_3:_Mission_Overview)

Se recomienda separar en `cfg/` para mantenerlo limpio.

# 6. Objetivo del estándar

Este estándar permite:

- Que cualquier editor entienda una misión sin confusiones.
- Evitar nombres inconsistentes, carpetas improvisadas y archivos en la raíz.
- Reutilizar módulos y funciones fácilmente.
- Mantener misiones limpias, estables y fáciles de debuggear.


