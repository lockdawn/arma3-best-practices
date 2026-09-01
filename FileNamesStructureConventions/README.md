# Estándar de Nombres de Archivos y Misiones para Arma 3

Se debe utilizar una **convención uniforme, portable y segura** para nombrar las carpetas de misión, archivos y recursos de Arma 3.

El objetivo principal es evitar problemas con **espacios, acentos, caracteres especiales, codificación de rutas, servidores dedicados, herramientas externas, repositorios y procesos de empaquetado**, sin limitar el uso correcto del español dentro del contenido visible de la misión.

---

# 1. Nombre de la carpeta / archivo de la misión

Esta es la regla más importante de este estándar.

Arma 3 almacena las misiones editables utilizando una carpeta cuyo nombre sigue la estructura:

```text
<NombreDeLaMision>.<WorldName>
```

Bohemia Interactive documenta este formato como:

```text
missionName.worldName
```

Por ejemplo:

```text
TopGun.abel
SpyGame.Chernarus
Domino.ProvingGrounds_PMC
```

El nombre que aparece antes del último punto corresponde al **nombre técnico de la misión**, mientras que el valor posterior corresponde al **nombre interno del mapa (`worldName`)**.

## 1.1. Convención obligatoria para este repositorio

Para el **nombre técnico de la misión**:

- **No utilizar acentos.**
- **No utilizar `ñ`.**
- **No utilizar espacios.**
- Utilizar `_` como separador entre palabras.
- Evitar caracteres especiales como:
  - `á é í ó ú`
  - `ñ`
  - `ü`
  - `!`
  - `?`
  - `#`
  - `%`
  - `&`
  - `(`
  - `)`
  - comillas
- Utilizar únicamente caracteres ASCII seguros:
  - `A-Z`
  - `a-z`
  - `0-9`
  - `_`
- Mantener el `worldName` exactamente como corresponde al mapa utilizado.

### Correcto

```text
Operacion_Oceano_Dificil.Kunduz
```

### Incorrecto

```text
Operación Océano Difícil.Kunduz
```

```text
Operación_Océano_Difícil.Kunduz
```

```text
Operacion Oceano Dificil.Kunduz
```

```text
Operación%20Océano%20Difícil.Kunduz
```

---

# 2. ¿Por qué no deben usarse acentos ni espacios en el nombre técnico?

Aunque Windows y versiones modernas de Arma 3 pueden manejar Unicode en muchos contextos, una misión puede pasar por diferentes componentes antes de ejecutarse:

- Eden Editor
- sistema de archivos
- servidor dedicado
- PBO
- Steam Workshop
- Git / GitHub
- scripts de despliegue
- herramientas de sincronización
- launchers
- servidores Linux
- paneles de administración
- URLs o almacenamiento en la nube

Los espacios y caracteres Unicode pueden ser transformados o escapados por algunas herramientas.

Por ejemplo, el texto:

```text
Operación Océano Difícil
```

en una ruta codificada como UTF-8/URL puede terminar representándose parcialmente como:

```text
Operaci%c3%b3n%20Oc%c3%a9ano%20Dif%c3%adcil
```

Donde:

```text
%c3%b3 = ó
%20     = espacio
```

Por esta razón, el estándar utiliza un **identificador técnico simple y portable** para la carpeta y el PBO de la misión.

> Esta restricción es una **buena práctica del repositorio**, no una afirmación de que Arma 3 prohíba todos los espacios o caracteres Unicode en los nombres de misión. Bohemia Interactive incluso documenta ejemplos de nombres técnicos con varios puntos. El estándar aquí definido es intencionalmente más estricto para maximizar compatibilidad y evitar problemas entre herramientas y plataformas.

---

# 3. Nombre técnico vs. nombre visible de la misión

El **nombre técnico** y el **nombre que verá el jugador** no tienen que ser iguales.

Para una misión llamada:

```text
Operación Océano Difícil
```

se utilizará:

| Tipo | Valor |
|------|-------|
| Nombre visible | `Operación Océano Difícil` |
| Nombre técnico | `Operacion_Oceano_Dificil` |
| Carpeta de misión | `Operacion_Oceano_Dificil.Kunduz` |
| PBO final | `Operacion_Oceano_Dificil.Kunduz.pbo` |

