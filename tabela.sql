-- Tabela Produto
CREATE TABLE Produto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10,2),
    data_cadastro DATE
);

-- Tabela log_preço_produto
CREATE TABLE log_preço_produto (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    preco_antigo DECIMAL(10,2),
    preco_novo DECIMAL(10,2),
    data TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_produto) REFERENCES Produto(id)
);

-- Procedure para selecionar o ultimo preço editado
DELIMITER //

CREATE PROCEDURE SelecionarUltimoPrecoEditado(IN produto_id INT, OUT antigo_preco DECIMAL(10,2), OUT novo_preco DECIMAL(10,2), OUT data TIMESTAMP)
BEGIN
    SELECT preco_antigo, preco_novo, data
    INTO antigo_preco, novo_preco, data
    FROM log_preço_produto
    WHERE id_produto = produto_id
    ORDER BY data DESC
    LIMIT 1;
END //

DELIMITER ;

-- Trigger para registrar alterações de preço na tabela log_preço_produto
DELIMITER //

CREATE TRIGGER Registro_Preco_Produto_After_Update
AFTER UPDATE ON Produto
FOR EACH ROW
BEGIN
    IF OLD.preco != NEW.preco THEN
        INSERT INTO log_preço_produto (id_produto, preco_antigo, preco_novo)
        VALUES (OLD.id, OLD.preco, NEW.preco);
    END IF;
END //

DELIMITER ;

