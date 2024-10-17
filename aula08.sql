CREATE TABLE Tipos (
    TipoID INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);

CREATE TABLE Pokemons (
    PokemonID INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    TipoID INT,
    HP INT,
    Ataque INT,
    Defesa INT,
    FOREIGN KEY (TipoID) REFERENCES Tipos(TipoID)
);


INSERT INTO Tipos (TipoID, Nome) VALUES (1, 'Fogo');
INSERT INTO Tipos (TipoID, Nome) VALUES (2, 'Água');
INSERT INTO Tipos (TipoID, Nome) VALUES (3, 'Grama');
INSERT INTO Tipos (TipoID, Nome) VALUES (4, 'Elétrico');
INSERT INTO Tipos (TipoID, Nome) VALUES (5, 'Psíquico');
INSERT INTO Tipos (TipoID, Nome) VALUES (6, 'Voador');
INSERT INTO Tipos (TipoID, Nome) VALUES (7, 'Gelo');

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (1, 'Charmander', 1, 39, 52, 43);

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (2, 'Squirtle', 2, 44, 48, 65);

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (3, 'Bulbasaur', 3, 45, 49, 49);

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (4, 'Pikachu', 4, 35, 55, 40);

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (5, 'Jigglypuff', 5, 115, 45, 20);

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (6, 'Vulpix', 1, 38, 41, 40);

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (7, 'Missingno', NULL, 38, 41, 40);


-----------APELIDOS
--falha na ambiguidade, pois há duas colunas com o mesmo nome entre as tabelas
SELECT nome 
FROM Pokemons p, Tipos t;

--usando apelidos para facilitar
SELECT p.nome FROM Pokemons p, Tipos t; --MENCIONA p para mostrar o nome apenas dos pokemons

-- quando nao utilizamos apelidos é necessario mencionar o nome das tabelas
SELECT Pokemons.nome FROM Pokemons, Tipos;

--definindo apelidos nas colunas
SELECT p.nome, t.nome
FROM Pokemons p, tipos t;

--exemplo de definição de apelidos em colunas
SELECT p.nome nome_pokemon, t.nome tipo
FROM Pokemons p, Tipos t;


--JUNÇÃO 
--equi join
SELECT p.nome nome_pokemon, t.nome tipo
FROM Pokemons p, Tipos t
WHERE t.tipoid = p.tipoid;

SELECT p.nome nome_pokemon, t.nome tipo
FROM Pokemons p, Tipos t
WHERE t.tipoid = p.tipoid AND t.nome = 'Fogo';

--inner join (usar mais)
SELECT p.nome nome_pokemon, t.nome tipo
FROM Pokemons p INNER JOIN Tipos t ON t.tipoid = p.tipoid;

SELECT p.nome nome_pokemon, t.nome tipo
FROM Pokemons p INNER JOIN Tipos t ON t.tipoid = p.tipoid
WHERE t.nome='Fogo';

--LEFT JOIN
SELECT p.nome nome_pokemon, t.nome tipo
FROM Pokemons p LEFT JOIN Tipos t ON t.tipoid = p.tipoid; --mostra os pokemons que também nao tem o tipo

--LEFT EXCLUSAO JOIN
SELECT p.nome nome_pokemon, t.nome tipo
FROM Pokemons p LEFT JOIN Tipos t ON t.tipoid = p.tipoid
WHERE T.tipoid is null;

--RIGHT JOIN
SELECT p.nome nome_pokemon, t.nome tipo
FROM Pokemons p RIGHT JOIN Tipos t ON t.tipoid = p.tipoid; --mostra os TIPOS que também nao tem o pokemon

--RIGHT JOIN EXCLUSAO
SELECT p.nome nome_pokemon, t.nome tipo
FROM Pokemons p RIGHT JOIN Tipos t ON t.tipoid = p.tipoid
WHERE p.tipoid is null; 

--FULL JOIN
SELECT p.nome nome_pokemon, t.nome tipo
FROM Pokemons p FULL JOIN Tipos t ON t.tipoid = p.tipoid;

--OU
--O unnion é utilizado para juntar duas ou mais consultas 
-- o full join é LEFT JOIN + RIGHT JOIN
SELECT p.nome nome_pokemon, t.nome tipo
FROM Pokemons p LEFT JOIN Tipos t ON t.tipoid = p.tipoid
union
SELECT p.nome nome_pokemon, t.nome tipo
FROM Pokemons p RIGHT JOIN Tipos t ON t.tipoid = p.tipoid;

-- outer join é LEFT EXCLUDING JOIN + RIGHT EXCLUDING JOIN
SELECT p.nome nome_pokemon, t.nome tipo
FROM Pokemons p LEFT JOIN Tipos t ON t.tipoid = p.tipoid
WHERE t.tipoid is null
union
SELECT p.nome nome_pokemon, t.nome tipo
FROM Pokemons p RIGHT JOIN Tipos t ON t.tipoid = p.tipoid
WHERE p.tipoid is null;

--CROSS JOIN É o que relaciona todos com todos, faz um cruzamento de dados. 
--Todos os itens tem relação com todos os itens
SELECT p.nome nome_pokemon, t.nome tipo
FROM Pokemons p, Tipos t;

--SELF JOIN: 
SELECT p1.pokemonid, p1.nome nome_pokemon, p2.pokemonid,p2.nome nome_pokemon
FROM Pokemons p1 INNER JOIN Pokemons p2 ON p1.tipoid = p2.tipoid
where p1.pokemonid < p2.pokemonid;

--SELECT * FROM Pokemons;
--SELECT * FROM Tipos;  

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (8, 'Psyduck', 2, 50, 52, 48);

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (9, 'Oddish', 3, 45, 50, 55);

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (10, 'Magnemite', 4, 25, 35, 70);

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (11, 'Abra', 5, 25, 20, 15);

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (12, 'Pidgey', 6, 40, 45, 40);

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (13, 'Growlithe', 1, 55, 70, 45);

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (14, 'Horsea', 2, 30, 40, 70);

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (15, 'Bellsprout', 3, 50, 75, 35);

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (16, 'Voltorb', 4, 40, 30, 50);

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (17, 'Drowzee', 5, 60, 48, 45);

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (18, 'Spearow', 6, 40, 60, 30);
