# Arma 3 – Best Practices (Eden Editor & Mission Framework)

Este repositorio reúne **buenas prácticas, configuraciones recomendadas y guías técnicas** para crear misiones de alta calidad en **Arma 3**, con énfasis en:

- Rendimiento (server & cliente)
- Compatibilidad multijugador (MP/Dedicated)
- Correcto uso del Eden Editor
- Buenas prácticas de scripting (SQF)
- Modularidad y organización de archivos

Está diseñado para apoyar a **editores de misión**, **scripters** y **unidades/clanes** que buscan estandarizar su forma de trabajar y evitar errores comunes.

---

## Estructura del repositorio

```txt
arma3-best-practices/
│
├── CH-ViewDistance/
│   ├── initPlayerLocal.sqf 
│   └── README.md
├── MissionStructureConventions/
│   ├── MyMission.Map/
│   └── README.md
└── README.md                 # Este documento (root)
```

Cada carpeta del repositorio representa un módulo, sistema o tema técnico, y contiene:

- Archivos de ejemplo listos para usar
- Configuraciones recomendadas
- Explicación de por qué y cuándo aplicarlas
- Advertencias sobre malas prácticas
- Scripts mínimos o plantillas para integración rápida

Este formato permite que cualquier creador de misiones revise **módulo por módulo** si está siguiendo las prácticas adecuadas.

## Objetivo del repositorio

El propósito principal es:

- Estandarizar la creación de misiones dentro de comunidades de Arma 3.
- Evitar fallos causados por configuraciones incorrectas (especialmente en MP).
- Aumentar el rendimiento de misiones complejas.
- Proveer ejemplos listos para copiar/pegar, con comentarios incluidos.
- Centralizar conocimiento que normalmente solo se aprende con experiencia.

Este repositorio funciona como una guía técnica oficial para editores de ARMA 3.

## ¿Quién debería usar este repositorio?

- Editores de misión de Arma 3
- Personas que quieren aprender Eden Editor más a fondo
- Equipos de desarrollo de misiones que buscan un estándar de calidad
- Servidores comunitarios y privados
- Scripters que desean buenas prácticas y plantillas

## Contribuciones

Este repositorio está pensado para crecer, por lo que puedes:

- Sugerir mejoras
- Enviar más prácticas recomendadas
- Agregar plantillas o ejemplos
- Reportar problemas o dudas

Si quieres que agregue nuevos módulos o guías, puedes abrir un issue o enviarme la propuesta.
