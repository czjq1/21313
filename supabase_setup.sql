-- 创建评论表（使用您指定的结构）
CREATE TABLE comments ( 
   id SERIAL PRIMARY KEY, 
   content TEXT NOT NULL, 
   user_id TEXT NOT NULL, 
   user_name TEXT, 
   created_at TIMESTAMPTZ DEFAULT NOW() 
); 

ALTER TABLE comments ENABLE ROW LEVEL SECURITY; 
CREATE POLICY "Allow public read-write" ON comments FOR ALL USING (true) WITH CHECK (true);

-- 创建用户表
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  email VARCHAR(100) UNIQUE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE users ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Allow public read-write" ON users FOR ALL USING (true) WITH CHECK (true);

-- 创建索引
CREATE UNIQUE INDEX idx_users_username ON users(username);

-- 插入示例用户
INSERT INTO users (username, email) VALUES
('admin', 'admin@example.com'),
('user', 'user@example.com'),
('guest', 'guest@example.com');

-- 插入示例评论
INSERT INTO comments (content, user_id, user_name) VALUES
('欢迎来到评论网站！', '1', 'admin'),
('这是一个很棒的评论系统！', '2', 'user'),
('大家好！', '3', 'guest');
