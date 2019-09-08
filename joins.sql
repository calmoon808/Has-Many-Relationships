SELECT * FROM users;

SELECT * FROM posts WHERE userID = 100;

SELECT posts.*, users.first_name, users.last_name 
FROM posts
INNER JOIN users ON posts.userID = users.id
WHERE posts.userID = 200;

SELECT posts.*, users.username 
FROM posts
INNER JOIN users ON posts.userID = users.id
WHERE users.first_name = 'Norene' AND users.last_name = 'Schmitt';

SELECT username FROM users
WHERE created_at > '2015-01-01';

SELECT posts.title, posts.content, users.username FROM posts
INNER JOIN users ON posts.userID = users.id
WHERE users.created_at < '2015-01-01';

SELECT comments.*, posts.title as "Post_Title" FROM comments
INNER JOIN posts ON comments.postsID = posts.id;

SELECT posts.title as post_title, posts.url as post_url, comments.body as comment_body
FROM comments
INNER JOIN posts ON comments.postsID = posts.id
WHERE posts.created_at < '2015-01-01';

SELECT posts.title as post_title, posts.url as post_url, comments.body as comment_body
FROM comments
INNER JOIN posts ON comments.postsID = posts.id
WHERE posts.created_at > '2015-01-01';

SELECT posts.title as post_title, posts.url as post_url, comments.body as comment_body
FROM comments
INNER JOIN posts ON comments.postsID = posts.id
WHERE comments.body LIKE '%USB%';

SELECT posts.title as post_title, users.last_name, comments.body as comment_body
FROM comments
INNER JOIN users ON comments.userID = users.id
INNER JOIN posts ON comments.postsID = posts.id
WHERE comments.body LIKE '%matrix%';

SELECT users.first_name, users.last_name, comments.body as comment_body
FROM comments
INNER JOIN users ON comments.userID = users.id
INNER JOIN posts ON comments.postsID = posts.id
WHERE comments.body LIKE '%SSL%' AND posts.content LIKE '%dolorum%';

SELECT users.first_name as post_author_first_name, users.last_name as post_author_last_name, posts.title as post_title, users.username as comment_author_username, comments.body as comment_body
FROM comments
INNER JOIN users ON posts.userID = users.id
INNER JOIN posts ON comments.postsID = posts.id
INNER JOIN users as users1 ON comments.userID = users.id
WHERE (comments.body LIKE '%SSL%' OR comments.body LIKE '%firewall%') AND posts.content LIKE '%nemo%';