Esta separación permite conservar una presentación correcta en español sin introducir caracteres problemáticos en rutas o nombres de archivos.

---

# 4. Títulos dentro de Eden Editor

Dentro de **Eden Editor** sí se pueden utilizar:

- espacios;
- acentos;
- `ñ`;
- mayúsculas y minúsculas normales;
- texto natural en español.

Por lo tanto, el título visible de la misión debe escribirse correctamente:

```text
Operación Océano Difícil
```

y no:

```text
Operacion_Oceano_Dificil
```

El nombre técnico existe para el sistema de archivos; el nombre visible existe para los jugadores.

## Ejemplo

```text
Carpeta:
Operacion_Oceano_Dificil.Kunduz

Título visible en Eden:
Operación Océano Difícil
```

Bohemia Interactive diferencia conceptualmente el nombre del archivo/fuente de la misión del nombre amigable mostrado al usuario. Por ejemplo, `missionNameSource` obtiene información relacionada con el nombre de origen de la misión, mientras que `missionName` puede representar el nombre amigable mostrado en juego.

---

# 5. Texto dentro de `.sqf`, `.ext`, `.hpp`, `.txt`, `.xml`, etc.

Los **contenidos de los archivos** pueden utilizar texto normal en español cuando el formato correspondiente lo soporte.

Por ejemplo:

```sqf
hint "Operación Océano Difícil iniciada";
```

```sqf
systemChat "El helicóptero está listo para despegar.";
```

```cpp
onLoadName = "Operación Océano Difícil";
author = "Fuerzas Especiales Latinoamérica";
```

Esto incluye, entre otros:

- títulos;
- briefing;
- mensajes;
- diálogos;
- descripciones;
- nombres visibles;
- tareas;
- textos de interfaz;
- información del autor;
- strings de localización.

Arma 3 utiliza Unicode en sus strings modernos; la documentación de Bohemia Interactive indica soporte UTF-8 para Arma 3 desde la versión 1.56.

## Recomendación de codificación

Guardar archivos de texto como:

```text
UTF-8
```

Para `Stringtable.xml`, Bohemia Interactive especifica explícitamente que debe guardarse en **UTF-8** para que los caracteres internacionales se muestren correctamente.

---

# 6. El contenido puede llevar acentos; el nombre del archivo no

Se debe distinguir entre:

### Nombre físico del archivo

Utilizar nombres técnicos simples:

```text
briefing.sqf
radio_evacuacion.ogg
img_Operacion_Oceano_Dificil.paa
cfg_mission.hpp
```

### Contenido del archivo

Puede utilizar español correctamente:

```sqf
private _missionTitle = "Operación Océano Difícil";
private _message = "Evacuación completada";
```

### Evitar

```text
briefing Operación Océano Difícil.sqf
radio evacuación.ogg
imagen misión final.paa
```

Aunque ciertos sistemas podrían aceptar estos nombres, se reduce la portabilidad y aumenta la posibilidad de errores al construir rutas o mover la misión entre diferentes plataformas.

---

# 7. Archivos reconocidos automáticamente por Arma 3

Los archivos con nombres definidos por el motor **no deben renombrarse para ajustarlos a otra convención**.

Ejemplos:

```text
mission.sqm
description.ext
init.sqf
initServer.sqf
initPlayerLocal.sqf
initPlayerServer.sqf
onPlayerRespawn.sqf
onPlayerKilled.sqf
stringtable.xml
```

Estos nombres deben conservarse exactamente según el comportamiento esperado por Arma 3.

### Correcto

```text
initPlayerLocal.sqf
```

### Incorrecto

```text
init_player_local.sqf
```

No se debe modificar un nombre reservado por el motor únicamente para hacerlo coincidir con la convención de archivos personalizados.

---

# 8. Nomenclatura para archivos personalizados

Para archivos creados específicamente para la misión se recomienda:

- nombres en minúsculas;
- sin espacios;
- sin acentos;
- sin `ñ`;
- utilizar `_` como separador;
- utilizar nombres descriptivos;
- conservar la extensión real del archivo.

## Ejemplos

