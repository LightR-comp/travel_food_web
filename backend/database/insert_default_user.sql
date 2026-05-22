-- File SQL để tạo người dùng mặc định cho chatbot.
-- Code Go backend (internal/handlers/chatbot.go) đang mặc định sử dụng user_id = 1 cho các phiên chat ẩn danh.
-- Script này đảm bảo người dùng với ID=1 luôn tồn tại trong DB để logic lưu trữ hoạt động chính xác.
use travel_food_db
go
-- Bật chế độ cho phép chèn giá trị tường minh vào cột IDENTITY (cột ID tự tăng).
SET IDENTITY_INSERT Users ON;
GO

-- Sử dụng MERGE để chèn người dùng mặc định chỉ khi ID=1 chưa tồn tại.
-- Lệnh này an toàn để chạy nhiều lần mà không gây lỗi.
MERGE Users AS target
USING (SELECT 1 AS id, 'guest@yummap.com' AS email, 'Chatbot Guest' AS name, '' AS avatar_url) AS source
ON (target.id = source.id)
WHEN NOT MATCHED BY TARGET THEN
    INSERT (id, email, name, avatar_url, created_at, updated_at)
    VALUES (source.id, source.email, source.name, source.avatar_url, GETDATE(), GETDATE());
GO

-- Tắt lại chế độ chèn tường minh sau khi hoàn tất.
SET IDENTITY_INSERT Users OFF;
GO