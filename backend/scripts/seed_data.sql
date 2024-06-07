-- Add some initial users
INSERT INTO users (id, username, email, password) VALUES
(1, 'user1', 'user1@example.com', 'password1'),
(2, 'user2', 'user2@example.com', 'password2');

-- Add some initial posts
INSERT INTO posts (id, user_id, content) VALUES
(1, 1, 'Hello, this is my first post!'),
(2, 2, 'Hi there! This is another post.');
