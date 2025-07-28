-- 创建消息表
CREATE TABLE IF NOT EXISTS messages (
  id INT AUTO_INCREMENT PRIMARY KEY,
  content TEXT NOT NULL,
  author VARCHAR(50) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 插入一些示例数据
INSERT INTO messages (content, author) VALUES 
  ('欢迎使用消息系统！', '系统'),
  ('这是一个示例消息', '测试用户');