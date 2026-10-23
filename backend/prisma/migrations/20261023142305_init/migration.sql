-- CreateTable
CREATE TABLE `Usuario` (
    `id_usuario` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `senha` VARCHAR(100) NOT NULL,

    UNIQUE INDEX `Usuario_email_key`(`email`),
    PRIMARY KEY (`id_usuario`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `MovimentacaoEstoque` (
    `id_movimentacao` INTEGER NOT NULL AUTO_INCREMENT,
    `id_disco` INTEGER NOT NULL,
    `id_usuario` INTEGER NOT NULL,
    `tipo_movimentacao` ENUM('entrada', 'saida') NOT NULL DEFAULT 'saida',
    `quantidade` INTEGER NOT NULL,
    `data_movimentacao` DATE NOT NULL,
    `observacao` VARCHAR(250) NULL,

    PRIMARY KEY (`id_movimentacao`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Disco` (
    `id_disco` INTEGER NOT NULL AUTO_INCREMENT,
    `titulo` VARCHAR(150) NOT NULL,
    `artista` VARCHAR(100) NOT NULL,
    `genero` VARCHAR(50) NOT NULL,
    `preco_custo` DECIMAL(10, 2) NOT NULL,
    `preco_venda` DECIMAL(10, 2) NOT NULL,
    `quantidade_estoque` INTEGER NOT NULL,
    `estoque_minimo` INTEGER NOT NULL,

    PRIMARY KEY (`id_disco`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `MovimentacaoEstoque` ADD CONSTRAINT `MovimentacaoEstoque_id_disco_fkey` FOREIGN KEY (`id_disco`) REFERENCES `Disco`(`id_disco`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MovimentacaoEstoque` ADD CONSTRAINT `MovimentacaoEstoque_id_usuario_fkey` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario`(`id_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE;
