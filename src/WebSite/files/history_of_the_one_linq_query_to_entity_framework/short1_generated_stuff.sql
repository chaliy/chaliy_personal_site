exec sp_executesql N'SELECT 
[Extent8].[OrderProductID] AS [OrderProductID], 
[Extent8].[Title] AS [Title], 
[Extent8].[SKU] AS [SKU], 
[Extent8].[URL] AS [URL], 
[Extent8].[PlatformItemID] AS [PlatformItemID], 
[Extent8].[PlatformProductNumber] AS [PlatformProductNumber], 
[Extent8].[ContextID] AS [ContextID], 
[Extent8].[version] AS [version], 
[Extent8].[CreatedBy] AS [CreatedBy], 
[Extent8].[CreatedDate] AS [CreatedDate], 
[Extent8].[LastUpdatedBy] AS [LastUpdatedBy], 
[Extent8].[LastUpdatedDate] AS [LastUpdatedDate]
FROM    [Invoicing].[Customer] AS [Extent1]
INNER JOIN [Invoicing].[Order] AS [Extent2] ON  EXISTS (SELECT 
	cast(1 as bit) AS [C1]
	FROM    ( SELECT cast(1 as bit) AS X ) AS [SingleRowTable1]
	LEFT OUTER JOIN  (SELECT 
		[Extent3].[CustomerID] AS [CustomerID]
		FROM [Invoicing].[Customer] AS [Extent3]
		WHERE [Extent2].[CustomerID] = [Extent3].[CustomerID] ) AS [Project1] ON 1 = 1
	LEFT OUTER JOIN  (SELECT 
		[Extent4].[CustomerID] AS [CustomerID]
		FROM [Invoicing].[Customer] AS [Extent4]
		WHERE [Extent2].[CustomerID] = [Extent4].[CustomerID] ) AS [Project2] ON 1 = 1
	WHERE ([Extent1].[CustomerID] = [Project1].[CustomerID]) OR (([Extent1].[CustomerID] IS NULL) AND ([Project2].[CustomerID] IS NULL))
)
INNER JOIN [Invoicing].[OrderItem] AS [Extent5] ON  EXISTS (SELECT 
	cast(1 as bit) AS [C1]
	FROM    ( SELECT cast(1 as bit) AS X ) AS [SingleRowTable2]
	LEFT OUTER JOIN  (SELECT 
		[Extent6].[OrderID] AS [OrderID]
		FROM [Invoicing].[Order] AS [Extent6]
		WHERE [Extent5].[OrderID] = [Extent6].[OrderID] ) AS [Project4] ON 1 = 1
	LEFT OUTER JOIN  (SELECT 
		[Extent7].[OrderID] AS [OrderID]
		FROM [Invoicing].[Order] AS [Extent7]
		WHERE [Extent5].[OrderID] = [Extent7].[OrderID] ) AS [Project5] ON 1 = 1
	WHERE ([Extent2].[OrderID] = [Project4].[OrderID]) OR (([Extent2].[OrderID] IS NULL) AND ([Project5].[OrderID] IS NULL))
)
INNER JOIN [Invoicing].[OrderProduct] AS [Extent8] ON  EXISTS (SELECT 
	cast(1 as bit) AS [C1]
	FROM    ( SELECT cast(1 as bit) AS X ) AS [SingleRowTable3]
	LEFT OUTER JOIN  (SELECT 
		[Extent9].[OrderProductID] AS [OrderProductID]
		FROM [Invoicing].[OrderProduct] AS [Extent9]
		WHERE [Extent5].[OrderProductID] = [Extent9].[OrderProductID] ) AS [Project7] ON 1 = 1
	LEFT OUTER JOIN  (SELECT 
		[Extent10].[OrderProductID] AS [OrderProductID]
		FROM [Invoicing].[OrderProduct] AS [Extent10]
		WHERE [Extent5].[OrderProductID] = [Extent10].[OrderProductID] ) AS [Project8] ON 1 = 1
	WHERE ([Project7].[OrderProductID] = [Extent8].[OrderProductID]) OR (([Project8].[OrderProductID] IS NULL) AND ([Extent8].[OrderProductID] IS NULL))
)
WHERE [Extent1].[CustomerID] = @p__linq__1',N'@p__linq__1 uniqueidentifier',@p__linq__1='F5DD85CF-CE1E-E2D1-3171-650938ABD2B7'