WITH MensajeAgrupado AS (
  SELECT
    m.cod_mensaje,
    p.nombre AS proyecto,
    COUNT(DISTINCT m.producto) AS productos_count
  FROM mensaje m
  INNER JOIN proyecto p ON m.proyecto = p.nombre 
  GROUP BY
    m.cod_mensaje,
    p.nombre
)

SELECT
  m.cod_mensaje,
  ma.proyecto,
  CASE
    WHEN ma.productos_count = (
      SELECT COUNT(*) FROM producto_proyecto pp
      WHERE pp.proyecto = (
        SELECT p.proyecto FROM proyecto p WHERE p.nombre = ma.proyecto
      )
    )
    THEN 'TODOS'
    ELSE pd.descripcion
  END AS producto
FROM mensaje m
INNER JOIN MensajeAgrupado ma ON m.cod_mensaje = ma.cod_mensaje
LEFT JOIN producto pd ON m.producto = pd.producto
GROUP BY
  m.cod_mensaje,
  ma.proyecto,
  pd.descripcion
