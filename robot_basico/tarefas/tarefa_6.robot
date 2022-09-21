*** Settings ***
Documentation    Exercício IF e FOR
 
*** Variables ***
@{NUMEROS}       1    2    3    4    5    6    10    11
 
*** Test Cases ***
Imprimir apenas alguns números
  Imprimir numero 5 e 10
 
*** Keywords ***
Imprimir numero 5 e 10
  Log To Console  ${\n}
 
  FOR    ${numero}    IN   @{NUMEROS}
      IF  ${numero} == 5
          Log To Console    Número 5!
      ELSE IF  ${numero} == 10
          Log To Console    Número 10!
      ELSE
          Log To Console    ${numero} É Diferente de 5 e 10!
      END
  END
 
  Log To Console  ${\n}
  