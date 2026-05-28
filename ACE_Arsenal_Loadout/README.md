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

## 🧠 Cómo Utilizarlo

### 1. Importar Loadout en el ACE Arsenal:

Este método es útil cuando el editor o jugador desea cargar el equipamiento manualmente desde el ACE Arsenal para revisar, modificar o guardar el loadout.

#### Pasos

1. Abre el archivo `.sqf` del rol que deseas utilizar. Ejemplo:
```txt
   ACE_Arsenal_Loadout/Rifleman/ace-arsenal-loadout_rifleman.sqf
```
2. Copia todo el contenido del archivo.
3. Dentro de Arma 3, abre el ACE Arsenal.
4. Selecciona la opción para importar loadout.
5. El equipamiento completo del rol será cargado automáticamente en el arsenal.

<p align="center">
  <img width="800" height="450" alt="Ace_Arsenal" src="https://github.com/user-attachments/assets/9891702b-edfa-4626-a2f6-1c414fc888fd" />
</p>

### 2. Aplicar Loadout desde el `Init` de la unidad:

Este método permite asignar el equipamiento directamente a una unidad colocada en Eden Editor. Es útil cuando se quiere que una unidad inicie la misión con un rol específico ya equipado.

#### Pasos

1. En Eden Editor, selecciona la unidad a la que deseas asignar el equipamiento.
2. Abre los atributos de la unidad.
3. Busca el campo `Init`.
4. Copia el código ACE del rol que deseas utilizar.
5. Inserta el siguiente comando en el campo `Init`:
```sqf
this setUnitLoadout ACE_CODE;
```
4. Sustituye `ACE_CODE` por el código completo del loadout.
5. Inicia la misión y verifica que la unidad aparezca con el equipamiento correcto.

<p align="center">
  <img width="800" height="450" alt="ezgif-480a39fbc38a0827" src="https://github.com/user-attachments/assets/5638d40f-c2d5-421a-b3f9-f4f813e53c9a" />
</p>

### 3. Aplicar Loadouts desde un Objeto Interactivo.

Este método permite que los jugadores se acerquen a un objeto dentro de la misión, como un casillero, caja, laptop, arsenal o locker, y seleccionen una opción para colocarse automáticamente el equipamiento de un rol.

#### Paso 1: Crear la carpeta de loadouts.
- Dentro de la carpeta de la misión, crea una carpeta llamada `\loadouts`.
- La estructura debería quedar similar a esto:
```
NombreDeLaMision.Mapa/
├── mission.sqm
└── loadouts/
```

#### Paso 2: Guardar el archivo `.sqf` del loadout.
- Descarga o crea el archivo `.sqf` del rol que deseas utilizar y guárdalo dentro de la carpeta `\loadouts`.
- El archivo debe contener únicamente el código ACE del loadout, sin comandos adicionales.

#### Paso 3: Configurar el objeto interactivo.
- En Eden Editor, coloca un objeto que funcionará como punto de equipamiento.
- Selecciona el objeto.
- Abre sus atributos.
- Busca el campo `Init`.
- Inserta el siguiente código:
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

#### Paso 4: Probar en misión.
- Guarda la misión.
- Inicia la misión en prueba local o servidor.
- Acércate al objeto configurado.
- Usa la rueda del mouse.
- Selecciona la opción:
```
Colocar Equipo
```
- El equipamiento completo será aplicado automáticamente al jugador que seleccionó la acción.

<p align="center">
<img width="800" height="450" alt="archivo_sqf" src="https://github.com/user-attachments/assets/a12f46c9-07fe-4822-910d-b25c387452c4" />
</p>

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
