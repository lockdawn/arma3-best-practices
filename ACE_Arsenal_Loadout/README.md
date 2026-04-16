# ACE Arsenal Loadout

## 📌 Descripción General

El **Arma 3 Role Loadout Compendium** es un compendio estructurado diseñado para estandarizar el equipamiento de los jugadores según su rol dentro de una misión multijugador.

Su objetivo principal es servir como referencia para editores de misiones, asegurando que cada jugador disponga del equipo necesario para desempeñar correctamente su función, evitando errores comunes como la falta de objetos críticos durante la partida.

Este compendio está orientado a comunidades organizadas, grupos milsim y creadores de misiones que buscan consistencia, eficiencia y calidad en sus configuraciones de equipamiento.

---

## 🎯 Objetivo

- Estandarizar el equipamiento por rol
- Evitar errores humanos al asignar inventarios
- Garantizar que cada rol tenga lo necesario para operar
- Agilizar la creación de misiones en Eden Editor
- Mantener coherencia entre múltiples misiones

---

## 📦 Contenido del Compendio

Cada rol dentro de este compendio incluye dos elementos principales:

---

### 🧾 1. Lista de Equipamiento

Una lista detallada de los objetos necesarios para el rol, que puede incluir:

- Armas principales y secundarias
- Munición
- Equipo médico
- Herramientas
- Equipos de comunicación
- Objetos específicos del rol (explosivos, designadores, etc.)

---

### 💻 2. Loadout Code (Código de Inventario)

Cada rol incluye un **Loadout Code**, que corresponde a una exportación completa del inventario generada desde el Arsenal (ACE o Vanilla).

Este código permite:

- Aplicar un equipamiento completo de forma instantánea
- Copiar y pegar directamente en el editor Eden
- Mantener consistencia entre jugadores y misiones

#### Ejemplo de uso:

```sqf
this setUnitLoadout [...];
```

## 🧠 Cómo Utilizarlo

En Eden Editor

1. Selecciona la unidad
2. Abre el campo Init
3. Inserta el Loadout Code:

```sqf
this setUnitLoadout [...];
```

4. Guarda y prueba la misión

## 🪖 Estructura de Roles

Cada rol sigue una estructura clara:

```
Nombre del Rol
├── Lista de Equipamiento
└── Loadout Code
```

Ejemplo:

```
Médico
├── Vendas
├── Morfina
├── Epinefrina
├── Kit quirúrgico
└── Loadout Code
```

## ⚠️ Consideraciones Importantes

- Los loadouts están diseñados para entornos multijugador
- Algunos objetos requieren mods (ej. ACE)
- Verifica compatibilidad con tu modset antes de usar
- Evita mezclar sistemas incompatibles (ACE Medical vs Vanilla)

## 🔧 Personalización

Este compendio está pensado como base. Puedes:

- Ajustar equipamiento según la misión
- Adaptar loadouts a facciones específicas
- Balancear peso y capacidad
- Crear nuevos roles según tus necesidades