| Tipo | Correcto | Evitar |
|------|----------|--------|
| Script | `spawn_patrol.sqf` | `Spawn Patrulla.sqf` |
| Script | `evacuacion_rehenes.sqf` | `Evacuación Rehenes.sqf` |
| Imagen | `img_load_screen.paa` | `Imagen Pantalla Carga.paa` |
| Sonido | `snd_radio_incoming.ogg` | `Radio Entrante.ogg` |
| Música | `mus_intro_theme.ogg` | `Música Intro.ogg` |
| Config | `cfg_sounds.hpp` | `Configuración Sonidos.hpp` |
| Texto | `mission_notes.txt` | `Notas de Misión.txt` |

---

# 9. Prefijos recomendados

Cuando ayude a identificar rápidamente el propósito de un recurso, se pueden utilizar prefijos.

| Tipo | Prefijo | Ejemplo |
|------|---------|---------|
| Funciones | `fn_` | `fn_spawn_patrol.sqf` |
| Imágenes | `img_` | `img_load_screen.paa` |
| Sonidos | `snd_` | `snd_radio_incoming.ogg` |
| Música | `mus_` | `mus_intro_theme.ogg` |
| Configuración | `cfg_` | `cfg_sounds.hpp` |

No es necesario añadir un prefijo cuando el contexto ya es evidente o cuando Arma 3 requiere un nombre específico.

---

# 10. Carpetas personalizadas

Las mismas reglas aplican a las carpetas creadas dentro de la misión.

### Correcto

```text
functions/
scripts/
images/
sounds/
music/
loadouts/
mission_assets/
radio_messages/
```

### Evitar

```text
Imágenes/
Sonidos Misión/
Música Intro/
Scripts Operación/
```

Bohemia Interactive permite crear subcarpetas dentro de una misión. Mantener nombres simples facilita el uso de rutas desde SQF y archivos de configuración.

---

# 11. Rutas dentro de scripts

Las rutas deben ser consistentes y utilizar exactamente el mismo nombre definido en el sistema de archivos.

Ejemplo:

```sqf
[] execVM "scripts\evacuacion_rehenes.sqf";
```

```sqf
private _image = "images\img_load_screen.paa";
```

```sqf
private _sound = "sounds\radio\snd_extract_now.ogg";
```

Evitar depender de nombres con espacios o Unicode:

```sqf
[] execVM "Scripts Operación\Evacuación Rehenes.sqf";
```

La documentación oficial de `getMissionPath` muestra igualmente el uso de rutas relativas a la raíz de la misión para acceder a recursos.

---

# 12. Extensiones de archivo

Las extensiones deben mantenerse visibles y correctas.

Un error común en Windows es crear accidentalmente:

```text
description.ext.txt
```

en lugar de:

```text
description.ext
```

Bohemia Interactive advierte específicamente sobre este caso: `Description.ext.txt` no será reconocido como `Description.ext`.

Se recomienda habilitar en Windows:

```text
File name extensions
```

para verificar siempre la extensión real.

---

# 13. Mayúsculas y minúsculas

Para **archivos y carpetas personalizados** se recomienda utilizar minúsculas:

```text
scripts/
images/
functions/
spawn_patrol.sqf
radio_message.sqf
```

Esto mejora la consistencia y reduce problemas cuando una misión, mod o herramienta se utiliza en sistemas donde las rutas pueden ser sensibles a mayúsculas y minúsculas.

La documentación oficial de servidores dedicados de Arma 3 también advierte de problemas de *case sensitivity* en entornos Linux, particularmente con determinados mods.

## Excepciones

No modificar nombres reservados o convenciones técnicas existentes:

```text
initServer.sqf
initPlayerLocal.sqf
CfgFunctions.hpp
```

cuando el proyecto ya dependa de esos nombres.

---

# 14. Convención resumida

## Carpeta de misión

```text
<Nombre_Sin_Acentos_Y_Sin_Espacios>.<WorldName>
```

Ejemplo:

```text
Operacion_Oceano_Dificil.Kunduz
```

## Título visible

```text
Operación Océano Difícil
```

## Archivos personalizados

```text
minusculas_con_guion_bajo.ext
```

Ejemplo:

```text
evacuacion_rehenes.sqf
```

## Texto dentro de archivos

```text
Español normal, con espacios, acentos y ñ.
```

Ejemplo:

```sqf
hint "Operación Océano Difícil: evacuación completada.";
```

---

# 15. Ejemplo completo

