-- 创建消息表
CREATE TABLE IF NOT EXISTS messages (
  id INT AUTO_INCREMENT PRIMARY KEY,
  content TEXT NOT NULL,
  author VARCHAR(50) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 插入一些示例数据
INSERT INTO messages (content, author) VALUES 
  ('nihao', 'HH'),
  ('哈哈', '测试用断点户');


SELECT * FROM messages WHERE content = '欢迎使用消息系统！'
DELETE FROM messages WHERE id = 4;
INSERT INTO messages (content, author) VALUES 
  ('新消息示例', '用户1'),
  ('另一个消息示例', '用户2');

DELETE FROM messages;LIMI

DELETE FROM messages WHERE id = 8;