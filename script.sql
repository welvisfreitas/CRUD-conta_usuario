-- Criação das tabelas

CREATE TABLE conta_usuario (
    id_usuario SERIAL PRIMARY KEY,
    nome_completo VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefone VARCHAR(20) NOT NULL
);

CREATE TABLE endereco (
    id_endereco SERIAL PRIMARY KEY,
	id_usuario INT NOT NULL REFERENCES conta_usuario(id_usuario) 
		ON DELETE CASCADE,
    logradouro VARCHAR(255) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    complemento VARCHAR(255),
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    cep VARCHAR(10) NOT NULL
);


CREATE TABLE psicologo (
    id_psicologo INT PRIMARY KEY REFERENCES conta_usuario(id_usuario)
		ON DELETE CASCADE,
    crp_psicologo VARCHAR(20) UNIQUE NOT NULL,
    abordagem TEXT
);

CREATE TABLE paciente (
    id_paciente INT PRIMARY KEY REFERENCES conta_usuario(id_usuario)
		ON DELETE CASCADE,
    nis VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE sessao (
    id_sessao SERIAL PRIMARY KEY,
    id_psicologo INT NOT NULL REFERENCES psicologo(id_psicologo) 
		ON DELETE CASCADE,
    id_paciente INT NOT NULL REFERENCES paciente(id_paciente) 
		ON DELETE CASCADE,
    data_hora TIMESTAMP NOT NULL,
    link_plataforma TEXT NOT NULL,
    status VARCHAR(50) NOT NULL,
    urgencia BOOLEAN DEFAULT FALSE,
    feedback TEXT
);

CREATE TABLE prontuario (
    id_prontuario SERIAL PRIMARY KEY,
    id_paciente INT NOT NULL REFERENCES Paciente(id_paciente) 
		ON DELETE CASCADE,
    id_psicologo INT NOT NULL REFERENCES Psicologo(id_psicologo) 
		ON DELETE CASCADE,
    data_hora TIMESTAMP NOT NULL,
    diagnostico TEXT NOT NULL,
    evolucao TEXT,
    historico TEXT
);

CREATE TABLE notificacao (
    id_notificacao SERIAL PRIMARY KEY,
    id_sessao INT NOT NULL REFERENCES sessao(id_sessao) 
		ON DELETE CASCADE,
    id_usuario INT NOT NULL REFERENCES conta_usuario(id_usuario)
		ON DELETE CASCADE,
    data_hora TIMESTAMP NOT NULL,
    descricao TEXT NOT NULL,  
    push BOOLEAN DEFAULT TRUE,
    email BOOLEAN DEFAULT TRUE
);

-- Povoação das tabelas

INSERT INTO conta_usuario (nome_completo, data_nascimento, cpf, email, telefone) VALUES
('Lucas Ferreira', '1992-05-14', '123.456.789-00', 'lucas.ferreira@email.com', '(11) 98765-4321'),
('Ana Souza', '1987-09-23', '234.567.890-11', 'ana.souza@email.com', '(21) 97654-3210'),
('Carlos Oliveira', '1995-12-02', '345.678.901-22', 'carlos.oliveira@email.com', '(31) 96543-2109'),
('Mariana Lima', '1990-07-18', '456.789.012-33', 'mariana.lima@email.com', '(41) 95432-1098'),
('Felipe Rocha', '1985-03-30', '567.890.123-44', 'felipe.rocha@email.com', '(51) 94321-0987'),
('Juliana Mendes', '1998-11-11', '678.901.234-55', 'juliana.mendes@email.com', '(61) 93210-9876'),
('Gabriel Silva', '1993-06-25', '789.012.345-66', 'gabriel.silva@email.com', '(71) 92109-8765'),
('Fernanda Costa', '1991-04-07', '890.123.456-77', 'fernanda.costa@email.com', '(81) 91098-7654'),
('Rodrigo Almeida', '1989-08-19', '901.234.567-88', 'rodrigo.almeida@email.com', '(91) 90987-6543'),
('Beatriz Santos', '2000-01-22', '012.345.678-99', 'beatriz.santos@email.com', '(11) 89876-5432'),
('Rafael Martins', '1997-10-05', '111.222.333-44', 'rafael.martins@email.com', '(21) 88765-4321'),
('Amanda Nunes', '1994-12-15', '222.333.444-55', 'amanda.nunes@email.com', '(31) 87654-3210'),
('Thiago Cardoso', '1996-02-27', '333.444.555-66', 'thiago.cardoso@email.com', '(41) 86543-2109'),
('Vanessa Ribeiro', '1999-09-14', '444.555.666-77', 'vanessa.ribeiro@email.com', '(51) 85432-1098'),
('Eduardo Moreira', '1988-07-09', '555.666.777-88', 'eduardo.moreira@email.com', '(61) 84321-0987'),
('Carolina Batista', '1992-11-30', '666.777.888-99', 'carolina.batista@email.com', '(71) 83210-9876'),
('Bruno Gomes', '1986-06-21', '777.888.999-00', 'bruno.gomes@email.com', '(81) 82109-8765'),
('Patrícia Figueiredo', '1993-05-08', '888.999.000-11', 'patricia.figueiredo@email.com', '(91) 81098-7654'),
('Daniel Araújo', '2001-03-19', '999.000.111-22', 'daniel.araujo@email.com', '(11) 79876-5432'),
('Larissa Monteiro', '1990-08-12', '000.111.222-33', 'larissa.monteiro@email.com', '(21) 78765-4321');

INSERT INTO endereco (id_usuario, logradouro, numero, complemento, bairro, cidade, cep) VALUES
(1, 'Rua das Acácias', '157', 'Casa 2', 'Jardim América', 'Jundiaí', '13208-120'),
(2, 'Avenida Brasil', '220', NULL, 'Centro', 'Petrolina', '56302-970'),
(3, 'Rua do Comércio', '1050', 'Bloco A', 'Centro', 'Londrina', '86010-400'),
(4, 'Rua das Palmeiras', '745', NULL, 'Boa Vista', 'Caruaru', '55014-280'),
(5, 'Rua dos Jasmins', '520', 'Sala 5', 'Vila Nova', 'Blumenau', '89035-000'),
(6, 'Avenida das Nações', '1580', NULL, 'Centro', 'Caxias do Sul', '95010-000'),
(7, 'Rua Frei Caneca', '654', NULL, 'Jardim Glória', 'Juiz de Fora', '36015-350'),
(8, 'Rua Barão de Itapetininga', '302', 'Sobreloja', 'Centro', 'Maringá', '87013-974'),
(9, 'Avenida Sete de Setembro', '1201', NULL, 'Centro', 'Campina Grande', '58400-435'),
(10, 'Rua Marechal Deodoro', '211', 'Fundos', 'Centro', 'Foz do Iguaçu', '85851-050'),
(11, 'Rua 24 de Outubro', '99', NULL, 'Moinhos de Vento', 'Passo Fundo', '99010-124'),
(12, 'Rua João Cachoeira', '101', 'Apto 44', 'Vila Olímpia', 'São José do Rio Preto', '15085-310'),
(13, 'Avenida Getúlio Vargas', '555', NULL, 'Funcionários', 'Uberlândia', '38400-436'),
(14, 'Rua Joaquim Nabuco', '88', NULL, 'Boa Viagem', 'Novo Hamburgo', '93310-080'),
(15, 'Rua Domingos Ferreira', '900', 'Apto 302', 'Centro', 'Ribeirão Preto', '14010-170'),
(16, 'Avenida Djalma Batista', '2500', NULL, 'Chapada', 'Bauru', '17012-100'),
(17, 'Rua Floriano Peixoto', '404', NULL, 'Centro', 'Lages', '88502-020'),
(18, 'Rua das Palmeiras', '12', 'Casa', 'Jardim Goiás', 'Anápolis', '75080-020'),
(19, 'Avenida Ceará', '720', NULL, 'Bosque', 'Cascavel', '85801-000'),
(20, 'Rua Rui Barbosa', '157', 'Casa 5', 'Centro', 'Arapiraca', '57300-190');

INSERT INTO psicologo (id_psicologo, crp_psicologo, abordagem) VALUES
(2, '06/123456', 'Terapia Cognitivo-Comportamental'),
(5, '08/654321', 'Psicanálise'),
(7, '10/987654', 'Gestalt-terapia'),
(9, '12/112233', 'Terapia Sistêmica'),
(11, '15/223344', 'Terapia Humanista'),
(13, '18/334455', 'Análise Comportamental Aplicada'),
(15, '20/445566', 'Psicodrama'),
(16, '22/556677', 'Neuropsicologia'),
(18, '25/667788', 'Mindfulness e Terapia de Aceitação e Compromisso'),
(20, '30/778899', 'Hipnoterapia');

INSERT INTO paciente (id_paciente, nis) VALUES
(1, '12345678901'),
(3, '23456789012'),
(4, '34567890123'),
(6, '45678901234'),
(8, '56789012345'),
(10, '67890123456'),
(12, '78901234567'),
(14, '89012345678'),
(17, '90123456789'),
(19, '01234567890');

INSERT INTO sessao (id_psicologo, id_paciente, data_hora, link_plataforma, status, urgencia, feedback) VALUES
(2, 1, '2025-02-05 10:00:00', 'https://plataforma.com/sessao1', 'Realizada', FALSE, 'Ótima sessão, me senti acolhido.'),
(5, 3, '2025-02-06 14:00:00', 'https://plataforma.com/sessao2', 'Agendada', FALSE, NULL),
(7, 4, '2025-02-07 09:30:00', 'https://plataforma.com/sessao3', 'Realizada', FALSE, 'Muito produtiva, esclareceu várias dúvidas.'),
(9, 6, '2025-02-08 16:00:00', 'https://plataforma.com/sessao4', 'Cancelada', FALSE, NULL),
(11, 8, '2025-02-09 11:00:00', 'https://plataforma.com/sessao5', 'Agendada', TRUE, NULL),
(13, 10, '2025-02-10 15:00:00', 'https://plataforma.com/sessao6', 'Realizada', FALSE, 'Excelente abordagem do tema.'),
(15, 12, '2025-02-11 13:00:00', 'https://plataforma.com/sessao7', 'Agendada', FALSE, NULL),
(16, 14, '2025-02-12 17:00:00', 'https://plataforma.com/sessao8', 'Realizada', TRUE, 'Sessão intensa, mas muito necessária.'),
(18, 17, '2025-02-13 08:00:00', 'https://plataforma.com/sessao9', 'Cancelada', FALSE, NULL),
(20, 19, '2025-02-14 10:30:00', 'https://plataforma.com/sessao10', 'Realizada', FALSE, 'Gostei bastante, pretendo continuar o acompanhamento.');

INSERT INTO prontuario (id_paciente, id_psicologo, data_hora, diagnostico, evolucao, historico) VALUES
(1, 2, '2025-02-05 11:00:00', 'Ansiedade Generalizada', 'Paciente relatou melhora no controle da ansiedade.', 'Histórico de crises de ansiedade desde a adolescência.'),
(3, 5, '2025-02-06 15:00:00', 'Depressão Moderada', 'Paciente apresentou leve melhora no humor.', 'Histórico de episódios depressivos nos últimos 2 anos.'),
(4, 7, '2025-02-07 10:30:00', 'Transtorno de Pânico', 'Paciente ainda demonstra receio de locais fechados.', 'Histórico de ataques de pânico frequentes nos últimos meses.'),
(6, 9, '2025-02-08 17:00:00', 'Transtorno de Estresse Pós-Traumático', NULL, 'Paciente relatou evento traumático significativo na infância.'),
(8, 11, '2025-02-09 12:00:00', 'Transtorno Obsessivo-Compulsivo', 'Paciente demonstrou pequena melhora no controle das compulsões.', 'Histórico de TOC diagnosticado há 5 anos.'),
(10, 13, '2025-02-10 16:00:00', 'Transtorno de Personalidade Borderline', 'Paciente iniciou estratégias para regulação emocional.', 'Histórico de instabilidade emocional e relacionamentos conturbados.'),
(12, 15, '2025-02-11 14:00:00', 'Burnout', 'Paciente relatou melhora leve na exaustão emocional.', 'Histórico de alta carga de trabalho e sintomas de estresse extremo.'),
(14, 16, '2025-02-12 18:00:00', 'Fobia Social', 'Paciente começou a praticar técnicas de exposição gradual.', 'Histórico de dificuldade em interações sociais desde a adolescência.'),
(17, 18, '2025-02-13 09:00:00', 'Transtorno Bipolar Tipo II', NULL, 'Histórico de episódios depressivos e hipomaníacos.'),
(19, 20, '2025-02-14 11:30:00', 'Insônia Crônica', 'Paciente apresentou leve melhora na rotina do sono.', 'Histórico de dificuldades para dormir há mais de 10 anos.');

INSERT INTO notificacao (id_sessao, id_usuario, data_hora, descricao, push, email) VALUES
(1, 1, '2025-02-04 09:00:00', 'Sua sessão foi agendada para 05/02 às 10h. Lembre-se de acessar o link no horário marcado.', TRUE, TRUE),
(1, 2, '2025-02-04 09:00:05', 'Sua sessão foi agendada para 05/02 às 10h. Lembre-se de acessar o link no horário marcado.', TRUE, TRUE),
(2, 3, '2025-02-05 10:30:00', 'Sua sessão foi agendada para 06/02 às 14h. Lembre-se de acessar o link no horário marcado.', TRUE, TRUE),
(2, 5, '2025-02-05 10:30:05', 'Sua sessão foi agendada para 06/02 às 14h. Lembre-se de acessar o link no horário marcado.', TRUE, TRUE),
(3, 4, '2025-02-06 08:00:00', 'Sua sessão foi agendada para 07/02 às 09h30. Lembre-se de acessar o link no horário marcado.', TRUE, TRUE),
(3, 7, '2025-02-06 08:00:05', 'Sua sessão foi agendada para 07/02 às 09h30. Lembre-se de acessar o link no horário marcado.', TRUE, TRUE),
(4, 6, '2025-02-07 12:00:00', 'Infelizmente, sua sessão marcada para 08/02 às 16h foi cancelada. Caso necessário, reagende pelo sistema.', TRUE, TRUE),
(4, 9, '2025-02-07 12:00:05', 'Infelizmente, sua sessão marcada para 08/02 às 16h foi cancelada. Caso necessário, reagende pelo sistema.', TRUE, TRUE),
(5, 8, '2025-02-08 15:00:00', 'Sua sessão foi agendada para 09/02 às 11h. Lembre-se de acessar o link no horário marcado.', TRUE, TRUE),
(5, 11, '2025-02-08 15:00:05', 'Sua sessão foi agendada para 09/02 às 11h. Lembre-se de acessar o link no horário marcado.', TRUE, TRUE),
(6, 10, '2025-02-09 17:30:00', 'Sua sessão realizada em 10/02 às 15h foi concluída com sucesso. Caso queira, você pode deixar um feedback.', TRUE, TRUE),
(6, 13, '2025-02-09 17:30:05', 'Sua sessão realizada em 10/02 às 15h foi concluída com sucesso. Caso queira, você pode deixar um feedback.', TRUE, TRUE),
(7, 12, '2025-02-10 10:00:00', 'Sua sessão foi agendada para 11/02 às 13h. Lembre-se de acessar o link no horário marcado.', TRUE, TRUE),
(7, 15, '2025-02-10 10:00:05', 'Sua sessão foi agendada para 11/02 às 13h. Lembre-se de acessar o link no horário marcado.', TRUE, TRUE),
(8, 14, '2025-02-11 16:30:00', 'Sua sessão realizada em 12/02 às 17h foi concluída com sucesso. Caso queira, você pode deixar um feedback.', TRUE, TRUE),
(8, 16, '2025-02-11 16:30:05', 'Sua sessão realizada em 12/02 às 17h foi concluída com sucesso. Caso queira, você pode deixar um feedback.', TRUE, TRUE),
(9, 17, '2025-02-12 07:00:00', 'Infelizmente, sua sessão marcada para 13/02 às 08h foi cancelada. Caso necessário, reagende pelo sistema.', TRUE, TRUE),
(9, 18, '2025-02-12 07:00:05', 'Infelizmente, sua sessão marcada para 13/02 às 08h foi cancelada. Caso necessário, reagende pelo sistema.', TRUE, TRUE),
(10, 19, '2025-02-13 09:30:00', 'Sua sessão realizada em 14/02 às 10h30 foi concluída com sucesso. Caso queira, você pode deixar um feedback.', TRUE, TRUE),
(10, 20, '2025-02-13 09:30:05', 'Sua sessão realizada em 14/02 às 10h30 foi concluída com sucesso. Caso queira, você pode deixar um feedback.', TRUE, TRUE);