# ACE Arsenal Loadout

## 📌 Descripción General

El **Arma 3 - ACE Arsenal Loadout** es un compendio estructurado diseñado para estandarizar el equipamiento de los jugadores según su rol dentro de una misión multijugador.

Su objetivo principal es servir como referencia para editores de misiones, asegurando que cada jugador disponga del equipo necesario para desempeñar correctamente su función, evitando errores comunes como la falta de objetos críticos durante la partida.

Este compendio está orientado para la comunidad FEL milsim y sus creadores de misiones que buscan consistencia, eficiencia y calidad en sus configuraciones de equipamiento.

---

## 🎯 Objetivo

- Estandarizar el equipamiento por rol.
- Evitar errores humanos al asignar inventarios.
- Garantizar que cada rol tenga lo necesario para operar.
- Agilizar la creación de misiones en Eden Editor.
- Mantener coherencia entre múltiples misiones.

---

## 📦 Contenido del Compendio

Cada rol dentro de este compendio incluye dos elementos principales:

### 🧾 1. Lista de Equipamiento y Permisos ACE

Una lista detallada de los objetos y permisos ACE necesarios para el rol, que puede o no incluir:

- Armas principales y secundarias.
- Munición.
- Equipo de primeros auxilios.
- Equipo médico.
- Herramientas.
- Equipos de comunicación.
- Objetos específicos del rol (explosivos, designadores, etc.).
- Permisos ACE para rol (eod, ingeniero, medico, etc.).

### 💻 2. ACE Arsenal Loadout Code (Código de Inventario)

Cada rol incluye un **Loadout Code**, que corresponde a una exportación completa del inventario generada desde el ACE Arsenal.

Este código permite:

- Aplicar un equipamiento completo de forma instantánea.
- Copiar y pegar directamente en el editor Eden.
- Mantener consistencia entre jugadores y misiones.

## 🧠 Cómo Utilizarlo

### 1. Importar Loadout en el ACE Arsenal:

1. Copia el código ACE.
2. Edita el Loadout desde el ACE Arsenal.
3. Importa el Loadout en el ACE Arsenal.

<p align="center">
  <img width="800" height="450" alt="Ace_Arsenal" src="https://github.com/user-attachments/assets/9891702b-edfa-4626-a2f6-1c414fc888fd" />
</p>

### 2. Aplicar Loadout desde el `Init` de la unidad:

1. Selecciona la unidad.
2. Abre sus atributos.
3. Inserta el siguiente script en el campo `Init`:
```sqf
this setUnitLoadout ACE_CODE;
```
4. Sustituye **ACE_CODE** por el Loadout Code:
5. Guarda y prueba.

<p align="center">
  <img width="800" height="450" alt="ezgif-480a39fbc38a0827" src="https://github.com/user-attachments/assets/5638d40f-c2d5-421a-b3f9-f4f813e53c9a" />
</p>

### 3. Aplicar Loadouts desde un Objeto Interactivo.

#### Paso 1: Descargar y guardar archivo sqf del Loadout:
1. Descarga el código ACE.
2. Crea la carpeta `\loadouts` dentro de los archivos de tu misión.
3. Guarda el archivo del Loadout `loadouts\rifleman.sqf`.

#### Paso 2: Configurar el Objeto Interactivo:
1. Selecciona el objeto.
2. Abre sus atributos.
3. Inserta el siguiente script en el campo `Init` *(No olvides cambiar el nombre del archivo sqf)*.
```
this addAction [
    "<t color='#00FF00'>Colocar Equipo</t>",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];

        private _loadout = call compile preprocessFileLineNumbers "loadouts\rifleman.sqf";

        _caller setUnitLoadout _loadout;

        hint "Equipo colocado correctamente.";
    },
    nil,
    1.5,
    true,
    true,
    "",
    "alive _this && _this distance _target < 3"
];
```

<p align="center">
<img width="800" height="450" alt="archivo_sqf" src="https://github.com/user-attachments/assets/a12f46c9-07fe-4822-910d-b25c387452c4" />
</p>

## 🪖 Estructura de Roles

Cada rol sigue una estructura clara:

```
Nombre del Rol
├── Lista de Equipamiento
└── ACE Loadout Code
```

Ejemplo:

```
Médico
├── README.md
└── ace-arsenal-loadout_medic.sqf
```

## ⚠️ Consideraciones Importantes

- Los loadouts están diseñados para entornos multijugador.
- Algunos objetos requieren mods (ej. [KAT](https://steamcommunity.com/sharedfiles/filedetails/?id=2020940806), [IEDD](https://steamcommunity.com/sharedfiles/filedetails/?id=3048818056), [Task Force](https://steamcommunity.com/sharedfiles/filedetails/?id=894678801).
- Verifica compatibilidad con tu modset antes de usar.

## 🔧 Personalización

Este compendio está pensado como base. Puedes:

- Ajustar equipamiento según la misión.
- Adaptar loadouts a facciones específicas.
- Balancear peso y capacidad.
- Crear nuevos roles según tus necesidades.
