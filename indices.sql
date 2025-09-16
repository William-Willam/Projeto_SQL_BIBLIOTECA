-- Índices para otimização
CREATE INDEX idx_livros_isbn ON Livros(ISBN);
CREATE INDEX idx_usuarios_login ON Usuarios(login);
CREATE INDEX idx_livros_titulo ON Livros(titulo);