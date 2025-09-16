-- Limpa o banco de dados se ele já existir
DROP DATABASE IF EXISTS biblioteca_universitaria;

-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS biblioteca_universitaria;
USE biblioteca_universitaria;

-- Tabela Alunos
CREATE TABLE IF NOT EXISTS Alunos (
    RA VARCHAR(20) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    curso VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(20)
);

-- Tabela Professores
CREATE TABLE IF NOT EXISTS Professores (
    matricula VARCHAR(20) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    departamento VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE
);

-- Tabela Bibliotecarios
CREATE TABLE IF NOT EXISTS Bibliotecarios (
    matricula VARCHAR(20) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    turno VARCHAR(20) NOT NULL,
    contato VARCHAR(20)
);

-- Tabela Usuarios (para login)
CREATE TABLE IF NOT EXISTS Usuarios (
    login VARCHAR(50) PRIMARY KEY,
    senha VARCHAR(255) NOT NULL,
    tipo ENUM('aluno', 'professor', 'bibliotecario', 'visitante') NOT NULL,
    RA_aluno VARCHAR(20),
    matricula_professor VARCHAR(20),
    matricula_bibliotecario VARCHAR(20),
    FOREIGN KEY (RA_aluno) REFERENCES Alunos(RA) ON DELETE SET NULL,
    FOREIGN KEY (matricula_professor) REFERENCES Professores(matricula) ON DELETE SET NULL,
    FOREIGN KEY (matricula_bibliotecario) REFERENCES Bibliotecarios(matricula) ON DELETE SET NULL
);

-- Tabela Livros (corrigida: ano como INT para suportar datas antigas)
CREATE TABLE IF NOT EXISTS Livros (
    ISBN VARCHAR(13) PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    editora VARCHAR(100),
    ano INT(4),
    categoria VARCHAR(50)
);

-- Tabela Exemplares
CREATE TABLE IF NOT EXISTS Exemplares (
    codigo_exemplar VARCHAR(50) PRIMARY KEY,
    status ENUM('disponivel', 'emprestado', 'reservado', 'danificado') NOT NULL,
    localizacao VARCHAR(100),
    ISBN VARCHAR(13),
    FOREIGN KEY (ISBN) REFERENCES Livros(ISBN)
);

-- Tabela Emprestimos
CREATE TABLE IF NOT EXISTS Emprestimos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    login_usuario VARCHAR(50),
    codigo_exemplar VARCHAR(50),
    data_retirada DATE,
    data_prevista DATE,
    data_devolucao DATE,
    status ENUM('ativo', 'devolvido', 'atrasado'),
    FOREIGN KEY (login_usuario) REFERENCES Usuarios(login),
    FOREIGN KEY (codigo_exemplar) REFERENCES Exemplares(codigo_exemplar)
);

-- Tabela Reservas
CREATE TABLE IF NOT EXISTS Reservas (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    login_usuario VARCHAR(50),
    ISBN VARCHAR(13),
    data_reserva DATE,
    status ENUM('ativa', 'cancelada', 'atendida'),
    FOREIGN KEY (login_usuario) REFERENCES Usuarios(login),
    FOREIGN KEY (ISBN) REFERENCES Livros(ISBN)
);

-- Tabela Penalidades
CREATE TABLE IF NOT EXISTS Penalidades (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    login_usuario VARCHAR(50),
    dias_atraso INT,
    valor_multa DECIMAL(10,2),
    FOREIGN KEY (login_usuario) REFERENCES Usuarios(login)
);
