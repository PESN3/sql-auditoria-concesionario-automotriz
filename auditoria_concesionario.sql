-- ====================================================================
-- SCRIPT 2: Auditoría Integral de Operaciones, Repuestos y Desguace Automotriz
-- OBJETIVO: Analizar tendencias de compra/venta, piezas más demandadas y volumen de desguace.
-- DESARROLLADOR: Pedro Enmanuel Sanchez Noriega (Analista de Datos)
-- PROPIEDAD: Portafolio Único - Concesionario de Segunda Mano y Reciclaje
-- ====================================================================

WITH MetricasGenerales AS (
    SELECT
        -- 1. Análisis de Compras de Carros (Anual y Mensual)
        EXTRACT(YEAR FROM fecha) AS anio,
        EXTRACT(MONTH FROM fecha) AS mes,
        localidad,
        
        -- Total de carros comprados por la empresa
        COUNT(CASE WHEN tipo_operacion = 'Compra Carro' THEN 1 END) AS total_carros_comprados,
        
        -- Cuántos carros se compran específicamente para desguace
        COUNT(CASE WHEN tipo_operacion = 'Compra Carro' AND destino_carro = 'Desguace' THEN 1 END) AS compras_para_desguace,
        
        -- Total de transacciones generales en el mes/año
        COUNT(*) AS transacciones_totales,
        
        -- 📊 ANÁLISIS DE RENTABILIDAD
        SUM(CASE WHEN tipo_operacion = 'Venta Carro' THEN precio_venta ELSE 0 END) AS ingresos_ventas_carros,
        SUM(CASE WHEN tipo_operacion = 'Venta Pieza' THEN precio_venta ELSE 0 END) AS ingresos_ventas_piezas,
        SUM(CASE WHEN tipo_operacion = 'Compra Carro' THEN precio_compra ELSE 0 END) AS gastos_compras_carros
        
    FROM 
        `proyecto-tablas-dinamicas.operaciones.operaciones_concesionario`
    GROUP BY 
        1, 2, 3
)

-- Consulta Final: Consolidación de Indicadores Clave de Rendimiento (KPIs)
SELECT 
    anio,
    mes,
    localidad,
    total_carros_comprados,
    compras_para_desguace,
    
    -- % de carros comprados mensualmente respecto al volumen total de operaciones
    ROUND((total_carros_comprados * 100.0) / transacciones_totales, 1) AS porcentaje_compras_mensual,
    
    -- Métrica Pro: Rendimiento del Desguace
    ROUND((compras_para_desguace * 100.0) / NULLIF(total_carros_comprados, 0), 1) AS porcentaje_destino_desguace,
    
    -- 💰 RENTABILIDAD
    ROUND((ingresos_ventas_carros + ingresos_ventas_piezas), 2) AS ingresos_totales,
    ROUND(gastos_compras_carros, 2) AS gastos_totales,
    ROUND((ingresos_ventas_carros + ingresos_ventas_piezas - gastos_compras_carros), 2) AS margen_bruto_estimado

FROM 
    MetricasGenerales
ORDER BY 
    anio DESC, 
    mes DESC, 
    total_carros_comprados DESC;


-- ====================================================================
-- CONSULTAS COMPLEMENTARIAS PARA RESPONDER PREGUNTAS ESPECÍFICAS
-- ====================================================================

-- 📊 PREGUNTA A: ¿Qué tipo de piezas se venden más?
SELECT 
    pieza_vendida, 
    COUNT(*) AS cantidad_vendida, 
    SUM(precio_venta) AS ingresos_piezas
FROM `proyecto-tablas-dinamicas.operaciones.operaciones_concesionario`
WHERE tipo_operacion = 'Venta Pieza' AND pieza_vendida IS NOT NULL
GROUP BY pieza_vendida 
ORDER BY cantidad_vendida DESC 
LIMIT 5;

-- 🚗 PREGUNTA B: ¿Qué tipo de carros se venden más y cuáles menos?
(SELECT 'MÁS VENDIDO' AS tipo, modelo_carro, COUNT(*) AS total 
 FROM `proyecto-tablas-dinamicas.operaciones.operaciones_concesionario` 
 WHERE tipo_operacion = 'Venta Carro' AND modelo_carro IS NOT NULL
 GROUP BY modelo_carro ORDER BY total DESC LIMIT 1)
UNION ALL
(SELECT 'MENOS VENDIDO' AS tipo, modelo_carro, COUNT(*) AS total 
 FROM `proyecto-tablas-dinamicas.operaciones.operaciones_concesionario` 
 WHERE tipo_operacion = 'Venta Carro' AND modelo_carro IS NOT NULL
 GROUP BY modelo_carro ORDER BY total ASC LIMIT 1);

-- 🔍 PREGUNTA C: ¿Cuántos carros se compran para desguace vs para reventa?
SELECT 
    destino_carro,
    COUNT(*) AS cantidad_carros,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM `proyecto-tablas-dinamicas.operaciones.operaciones_concesionario` WHERE tipo_operacion = 'Compra Carro'), 1) AS porcentaje
FROM `proyecto-tablas-dinamicas.operaciones.operaciones_concesionario`
WHERE tipo_operacion = 'Compra Carro' 
  AND destino_carro IS NOT NULL
GROUP BY destino_carro;
