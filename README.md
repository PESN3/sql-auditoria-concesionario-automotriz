# Auditoría Integral de Operaciones, Repuestos y Desguace Automotriz

## 📌 Contexto Organizacional

En el sector de compra y venta de vehículos usados, la rentabilidad no solo depende de cuántos carros se venden, sino de **qué se vende, a qué precio y qué se desguaza**. Este proyecto nace de la necesidad de un modelo de negocio híbrido de economía circular que opera en tres líneas comerciales estratégicas:

1. **Compra de carros usados** (evaluando su destino óptimo: reventa o desguace).
2. **Venta de carros usados** (monitoreando modelos específicos según la demanda del mercado).
3. **Venta de piezas y repuestos** (recuperación de componentes provenientes de desguace).

El objetivo principal es identificar patrones de comportamiento en las operaciones, medir la rentabilidad por línea de negocio y detectar oportunidades críticas en la gestión de inventario y compras.

---

## 🎯 ¿Qué resuelve este script?

* **Análisis de Compras Anual y Mensual:** Mide el volumen exacto de carros comprados por mes y año, segmentado geográficamente por localidad.
* **Control de Desguace:** Identifica cuántos carros se adquieren específicamente para desguace y calcula el impacto porcentual que representan sobre el total de compras.
* **Rentabilidad por Línea de Negocio:** Calcula ingresos cruzados por venta de carros, venta de piezas y gastos por compras de vehículos, obteniendo un **margen bruto estimado** en tiempo real.
* **Identificación de Productos Estrella:** Responde de forma automatizada a preguntas clave de inventario:
  * ¿Qué piezas se venden más y cuáles generan mayores ingresos?
  * ¿Qué modelos de carros tienen mayor y menor rotación en ventas?
  * ¿Cuál es la proporción real de carros destinados a desguace vs. reventa directa?

---

## 💡 Plan de Acción Administrativo (Recomendaciones Estratégicas)

Basado en los KPIs generados por el script, se proponen tres acciones comerciales para optimizar la toma de decisiones:

1. **Priorizar Compra de Modelos de Alta Rotación:** Al aislar los modelos más vendidos, la empresa puede enfocar el capital de compra en esos vehículos específicos, acelerando el flujo de caja y maximizando la liquidez.
2. **Optimización del Destino del Activo:** Monitorear la métrica `porcentaje_destino_desguace` permite evaluar el punto de equilibrio financiero para determinar si un vehículo genera mayor retorno completo o desarmado por componentes.
3. **Estrategia de Precios Regionalizada:** Ajustar los stocks de piezas y los precios de lista según la demanda de cada localidad, optimizando la distribución logística intersucursal.

---

## 🛠️ Tecnologías y Estándar

* **Lenguaje:** ANSI SQL (Google BigQuery)
* **Conceptos clave aplicados:** * Common Table Expressions (`WITH` / CTE) para modularidad del código.
  * Agregaciones condicionales avanzadas (`SUM`, `CASE WHEN`).
  * Extracción y manejo de componentes de tiempo (`EXTRACT`).
  * Prevención de errores matemáticos de división por cero (`NULLIF`).
  * Consolidación de consultas mediante subconsultas y `UNION ALL`.

---

## 📊 Consultas Complementarias de Negocio

El script principal incluye tres módulos adicionales diseñados para responder preguntas analíticas específicas:

| Módulo | Indicador Clave de Rendimiento (KPI) | Objetivo de Negocio |
| :--- | :--- | :--- |
| **Consulta A** | Top 5 de Piezas Más Vendidas | Identificar los repuestos con mayor demanda e ingresos generados. |
| **Consulta B** | Modelos de Carros (Máxima vs. Mínima Venta) | Aislar los extremos de rotación de inventario de vehículos completos. |
| **Consulta C** | Distribución Porcentual por Destino de Compra | Medir el volumen real que se dirige a desguace frente a reventa. |

---

## 👤 Autor

**Pedro Emmanuel Sanchez Noriega** - Analista de Datos
*Especializado en análisis de comportamiento organizacional, control operativo, optimización de procesos y analítica de negocio (BI).*

---

## 🔍 Próximo paso sugerido

Segmentar el análisis por **estacionalidad temporal** (identificar meses históricos de mayor oferta en vehículos usados) y por **perfil de cliente** (B2B concesionarios vs. B2C particulares), con el fin de ajustar las estrategias de adquisición y campañas de marketing de manera predictiva.
