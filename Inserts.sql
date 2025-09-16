INSERT INTO Alunos (RA, nome, curso, email, telefone) VALUES
('2023001', 'Ana Silva', 'Engenharia da Computação', 'ana.silva@aluno.universidade.edu', '11987654321'),
('2023002', 'Bruno Costa', 'Ciência da Computação', 'bruno.costa@aluno.universidade.edu', '21912345678'),
('2023003', 'Carla Dias', 'Engenharia Elétrica', 'carla.dias@aluno.universidade.edu', '31998765432'),
('2023004', 'Diego Lopes', 'Arquitetura e Urbanismo', 'diego.lopes@aluno.universidade.edu', '41911223344');

INSERT INTO Professores (matricula, nome, departamento, email) VALUES
('P1001', 'Prof. Dr. Ricardo Almeida', 'Ciência da Computação', 'ricardo.almeida@universidade.edu'),
('P1002', 'Profa. Dra. Juliana Barbosa', 'Engenharia Elétrica', 'juliana.barbosa@universidade.edu');

INSERT INTO Bibliotecarios (matricula, nome, turno, contato) VALUES
('B2001', 'Fernanda Martins', 'Manhã', '11987651234'),
('B2002', 'Gustavo Ribeiro', 'Tarde', '11998765432');

-- Inserção de usuários
INSERT INTO Usuarios (login, senha, tipo, RA_aluno, matricula_professor) VALUES
('ana.silva', 'senha123', 'aluno', '2023001', NULL),
('bruno.costa', 'senha456', 'aluno', '2023002', NULL),
('ricardo.almeida', 'senha789', 'professor', NULL, 'P1001');

-- Inserção de livros
INSERT INTO Livros (ISBN, titulo, autor, editora, ano, categoria) VALUES
('9788535205566', 'Banco de Dados', 'Abraham Silberschatz', 'Elsevier', 2012, 'Tecnologia'),
('9788575080757', 'Engenharia de Software', 'Roger S. Pressman', 'LTC', 2010, 'Tecnologia'),
('9780134493395', 'The Lord of the Rings', 'J.R.R. Tolkien', 'Allen & Unwin', 1954, 'Fantasia'),
('9788535914859', 'Dom Casmurro', 'Machado de Assis', 'Companhia das Letras', 1899, 'Ficção');

-- Inserção de exemplares
INSERT INTO Exemplares (codigo_exemplar, status, localizacao, ISBN) VALUES
('E1', 'disponivel', 'Prateleira A1', '9788535205566'),
('E2', 'emprestado', 'Prateleira A1', '9788535205566'),
('E3', 'disponivel', 'Prateleira B2', '9788575080757');

-- Inserção de empréstimos
INSERT INTO Emprestimos (login_usuario, codigo_exemplar, data_retirada, data_prevista, data_devolucao, status) VALUES
('ana.silva', 'E2', '2025-09-01', '2025-09-15', NULL, 'ativo'),
('bruno.costa', 'E3', '2025-08-20', '2025-09-03', '2025-09-02', 'devolvido');
