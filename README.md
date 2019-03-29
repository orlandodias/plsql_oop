# plsql_oop
Demonstração de OOP em PL/SQL

Apresentação da implementação dos conceitos de abstração, encapsulamento, herança e associação em ORACLE PL/SQL conforme demonstrado no artigo https://www.linkedin.com/pulse/conceitos-de-oop-em-plsql-orlando-dias/.

As extensões significam:
PKS - PACKAGE SPECIFICATION
PKB - PACKAGE BODY
TYS - TYPE SPECIFICATION
TYB - TYPE BODY

Para executar é necessário alterar o parâmetro UTL_FILE_DIR do banco de dados. Com um usuário DBA (SYSTEM, por exemplo) emita o comando:
ALTER SYSTEM SET UTL_FILE_DIR=* SCOPE='SPFILE';
      Este comando indica para o Oracle que o UTL_FILE_DIR pode alcançar (para leitura e escrita) qualquer pasta do computador.
      Caso queira uma ou mais pastas: ALTER SYSTEM SET UTL_FILE_DIR='pasta1, pasta2, pastan' SCOPE='SPFILE';
Após a emissão do comando reinicie o serviço do BD.
Para verificação se a alteração foi bem sucedida, emita o comando abaixo:
SHOW PARAMETER UTL_FILE_DIR;

Para executar os testes, use a PROCEDURE MAIN do PACKAGE PKG_TESTE.

