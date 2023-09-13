SELECT m.cod_mensaje
	,p.nombre AS 'proyecto'
	,pd.descripcion AS 'producto'
FROM Mensaje ms
INNER JOIN proyecto py ON ms.proyecto = py.proyecto
INNER JOIN producto pd ON m.producto= pd.producto
GROUP BY ms.cod_mensaje, py.nombre, pd.descripcion