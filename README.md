# Auditoría Integral de Operaciones, Repuestos y Desguace Automotriz

## Contexto Organizacional

En el sector de compra y venta de vehículos usados, la rentabilidad no solo depende de cuantos carros se venden, sino de que se vende, a que precio y que se desguaza.

Este proyecto nace de la necesidad de un modelo de negocio hibrido de economia circular que opera en tres lineas comerciales estrategicas:

- Compra de carros usados (evaluando su destino optimo: reventa o desguace).
- Venta de carros usados (monitoreando modelos especificos según la demanda del mercado).
- Venta de piezas y repuestos (recuperacion de componentes provenientes de desguace).

El objetivo principal es identificar patrones de comportamiento en las operaciones, medir la rentabilidad por linea de negocio y detectar oportunidades criticas en la gestion de inventario y compras.

---

## Que resuelve este script

- **Analisis de Compras Anual y Mensual:** Mide el volumen exacto de carros comprados por mes y año, segmentado geograficamente por localidad.
- **Control de Desguace:** Identifica cuantos carros se adquieren especificamente para desguace y calcula el impacto porcentual que representan sobre el total de compras.
- **Rentabilidad por Linea de Negocio:** Calcula ingresos cruzados por venta de carros, venta de piezas y gastos por compras de vehiculos, obteniendo un margen bruto estimado en tiempo real.
- **Identificacion de Productos Estrella:** Responde de forma automatizada a preguntas clave de inventario:
  - Que piezas se venden mas y cuales generan mayores ingresos.
  - Que modelos de carros tienen mayor y menor rotacion en ventas.
  - Cual es la proporcion real de carros destinados a desguace vs. reventa directa.

---

## Plan de Accion Administrativo (Recomendaciones Estrategicas)

Basado en los KPIs generados por el script, se proponen tres acciones comerciales para optimizar la toma de decisiones:

1. **Priorizar Compra de Modelos de Alta Rotacion:** Al aislar los modelos mas vendidos, la empresa puede enfocar el capital de compra en esos vehiculos especificos, acelerando el flujo de caja y maximizando la liquidez.

2. **Optimizacion del Destino del Activo:** Monitorear la metrica `porcentaje_destino_desguace` permite evaluar el punto de equilibrio financiero para determinar si un vehiculo genera mayor retorno completo o desarmado por componentes.

3. **Estrategia de Precios Regionalizada:** Ajustar los stocks de piezas y los precios de lista según la demanda de cada localidad, optimizando la distribucion logistica intersucursal.

---

## Tecnologias y Estandar

- **Lenguaje:** ANSI SQL (Google BigQuery)
- **Conceptos clave aplicados:**
  - Common Table Expressions (`WITH` / CTE) para modularidad del codigo.
  - Agregaciones condicionales avanzadas (`SUM`, `CASE WHEN`).
  - Extraccion y manejo de componentes de tiempo (`EXTRACT`).
  - Prevencion de errores matematicos de division por cero (`NULLIF`).
  - Consolidacion de consultas mediante subconsultas y `UNION ALL`.

---

## Consultas Complementarias de Negocio

El script principal incluye tres modulos adicionales diseñados para responder preguntas analiticas especificas:

| Modulo | Indicador Clave de Rendimiento (KPI) | Objetivo de Negocio |
|--------|--------------------------------------|---------------------|
| Consulta A | Top 5 de Piezas Mas Vendidas | Identificar los repuestos con mayor demanda e ingresos generados. |
| Consulta B | Modelos de Carros (Maxima vs. Minima Venta) | Aislar los extremos de rotacion de inventario de vehiculos completos. |
| Consulta C | Distribucion Porcentual por Destino de Compra | Medir el volumen real que se dirige a desguace frente a reventa. |

---

## Autor

**Pedro Emmanuel Sanchez Noriega** - Analista de Datos

---

## Proximo paso sugerido

Segmentar el analisis por estacionalidad temporal (identificar meses historicos de mayor oferta en vehiculos usados) y por perfil de cliente (B2B concesionarios vs. B2C particulares), con el fin de ajustar las estrategias de adquisicion y campañas de marketing de manera predictiva.
