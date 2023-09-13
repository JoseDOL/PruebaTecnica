SELECT py.nombre
	,pd.descripcion
FROM Proyecto py
INNER JOIN Producto_Proyecto ppy ON py.proyecto = ppy.proyecto
INNER JOIN Producto pd ON ppy.producto = pd.producto
WHERE p.proyecto= 1 AND p.nombre LIKE 'Premia'