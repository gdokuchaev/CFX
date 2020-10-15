USE Dokuchaev
GO

DROP VIEW ru.order_base
GO

CREATE VIEW ru.order_base AS
	SELECT 
		[UniqOrderId.Id] AS order_id,
		[OpenDate.Typed] AS order_date,
		[OpenTime] AS open_time,
		[OrderItems] AS order_items,
		[fullSum] AS fullsum,
		[Store.Id] AS store_id,
		[OrderDeleted] AS deleted,
		[Storned] AS storned
	FROM OPENQUERY([192.168.189.130], 'SELECT * FROM DWH.iiko.sales_order_base')
GO

DROP TABLE IF EXISTS temp.ru_order_base_2020_10_14_09
SELECT *
	INTO temp.ru_order_base_2020_10_14_09
	FROM ru.order_base
	WHERE order_date >= '2020-09-01' AND order_date <= '2020-09-30'

GO

SELECT TOP(100) *
FROM temp.ru_order_base_2020_10_14