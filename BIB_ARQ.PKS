CREATE OR REPLACE 
PACKAGE BIB_ARQ AS
/**
 * Biblioteca para manipulacao de arquivos, diretorios e campos
 */
--------------------------------------------------------------------------
-- AUTHOR: ORLANDO DIAS
-- BIBLIOTECA PARA MANIPULACAO DE ARQUIVOS, DIRETORIOS e CAMPOS
--------------------------------------------------------------------------

--------------------------------------------------------------------------
-- EXTRAI UM CAMPO DE UMA LINHA DE UM ARQUIVO CSV
--------------------------------------------------------------------------
/**
 * Extrai o conteúdo entre a posição inicial (e_posIni) e o próximo separarador (e_separador).
 * %param e_linha     LINHA DA QUAL O CAMPO DEVE SER EXTRAIDO
 * %param e_separador Caractere separador
 * %param e_posIni    Posicao inicial
 * %param s_campo     Campo extraido
 * %param s_tamanho   Tamanho do campo extraido
 * %param s_posFin    Posicao do proximo separador
 */
PROCEDURE pExtraicampo
(e_linha      IN  VARCHAR2,               --LINHA DA QUAL O CAMPO DEVE SER EXTRAIDO
 e_separador  IN  VARCHAR2,               --CARACTERE SEPARADOR
 e_posIni     IN  INTEGER,                --POSICAO INICIAL
 s_campo      OUT VARCHAR2,               --CAMPO EXTRAIDO
 s_tamanho    OUT INTEGER,                --TAMANHOCAMPO EXTRAIDO
 s_posFin     OUT INTEGER);               --POSICAO DO PROXIMO SEPARADOR


END BIB_ARQ;

/
SHOW ERRORS;
