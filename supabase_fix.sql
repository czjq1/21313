-- 删除现有策略（如果存在）
DROP POLICY IF EXISTS "Allow public read-write" ON users;
DROP POLICY IF EXISTS "Allow public read-write" ON comments;

-- 禁用行级安全（临时）
ALTER TABLE users DISABLE ROW LEVEL SECURITY;
ALTER TABLE comments DISABLE ROW LEVEL SECURITY;

-- 重新启用并创建策略
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE comments ENABLE ROW LEVEL SECURITY;

-- 创建 users 表的策略
CREATE POLICY "Users can read all" ON users
  FOR SELECT USING (true);

CREATE POLICY "Users can insert" ON users
  FOR INSERT WITH CHECK (true);

CREATE POLICY "Users can update own" ON users
  FOR UPDATE USING (true);

CREATE POLICY "Users can delete own" ON users
  FOR DELETE USING (true);

-- 创建 comments 表的策略（按您指定的结构）
CREATE POLICY "Comments can read all" ON comments
  FOR SELECT USING (true);

CREATE POLICY "Comments can insert" ON comments
  FOR INSERT WITH CHECK (true);

CREATE POLICY "Comments can update own" ON comments
  FOR UPDATE USING (true);

CREATE POLICY "Comments can delete own" ON comments
  FOR DELETE USING (true);

-- 插入示例数据
INSERT INTO users (username, email) VALUES
('admin', 'admin@example.com'),
('user', 'user@example.com'),
('guest', 'guest@example.com');

INSERT INTO comments (content, user_id, user_name) VALUES
('欢迎来到评论网站！', '1', 'admin'),
('这是一个很棒的评论系统！', '2', 'user'),
('大家好！', '3', 'guest');

SELECT 'Database setup complete!' as message;
