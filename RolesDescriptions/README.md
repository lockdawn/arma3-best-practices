# Guía de Organización de Slots - Arma 3

Este documento sirve como guía para editores de misiones de Arma 3 que deseen organizar la pantalla de Selección de Roles de forma profesional.

Utilizando el campo de descripción de las unidades, se logra una estructura jerárquica clara mediante el uso de nombres clave y separadores.

------------------------------------------------------------

## 🛠️ Guía de Implementación

Para configurar los slots correctamente en el Eden Editor, sigue estos pasos:

1. Identificar la Unidad  
   Selecciona el NPC que servirá como Slot de Jugador (Unidad Jugable).

2. Abrir Atributos  
   Haz doble clic sobre la unidad para abrir sus atributos.

3. Sección de Descripción  
   Localiza el campo de texto llamado "Descripción".

4. Asignar el Rol  
   Copia y pega el texto correspondiente del listado de abajo según la función que cumplirá esa unidad.

------------------------------------------------------------

## 📜 Configuración de Secciones

El sistema de organización se divide en 5 áreas operativas para las fuerzas de FEL.

**IMPORTANTE:** Solo copia la línea de texto del rol y pégala directamente en la descripción del slot.

------------------------------------------------------------

### 🔫 PHOBOS (Sección de Infantería de FEL - SIF)

El núcleo de la fuerza de asalto terrestre.

#### Mando de SIF
```
1: Tte. Joaco - Group Leader@PHOBOS
```

#### Equipo Alpha
```
1: Team Leader@PHOBOS - ALPHA
#: Combat Surgeon
```

#### Equipo Bravo
```
1: Team Leader@PHOBOS - BRAVO
```

#### Equipo Charlie
```
1: Team Leader@PHOBOS - CHARLIE
```
------------------------------------------------------------

### 🛡️ HAMMER (Equipo Blindado)

Personal especializado en la operación de tanques y vehículos de apoyo pesado.

```
1: Crew Chief@PHOBOS - HAMMER
2: Crew
3: Crew
```
------------------------------------------------------------

### 🚁 QUIMERA (Regimiento de Operaciones Aero Navales - ROAN)

Personal de vuelo encargado del transporte, extracción y apoyo aéreo cercano.

```
1: Raven - Pilot Leader@QUIMERA
2: Quetzal - Pilot
3: Phoenix - Pilot
4: Razgriz - Pilot
```
------------------------------------------------------------

### 💀 CARONTE (Brigada de Operaciones Especiales - BOEF)

Unidad de élite para misiones de infiltración, sabotaje y reconocimiento.

```
1: Cap. Chuky - Team Leader@CARONTE
2: Sniper
3: Combat Surgeon
4: Gunner (LMG)
5: Radio Operator
6: Explosive Specialist
```

#### ➕ Roles Adicionales (Extras)

Estos roles pueden añadirse a CARONTE según la necesidad de la misión:

```
#: JTAC
#: Grenadier
#: Missile Specialist (AT)
```
------------------------------------------------------------

### 👑 LIMA (Mando y Control)

Orientado al editor y administrador de la misión bajo el rol de Zeus.

```
1: Sgto. lock - Zeus@LIMA
```