```text
Operacion_Oceano_Dificil.Kunduz/
├─ mission.sqm
├─ description.ext
├─ initServer.sqf
├─ initPlayerLocal.sqf
├─ stringtable.xml
├─ cfg/
│  ├─ cfg_functions.hpp
│  └─ cfg_sounds.hpp
├─ functions/
│  ├─ fn_start_mission.sqf
│  └─ fn_complete_objective.sqf
├─ scripts/
│  ├─ evacuacion_rehenes.sqf
│  └─ control_radio.sqf
├─ images/
│  ├─ img_load_screen.paa
│  └─ img_map_overview.paa
└─ sounds/
   └─ radio/
      └─ snd_extract_now.ogg
```

Mientras que dentro de Eden o de los archivos de configuración:

```text
Operación Océano Difícil
```

---

# 16. Checklist antes de publicar una misión

Antes de subir una misión al repositorio, servidor o Workshop, validar:

- [ ] La carpeta utiliza el formato `<missionName>.<worldName>`.
- [ ] El nombre técnico de la misión no contiene espacios.
- [ ] El nombre técnico de la misión no contiene acentos.
- [ ] El nombre técnico de la misión no contiene `ñ`.
- [ ] Las palabras del nombre técnico están separadas con `_`.
- [ ] El `worldName` corresponde al terreno utilizado.
- [ ] Los archivos personalizados no contienen espacios ni caracteres especiales.
- [ ] Las carpetas personalizadas no contienen espacios ni caracteres especiales.
- [ ] Los nombres reservados por Arma 3 no fueron modificados.
- [ ] Los archivos de texto están guardados como UTF-8 cuando contienen caracteres internacionales.
- [ ] Las extensiones reales de los archivos están visibles y son correctas.
- [ ] El título visible de la misión utiliza ortografía normal: `Operación Océano Difícil`.
- [ ] El PBO final conserva el nombre técnico: `Operacion_Oceano_Dificil.Kunduz.pbo`.

---

# 17. Objetivo del estándar

Este estándar permite:

- Evitar nombres codificados o visualmente corruptos como `%20` o `%c3%b3`.
- Reducir problemas de compatibilidad entre Windows y Linux.
- Facilitar despliegues en servidores dedicados.
- Mantener rutas simples dentro de SQF.
- Evitar errores en scripts y configuraciones por nombres inconsistentes.
- Mantener el español correcto en todo el contenido visible para el jugador.
- Facilitar la colaboración mediante Git y GitHub.
- Mantener las misiones ordenadas, predecibles y fáciles de mantener.

---

# 18. Referencias oficiales

## Mission folder naming

Bohemia Interactive Community Wiki:

- [2D Editor: External — Mission Folder](https://community.bohemia.net/wiki/Mission_Editor:_External)

Documenta que las carpetas de misión utilizan la estructura:

```text
missionName.worldName
```

## Mission names

- [missionName](https://community.bohemia.net/wiki/missionName)
- [missionNameSource](https://community.bohemia.net/wiki/missionNameSource)
- [Arma 3: MP Mission Names](https://community.bohemia.net/wiki/Arma_3:_MP_Mission_Names)

## Unicode and strings

- [String](https://community.bohemia.net/wiki/String)
- [Stringtable.xml](https://community.bohemia.net/wiki/Stringtable.xml)

La documentación de `String` indica Unicode / UTF-8 para Arma 3 moderno, y `Stringtable.xml` requiere UTF-8 para representar correctamente caracteres internacionales.

## Mission paths

- [getMissionPath](https://community.bohemia.net/wiki/getMissionPath)

## File extensions and scripting

- [Introduction to Arma Scripting](https://community.bohemia.net/wiki/Scripting)

Incluye la advertencia oficial de que un archivo denominado accidentalmente `Description.ext.txt` no funciona como `Description.ext`.

## Dedicated server and case sensitivity

- [Arma 3: Dedicated Server](https://community.bohemia.net/wiki/Arma_3:_Dedicated_Server)

Incluye consideraciones sobre sensibilidad a mayúsculas y minúsculas en servidores Linux.

---

# 19. Regla final

Cuando exista duda, aplicar esta separación:

```text
Nombre técnico / filesystem:
Operacion_Oceano_Dificil.Kunduz
```

```text
Nombre visible / contenido:
Operación Océano Difícil
```

**Los nombres técnicos deben priorizar compatibilidad.  
Los textos visibles deben priorizar presentación y ortografía correcta.**
