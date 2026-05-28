
use travel_food_db
go
SET IDENTITY_INSERT Users ON;
GO
MERGE Users AS target
USING (SELECT 1 AS id, 'guest@yummap.com' AS email, 'Chatbot Guest' AS name, '' AS avatar_url) AS source
ON (target.id = source.id)
WHEN NOT MATCHED BY TARGET THEN
    INSERT (id, email, name, avatar_url, created_at, updated_at)
    VALUES (source.id, source.email, source.name, source.avatar_url, GETDATE(), GETDATE());
GO

SET IDENTITY_INSERT Users OFF;
GO