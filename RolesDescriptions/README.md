# Guía de Organización de Slots - Arma 3

Este documento sirve como guía para editores de misiones de Arma 3 que deseen organizar la pantalla de Selección de Roles de forma profesional.

Utilizando el campo de descripción de las unidades, se logra una estructura jerárquica clara mediante el uso de nombres clave y separadores.

------------------------------------------------------------

🛠️ Guía de Implementación

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

📜 Configuración de Secciones

El sistema de organización se divide en 5 áreas operativas para las fuerzas de FEL.

IMPORTANTE:
Solo copia la línea de texto después del rol y pégala directamente en la descripción del slot.

------------------------------------------------------------

👑 LIMA (Mando y Control)

Orientado al editor y administrador de la misión bajo el rol de Zeus.
```
Sgto. lock - Zeus@LIMA
```
------------------------------------------------------------

🔫 PHOBOS (Sección de Infantería de FEL - SIF)

El núcleo de la fuerza de asalto terrestre.
```
Tte. Joaco - Group Leader@PHOBOS
Team Leader@PHOBOS - ALPHA
Combat Surgeon
Team Leader@PHOBOS - BRAVO
Team Leader@PHOBOS - CHARLIE
```
------------------------------------------------------------

🛡️ HAMMER (Equipo Blindado)

Personal especializado en la operación de tanques y vehículos de apoyo pesado.

Crew Chief@PHOBOS - HAMMER

------------------------------------------------------------

🚁 QUIMERA (Regimiento de Operaciones Aero Navales - ROAN)

Personal de vuelo encargado del transporte, extracción y apoyo aéreo cercano.
```
Raven - Pilot Leader@QUIMERA
Quetzal - Pilot
Phoenix - Pilot
Razgriz - Pilot
```
------------------------------------------------------------

💀 CARONTE (Brigada de Operaciones Especiales - BOEF)

Unidad de élite para misiones de infiltración, sabotaje y reconocimiento.
```
Cap. Chuky - Team Leader@CARONTE
Sniper
Combat Surgeon
Gunner (LMG)
JTAC
Explosive Specialist
```
------------------------------------------------------------

➕ Roles Adicionales (Especialistas)

Estos roles pueden añadirse a cualquiera de las escuadras anteriores según la necesidad de la misión:
```
Grenadier
Missile Specialist (AT)
```
