# Fundamentos de Banco de Dados - CRUD em Python com PostgreSQL

Este repositório contém um CRUD desenvolvido em Python para a disciplina de Fundamentos de Banco de Dados. O projeto tem como objetivo facilitar a manipulação de dados no banco PostgreSQL, utilizando uma abordagem prática e didática.

## 🚀 Tecnologias Utilizadas

Para o desenvolvimento deste CRUD, foram empregadas as seguintes tecnologias:

- 🛠️ **SQLAlchemy** - ORM para interação com o banco de dados
- 🔌 **Psycopg2** - Driver para conexão com PostgreSQL
- 📊 **Pandas** - Manipulação e exibição de dados em formato tabular
- 🎨 **Panel** - Criação de interface interativa

## 📌 Descrição

O CRUD foi desenvolvido para manipular dados relacionados à tabela **conta_usuario** no PostgreSQL. A interface do banco foi gerenciada por meio do **pgAdmin**.

As operações CRUD implementadas incluem:

- ✅ **Create** (Criação de novos registros)
- 🔍 **Read** (Leitura de registros existentes)
- ✏️ **Update** (Atualização de registros)
- ❌ **Delete** (Exclusão de registros)

Além disso, o projeto permite visualizar os dados de forma organizada utilizando a biblioteca **Pandas**.

## 🛠️ Ambiente de Desenvolvimento

Este projeto foi desenvolvido utilizando o **Jupyter Notebook** e **VS Code** como editor de código. Certifique-se de ter o Jupyter Notebook instalado para executar o código interativamente, conforme as instruções no **Tutorial**.


## ▶️ Como Executar

Para rodar o projeto, siga os passos abaixo:

1. 🖥️ Clone este repositório:

   ```bash
   git clone 
   https://github.com/welvisfreitas/CRUD-conta_usuario.git
   ```

2. 📂 Acesse a pasta do projeto:

   ```bash
   cd CRUD-conta_usuario
   ```

3. 📦 Instale as dependências necessárias:

   ```bash
   pip install sqlalchemy psycopg2 pandas panel
   ```

4. ⚙️ Configure a conexão com o PostgreSQL no bloco de configuração.

5. ▶️   Inicie o Jupyter Notebook para interagir com a tabela:
   ```bash
   jupyter notebook projeto-fbd.ipynb
   ```

6. 📓 Execute as células do notebook para rodar as operações de CRUD e interagir com a tabela.
## 📁 Estrutura do Projeto

A estrutura do projeto está organizada da seguinte forma:

```
/ 
├── .gitignore           # Arquivo para ignorar arquivos desnecessários
├── README.md            # Documentação do projeto
├── projeto-fbd.ipynb    # Notebook com o projeto de FBD
├── script.sql           # Script do banco de dados 
```

## 👤 Autor

**Welvis de Freitas Santos - 553355**


