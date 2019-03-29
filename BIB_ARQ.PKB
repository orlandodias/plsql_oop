CREATE OR REPLACE 
PACKAGE BODY BIB_ARQ AS
--------------------------------------------------------------------------
-- A2S INFORMATICA LTDA
-- BIBLIOTECA PARA MANIPULACAO DE ARQUIVOS E DIRETORIOS
--------------------------------------------------------------------------

--------------------------------------------------------------------------
-- EXTRAI UM CAMPO DE UMA LINHA DE UM ARQUIVO CSV
--------------------------------------------------------------------------
PROCEDURE pExtraicampo
(e_linha      IN  VARCHAR2,               --LINHA DA QUAL O CAMPO DEVE SER EXTRAIDO
 e_separador  IN  VARCHAR2,               --CARACTERE SEPARADOR
 e_posIni     IN  INTEGER,                --POSICAO INICIAL
 s_campo      OUT VARCHAR2,               --CAMPO EXTRAIDO
 s_tamanho    OUT INTEGER,                --TAMANHOCAMPO EXTRAIDO
 s_posFin     OUT INTEGER)                --POSICAO DO PROXIMO SEPARADOR
IS
BEGIN
   s_posFin := INSTR(e_linha,e_separador,e_posIni);
   IF s_posFin = 0 THEN
      s_tamanho := LENGTH(e_linha) - e_posIni + 1;
      s_posFin  := LENGTH(e_linha);
   ELSE
      s_tamanho := s_posFin - e_posIni;
   END IF;
   s_campo  := SUBSTR(e_linha,e_posIni,s_tamanho);
   IF SUBSTR(s_campo,1,1) = '""' AND SUBSTR(s_campo,s_tamanho,1) = '""' THEN
      s_campo := SUBSTR(s_campo,2,s_tamanho-2);
   ELSIF SUBSTR(s_campo,1,1) = '""' THEN
      s_campo := SUBSTR(s_campo,2,s_tamanho);
   ELSIF SUBSTR(s_campo,s_tamanho,1) = '""' THEN
      s_campo := SUBSTR(s_campo,1,s_tamanho-1);
   END IF;
   s_tamanho := LENGTH(s_campo);
END pExtraicampo;

--------------------------------------------------------------------------
-- AJUSTA BARRAS DO NOME DO DIRETORIO, TORNANDO-OS UNIX LIKE
--------------------------------------------------------------------------
FUNCTION fAjustaNome
(e_nmDir    IN VARCHAR2)
RETURN VARCHAR2
IS
 v_nmDir VARCHAR2(500);
BEGIN
   v_nmDir := REPLACE(TRIM(e_nmDir),'\','/');
   RETURN v_nmDir;
END;

--------------------------------------------------------------------------
-- CRIA DIRETORIO
--------------------------------------------------------------------------
PROCEDURE MKDIR
(e_nmDirInt IN VARCHAR2,
 e_nmDirExt IN VARCHAR2)
IS
 v_de       VARCHAR2(200);
 v_nmDir    VARCHAR2(500);
 v_deSql    VARCHAR2(2000);
BEGIN
   v_nmDir := fAjustaNome(e_nmDirExt);
   v_deSql := 'CREATE DIRECTORY ' || e_nmDirInt || ' AS ''' || v_nmDir || '''';
   EXECUTE IMMEDIATE v_deSql;
EXCEPTION
   WHEN OTHERS THEN
      v_de := SQLERRM;
END;

--------------------------------------------------------------------------
-- REMOVE DIRETORIO
--------------------------------------------------------------------------
PROCEDURE RMDIR
(e_nmDirInt IN VARCHAR2)
IS
BEGIN
   NULL;
END;

--------------------------------------------------------------------------
-- RENOMEIA DIRETORIO
--------------------------------------------------------------------------
PROCEDURE RENDIR
(e_nmDirInt IN VARCHAR2)
IS
BEGIN
   NULL;
END;

--------------------------------------------------------------------------
-- ELIMINA ARQUIVO
--------------------------------------------------------------------------
PROCEDURE DELARQ
(e_nmDir    IN VARCHAR2,
 e_nmArq    IN VARCHAR2)
IS
BEGIN
   NULL;
END;


--------------------------------------------------------------------------
-- RENOMEIA ARQUIVO
--------------------------------------------------------------------------
PROCEDURE RENARQ
(e_nmDir    IN VARCHAR2,
 e_nmArq    IN VARCHAR2)
IS
BEGIN
   NULL;
END;

END BIB_ARQ;

/
SHOW ERRORS;
