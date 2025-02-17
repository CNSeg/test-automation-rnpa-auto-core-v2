#language: pt
@rnpa-auto-v2
@post-apolices
@regression

Funcionalidade: Criação de apolices do RNPA Auto V2

#    Contexto: Geração de token
#        Dado a chamada do endpoint do access token



# ************************************************************** INDIVIDUAL **************************************************************

# -------------------------------------------------------------- Sucesso --------------------------------------------------------------------

    @CT1-post-apolices 
    Cenário: CT1.<casoDeTeste> - Sucesso - Criação de apólice | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "documentoSegurado" dos dados da apólice tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "202"
        E a resposta deve ser igual ao corpo da requisição
        Exemplos:
            | casoDeTeste | valor          | statusCode | descricao             |
            | 1           | 41170178880    | 202        | Com CPF               |
            | 2           | 04701692000156 | 202        | Com CNPJ              |
            | 3           | 12ABC34501DE35 | 202        | Com CNPJ alfanumérico |

# -------------------------------------------------------------- Validação dos dados de entrada --------------------------------------------------------------------

#dadosDaApolice
    #dadosDaApolice
    @CT2-post-apolices
    Esquema do Cenário: CT2.<casoDeTeste> - Falha - Validação do campo "dadosDaApolice" | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "dadosDaApolice" do request body tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor        | statusCode | codigo  | mensagem                                                               | descricao         |
            | 1           | nulo         | 400        | 400.001 | O campo `dadosDaApolice` não pode ser nulo ou em branco.               | Com valor nulo    |
            | 2           | string vazia | 400        | 400.000 | Requisição inválida.                                                   | Com string vazia  |
            | 3           | array vazio  | 400        | 400.000 | Requisição inválida.                                                   | Como array vazio  |
            | 4           | objeto vazio | 400        | 400.001 | O campo `dadosDaApolice.numeroApolice` não pode ser nulo ou em branco. | Como objeto vazio |
    
    # nomeSeguradora
    @CT3-post-apolices
    Esquema do Cenário: CT3.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "nomeSeguradora" | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "nomeSeguradora" dos dados da apólice tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor          | statusCode | codigo  | mensagem                                                                  | descricao                       |
            | 1           | 201 caracteres | 400        | 400.003 | O campo `dadosDaApolice.nomeSeguradora` deve ser inferior ou igual à 200. | Com limite MÁXIMO de caracteres |
            | 2           | string vazia   | 400        | 400.001 | O campo `dadosDaApolice.nomeSeguradora` não pode ser nulo ou em branco.   | Com string vazia                |
            | 3           | nulo           | 400        | 400.001 | O campo `dadosDaApolice.nomeSeguradora` não pode ser nulo ou em branco.   | Com valor nulo                  |
            | 4           | objeto vazio   | 400        | 400.000 | Requisição inválida.                                                      | Como objeto vazio               |
            | 5           | array vazio    | 400        | 400.000 | Requisição inválida.                                                      | Como array vazio                |

    # numeroApolice
    @CT4-post-apolices
    Esquema do Cenário: CT4.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "numeroApolice" | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "numeroApolice" dos dados da apólice tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor         | statusCode | codigo  | mensagem                                                                | descricao                       |
            | 1           | 21 caracteres | 400        | 400.003 | O campo `dadosDaApolice.numeroApolice` deve ser inferior ou igual à 20. | Com limite MÁXIMO de caracteres |
            | 2           | string vazia  | 400        | 400.001 | O campo `dadosDaApolice.numeroApolice` não pode ser nulo ou em branco.  | Com string vazia                |
            | 3           | nulo          | 400        | 400.001 | O campo `dadosDaApolice.numeroApolice` não pode ser nulo ou em branco.  | Com valor nulo                  |
            | 4           | objeto vazio  | 400        | 400.000 | Requisição inválida.                                                    | Como objeto vazio               |
            | 5           | array vazio   | 400        | 400.000 | Requisição inválida.                                                    | Como array vazio                |

    # codigoSegmento
    @CT5-post-apolices
    Esquema do Cenário: CT5.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "codigoSegmento" | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "codigoSegmento" dos dados da apólice tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor         | statusCode | codigo  | mensagem                                                                 | descricao                       |
            | 1           | 21 caracteres | 400        | 400.003 | O campo `dadosDaApolice.codigoSegmento` deve ser inferior ou igual à 20. | Com limite MÁXIMO de caracteres |
            | 2           | string vazia  | 400        | 400.001 | O campo `dadosDaApolice.codigoSegmento` não pode ser nulo ou em branco.  | Com string vazia                |
            | 3           | nulo          | 400        | 400.001 | O campo `dadosDaApolice.codigoSegmento` não pode ser nulo ou em branco.  | Com valor nulo                  |
            | 4           | objeto vazio  | 400        | 400.000 | Requisição inválida.                                                     | Como objeto vazio               |
            | 5           | array vazio   | 400        | 400.000 | Requisição inválida.                                                     | Como array vazio                |

    # documentoSegurado
    @CT6-post-apolices 
    Esquema do Cenário: CT6.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "documentoSegurado" | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "documentoSegurado" dos dados da apólice tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor              | statusCode | codigo  | mensagem                                                                   | descricao                                            |
            | 1           | 33460526051        | 400        | 400.019 | Documento inválido.                                                        | Com CPF inválido                                     |
            | 2           | 334.605.260-50     | 400        | 400.019 | Documento inválido.                                                        | Com CPF válido com os dígitos da máscara             |
            | 3           | 334.605.260-51     | 400        | 400.019 | Documento inválido.                                                        | Com CPF inválido com os dígitos da máscara           |
            | 4           | 3346052605         | 400        | 400.019 | Documento inválido.                                                        | Com valor de 12 números                              |
            | 5           | 334605260512       | 400        | 400.019 | Documento inválido.                                                        | Com valor de 10 números                              |
            | 6           | 64554367000131     | 400        | 400.019 | Documento inválido.                                                        | Com CNPJ inválido                                    |
            | 7           | 64.554.367/0001-30 | 400        | 400.019 | Documento inválido.                                                        | Com CPNJ válido com os dígitos da máscara            |
            | 8           | 64.554.367/0001-31 | 400        | 400.019 | Documento inválido.                                                        | Com CPNJ inválido com os dígitos da máscara          |
            | 9           | 6455436700013      | 400        | 400.019 | Documento inválido.                                                        | Com valor de 13 números                              |
            | 10          | 645543670001312    | 400        | 400.019 | Documento inválido.                                                        | Com valor de 15 números                              |
            | 11          | string vazia       | 400        | 400.001 | O campo `dadosDaApolice.documentoSegurado` não pode ser nulo ou em branco. | Com string vazia                                     |
            | 12          | nulo               | 400        | 400.001 | O campo `dadosDaApolice.documentoSegurado` não pode ser nulo ou em branco. | Com valor nulo                                       |
            | 13          | 12@BC34501DE35     | 400        | 400.019 | Documento inválido.                                                        | CNPJ alfanumérico com caractere especial             |
            | 14          | 12ABC34501DE34     | 400        | 400.019 | Documento inválido.                                                        | CNPJ alfanumérico com digito verificador inválido    |
            | 15          | 12.ABC.345/01DE-35 | 400        | 400.019 | Documento inválido.                                                        | CNPJ alfanumérico válido com os dígitos da máscara   |
            | 16          | 12.ABC.345/01DE-34 | 400        | 400.019 | Documento inválido.                                                        | CNPJ alfanumérico inválido com os dígitos da máscara |
            | 17          | objeto vazio       | 400        | 400.000 | Requisição inválida.                                                       | Como objeto vazio                                    |
            | 18          | array vazio        | 400        | 400.000 | Requisição inválida.                                                       | Como array vazio                                     |

    # dataEmissao     
    @CT7-post-apolices
    Esquema do Cenário: CT7.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "dataEmissao"  | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "dataEmissao" dos dados da apólice tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor        | statusCode | codigo  | mensagem                                                             | descricao                              |
            | 1           | 2025-15-01   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                            | Data no padrão YYYY-DD-MM              |
            | 2           | 15-01-2025   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                            | Data no padrão DD-MM-YYYY              |
            | 3           | 15-2025-01   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                            | Data no padrão DD-YYYY                 |
            | 4           | YYYY-MM-DD   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                            | Data com letras, no padrão YYYY-MM-DD  |
            | 5           | YYYY-DD-MM   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                            | Data com letras, Tno padrão YYYY-DD-MM |
            | 6           | DD-MM-YYYY   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                            | Data com letras, no padrão DD-MM-YYYY  |
            | 7           | DD-YYYY-MM   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                            | Data com letras, no padrão DD-YYYY-MM  |
            | 8           | 20250115     | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                            | Data sem hífen                         |
            | 9           | string vazia | 400        | 400.001 | O campo `dadosDaApolice.dataEmissao` não pode ser nulo ou em branco. | Com string vazia                       |
            | 10          | nulo         | 400        | 400.001 | O campo `dadosDaApolice.dataEmissao` não pode ser nulo ou em branco. | Com valor nulo                         |
            | 11          | objeto vazio | 400        | 400.000 | Requisição inválida.                                                 | Como objeto vazio                      |
            | 12          | array vazio  | 400        | 400.000 | Requisição inválida.                                                 | Como array vazio                       |
    
    # dataInicioVigencia
    @CT8-post-apolices
    Esquema do Cenário: CT8.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "dataInicioVigencia" | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "dataInicioVigencia" dos dados da apólice tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor        | statusCode | codigo  | mensagem                                                                    | descricao                              |
            | 1           | 2025-15-01   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                                   | Data no padrão YYYY-DD-MM              |
            | 2           | 15-01-2025   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                                   | Data no padrão DD-MM-YYYY              |
            | 3           | 15-2025-01   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                                   | Data no padrão DD-YYYY                 |
            | 4           | YYYY-MM-DD   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                                   | Data com letras, no padrão YYYY-MM-DD  |
            | 5           | YYYY-DD-MM   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                                   | Data com letras, Tno padrão YYYY-DD-MM |
            | 6           | DD-MM-YYYY   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                                   | Data com letras, no padrão DD-MM-YYYY  |
            | 7           | DD-YYYY-MM   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                                   | Data com letras, no padrão DD-YYYY-MM  |
            | 8           | 20250115     | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                                   | Data sem hífen                         |
            | 9           | string vazia | 400        | 400.001 | O campo `dadosDaApolice.dataInicioVigencia` não pode ser nulo ou em branco. | Com string vazia                       |
            | 10          | nulo         | 400        | 400.001 | O campo `dadosDaApolice.dataInicioVigencia` não pode ser nulo ou em branco. | Com valor nulo                         |
            | 11          | objeto vazio | 400        | 400.000 | Requisição inválida.                                                        | Como objeto vazio                      |
            | 12          | array vazio  | 400        | 400.000 | Requisição inválida.                                                        | Como array vazio                       |
    
    # dataFimVigencia
    @CT9-post-apolices
    Esquema do Cenário: CT9.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "dataFimVigencia" | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "dataFimVigencia" dos dados da apólice tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor        | statusCode | codigo  | mensagem                                                                 | descricao                              |
            | 1           | 2025-15-01   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                                | Data no padrão YYYY-DD-MM              |
            | 2           | 15-01-2025   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                                | Data no padrão DD-MM-YYYY              |
            | 3           | 15-2025-01   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                                | Data no padrão DD-YYYY                 |
            | 4           | YYYY-MM-DD   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                                | Data com letras, no padrão YYYY-MM-DD  |
            | 5           | YYYY-DD-MM   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                                | Data com letras, Tno padrão YYYY-DD-MM |
            | 6           | DD-MM-YYYY   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                                | Data com letras, no padrão DD-MM-YYYY  |
            | 7           | DD-YYYY-MM   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                                | Data com letras, no padrão DD-YYYY-MM  |
            | 8           | 20250115     | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                                | Data sem hífen                         |
            | 9           | string vazia | 400        | 400.001 | O campo `dadosDaApolice.dataFimVigencia` não pode ser nulo ou em branco. | Com string vazia                       |
            | 10          | nulo         | 400        | 400.001 | O campo `dadosDaApolice.dataFimVigencia` não pode ser nulo ou em branco. | Com valor nulo                         |
            | 11          | objeto vazio | 400        | 400.000 | Requisição inválida.                                                     | Como objeto vazio                      |
            | 12          | array vazio  | 400        | 400.000 | Requisição inválida.                                                     | Como array vazio                       |

    # cepSegurado
    @CT10-post-apolices 
    Esquema do Cenário: CT10.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "cepSegurado" | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "cepSegurado" dos dados da apólice tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor        | statusCode | codigo  | mensagem                                                             | descricao              |
            | 1           | 123456789    | 400        | 400.015 | Campo `dadosDaApolice.cepSegurado` inválido.                         | Com valor de 9 números |
            | 2           | 1234567      | 400        | 400.015 | Campo `dadosDaApolice.cepSegurado` inválido.                         | Com valor de 7 números |
            | 3           | abcdefghi    | 400        | 400.015 | Campo `dadosDaApolice.cepSegurado` inválido.                         | Com 9 letras           |
            | 4           | abcdefg      | 400        | 400.015 | Campo `dadosDaApolice.cepSegurado` inválido.                         | Com 7 letras           |
            | 5           | string vazia | 400        | 400.001 | O campo `dadosDaApolice.cepSegurado` não pode ser nulo ou em branco. | Com string vazia       |
            | 6           | nulo         | 400        | 400.001 | O campo `dadosDaApolice.cepSegurado` não pode ser nulo ou em branco. | Com valor nulo         |
            | 7           | objeto vazio | 400        | 400.000 | Requisição inválida.                                                 | Como objeto vazio      |
            | 8           | array vazio  | 400        | 400.000 | Requisição inválida.                                                 | Como array vazio       |

    # cepPernoite
    @CT11-post-apolices 
    Esquema do Cenário: CT11.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "cepPernoite" | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "cepPernoite" dos dados da apólice tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor        | statusCode | codigo  | mensagem                                     | descricao              |
            | 1           | 123456789    | 400        | 400.015 | Campo `dadosDaApolice.cepPernoite` inválido. | Com valor de 9 números |
            | 2           | 1234567      | 400        | 400.015 | Campo `dadosDaApolice.cepPernoite` inválido. | Com valor de 7 números |
            | 3           | abcdefghi    | 400        | 400.015 | Campo `dadosDaApolice.cepPernoite` inválido. | Com 9 letras           |
            | 4           | abcdefg      | 400        | 400.015 | Campo `dadosDaApolice.cepPernoite` inválido. | Com 7 letras           |
            | 5           | string vazia | 400        | 400.015 | Campo `dadosDaApolice.cepPernoite` inválido. | Com string vazia       |
            | 6           | objeto vazio | 400        | 400.000 | Requisição inválida.                         | Como objeto vazio      |
            | 7           | array vazio  | 400        | 400.000 | Requisição inválida.                         | Como array vazio       |

    # codigoOperacao
    @CT12-post-apolices
    Esquema do Cenário: CT12.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "codigoOperacao" | <descricao> 
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "codigoOperacao" dos dados da apólice tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor        | statusCode | codigo  | mensagem                                                                                                                                                                                                                               | descricao                 |
            | 1           | NOVA APOLICE | 400        | 400.018 | O valor enviado para o campo `dadosDaApolice.codigoOperacao` é inválido. Valores aceitos: NOVO_SEGURO, RENOVACAO_PROPRIA, RENOVACAO_CONGENERE, ENDOSSO_SUBSTITUICAO, ENDOSSO_ALTERACAO, ENDOSSO_CANCELAMENTO, ENDOSSO_INCLUSAO_ITEM, ENDOSSO_EXCLUSAO_ITEM. | Com operação em maiúsculo |
            | 2           | string vazia | 400        | 400.001 | O campo `dadosDaApolice.codigoOperacao` não pode ser nulo ou em branco.                                                                                                                                                                                       | Com string vazia          |
            | 3           | nulo         | 400        | 400.001 | O campo `dadosDaApolice.codigoOperacao` não pode ser nulo ou em branco.                                                                                                                                                                                       | Com valor nulo            |
            | 4           | objeto vazio | 400        | 400.000 | Requisição inválida.                                                                                                                                                                                                                   | Como objeto vazio         |
            | 5           | array vazio  | 400        | 400.000 | Requisição inválida.                                                                                                                                                                                                                   | Como array vazio          |
    
    # cpfCondutor
    @CT13-post-apolices 
    Esquema do Cenário: CT13.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "cpfCondutor" | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "cpfCondutor" dos dados da apólice tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor          | statusCode | codigo  | mensagem             | descricao                                  |
            | 1           | 33460526051    | 400        | 400.019 | Documento inválido.  | Com CPF inválido                           |
            | 2           | 334.605.260-50 | 400        | 400.019 | Documento inválido.  | Com CPF válido com os dígitos da máscara   |
            | 3           | 334.605.260-51 | 400        | 400.019 | Documento inválido.  | Com CPF inválido com os dígitos da máscara |
            | 4           | 3346052605     | 400        | 400.019 | Documento inválido.  | Com valor de 12 números                    |
            | 5           | 334605260512   | 400        | 400.019 | Documento inválido.  | Com valor de 10 números                    |
            | 5           | string vazia   | 400        | 400.019 | Documento inválido.  | Com string vazia                           |
            | 6           | objeto vazio   | 400        | 400.000 | Requisição inválida. | Como objeto vazio                          |
            | 7           | array vazio    | 400        | 400.000 | Requisição inválida. | Como array vazio                           |

    # codigoSusep
    @CT14-post-apolices
    Esquema do Cenário: CT14.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "codigoSusep" | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "codigoSusep" dos dados da apólice tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor        | statusCode | codigo  | mensagem                                                             | descricao         |
            | 1           | nulo         | 400        | 400.001 | O campo `dadosDaApolice.codigoSusep` não pode ser nulo ou em branco. | Com valor nulo    |
            | 2           | objeto vazio | 400        | 400.000 | Requisição inválida.                                                 | Como objeto vazio |
            | 3           | array vazio  | 400        | 400.000 | Requisição inválida.                                                 | Como array vazio  |

    # codigoCobertura
    @CT15-post-apolices
    Esquema do Cenário: CT15.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "codigoCobertura" | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "codigoCobertura" dos dados da apólice tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor        | statusCode | codigo  | mensagem                                                                 | descricao         |
            | 1           | nulo         | 400        | 400.001 | O campo `dadosDaApolice.codigoCobertura` não pode ser nulo ou em branco. | Com valor nulo    |
            | 2           | objeto vazio | 400        | 400.000 | Requisição inválida.                                                     | Como objeto vazio |
            | 3           | array vazio  | 400        | 400.000 | Requisição inválida.                                                     | Como array vazio  |

    # codigoOperacao
    @CT16-post-apolices
    Esquema do Cenário: CT16.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "codigoOperacao" | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "codigoOperacao" dos dados da apólice tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor        | statusCode | codigo  | mensagem                                                                | descricao         |
            | 1           | nulo         | 400        | 400.001 | O campo `dadosDaApolice.codigoOperacao` não pode ser nulo ou em branco. | Com valor nulo    |
            | 2           | objeto vazio | 400        | 400.000 | Requisição inválida.                                                    | Como objeto vazio |
            | 3           | array vazio  | 400        | 400.000 | Requisição inválida.                                                    | Como array vazio  |

    # statusApolice
    @CT17-post-apolices
    Esquema do Cenário: CT17.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "statusApolice" | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "statusApolice" dos dados da apólice tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor        | statusCode | codigo  | mensagem                                                               | descricao         |
            | 1           | nulo         | 400        | 400.001 | O campo `dadosDaApolice.statusApolice` não pode ser nulo ou em branco. | Com valor nulo    |
            | 2           | objeto vazio | 400        | 400.000 | Requisição inválida.                                                   | Como objeto vazio |
            | 3           | array vazio  | 400        | 400.000 | Requisição inválida.                                                   | Como array vazio  |
            | 4           | string vazia | 400        | 400.001 | O campo `dadosDaApolice.statusApolice` não pode ser nulo ou em branco. | Com string vazia  |

    # numeroApoliceAnterior
    @CT18-post-apolices
    Esquema do Cenário: CT18.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "numeroApoliceAnterior" | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "numeroApoliceAnterior" dos dados da apólice tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor        | statusCode | codigo  | mensagem             | descricao         |
            | 1           | objeto vazio | 400        | 400.000 | Requisição inválida. | Como objeto vazio |
            | 2           | array vazio  | 400        | 400.000 | Requisição inválida. | Como array vazio  |

    # nomeSegurado
    @CT19-post-apolices
    Esquema do Cenário: CT19.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "nomeSegurado" | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "nomeSegurado" dos dados da apólice tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor        | statusCode | codigo  | mensagem                                                              | descricao         |
            | 1           | nulo         | 400        | 400.001 | O campo `dadosDaApolice.nomeSegurado` não pode ser nulo ou em branco. | Com valor nulo    |
            | 2           | objeto vazio | 400        | 400.000 | Requisição inválida.                                                  | Como objeto vazio |
            | 3           | array vazio  | 400        | 400.000 | Requisição inválida.                                                  | Como array vazio  |

    # nomeSegurado
    @CT20-post-apolices
    Esquema do Cenário: CT20.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "nomeSegurado" | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "nomeSegurado" dos dados da apólice tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor        | statusCode | codigo  | mensagem                                                              | descricao         |
            | 1           | nulo         | 400        | 400.001 | O campo `dadosDaApolice.nomeSegurado` não pode ser nulo ou em branco. | Com valor nulo    |
            | 2           | objeto vazio | 400        | 400.000 | Requisição inválida.                                                  | Como objeto vazio |
            | 3           | array vazio  | 400        | 400.000 | Requisição inválida.                                                  | Como array vazio  |

    # estadoSegurado
    @CT21-post-apolices
    Esquema do Cenário: CT21.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "estadoSegurado" | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "estadoSegurado" dos dados da apólice tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor        | statusCode | codigo  | mensagem                                                                | descricao         |
            | 1           | nulo         | 400        | 400.001 | O campo `dadosDaApolice.estadoSegurado` não pode ser nulo ou em branco. | Com valor nulo    |
            | 2           | objeto vazio | 400        | 400.000 | Requisição inválida.                                                    | Como objeto vazio |
            | 3           | array vazio  | 400        | 400.000 | Requisição inválida.                                                    | Como array vazio  |

    # estadoSegurado
    @CT22-post-apolices
    Esquema do Cenário: CT22.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "estadoSegurado" | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "estadoSegurado" dos dados da apólice tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor        | statusCode | codigo  | mensagem             | descricao         |
            | 1           | objeto vazio | 400        | 400.000 | Requisição inválida. | Como objeto vazio |
            | 2           | array vazio  | 400        | 400.000 | Requisição inválida. | Como array vazio  |

# itens
    # itens
    @CT23-post-apolices
    Esquema do Cenário: CT23.<casoDeTeste> - Falha - Validação do campo "itens" | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "itens" do request body tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor        | statusCode | codigo  | mensagem                                        | descricao         |
            | 1           | nulo         | 400        | 400.001 | O campo `itens` não pode ser nulo ou em branco. | Com valor nulo    |
            | 2           | array vazio  | 400        | 400.001 | O campo `itens` não pode ser nulo ou em branco. | Como array vazio  |
            | 3           | string vazia | 400        | 400.000 | Requisição inválida.                            | Com string vazia  |
            | 4           | objeto vazio | 400        | 400.000 | Requisição inválida.                            | Como objeto vazio |

    # numeroItem 
    @CT24-post-apolices
    Esquema do Cenário: CT24.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "numeroItem" | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "numeroItem" dos dados do veículo tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor             | statusCode | codigo  | mensagem                                                      | descricao                            |
            | 1           | nulo              | 400        | 400.001 | O campo `itens[0].numeroItem` não pode ser nulo ou em branco. | Com valor nulo                       |
            | 2           | string vazia      | 400        | 400.001 | O campo `itens[0].numeroItem` não pode ser nulo ou em branco. | Com string vazia                     |
            | 3           | negativo          | 400        | 400.000 | Requisição inválida.                                          | Com valor negativo                   |
            | 4           | limite de inteiro | 400        | 400.000 | Requisição inválida.                                          | Com valor acima do limite de inteiro |
            | 5           | booleano          | 400        | 400.000 | Requisição inválida.                                          | Com valor booleano                   |
            | 6           | objeto vazio      | 400        | 400.000 | Requisição inválida.                                          | Como objeto vazio                    |
            | 7           | array vazio       | 400        | 400.000 | Requisição inválida.                                          | Como array vazio                     |
    
    # modeloVeiculo 
    @CT25-post-apolices
    Esquema do Cenário: CT25.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "modeloVeiculo" | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "modeloVeiculo" dos dados do veículo tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor        | statusCode | codigo  | mensagem                                                         | descricao         |
            | 1           | nulo         | 400        | 400.001 | O campo `itens[0].modeloVeiculo` não pode ser nulo ou em branco. | Com valor nulo    |
            | 2           | string vazia | 400        | 400.001 | O campo `itens[0].modeloVeiculo` não pode ser nulo ou em branco. | Com string vazia  |
            | 3           | objeto vazio | 400        | 400.000 | Requisição inválida.                                             | Como objeto vazio |
            | 4           | array vazio  | 400        | 400.000 | Requisição inválida.                                             | Como array vazio  |
    
    # codigoFipe
    @CT26-post-apolices
    Esquema do Cenário: CT26.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "codigoFipe" | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "codigoFipe" dos dados do veículo tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor        | statusCode | codigo  | mensagem                                                      | descricao              |
            | 1           | nulo         | 400        | 400.001 | O campo `itens[0].codigoFipe` não pode ser nulo ou em branco. | Com valor nulo         |
            | 2           | string vazia | 400        | 400.001 | O campo `itens[0].codigoFipe` não pode ser nulo ou em branco. | Com string vazia       |
            | 3           | 123456789    | 400        | 400.015 | Campo `itens[0].codigoFipe` inválido.                         | Com valor de 9 números |
            | 4           | 1234567      | 400        | 400.015 | Campo `itens[0].codigoFipe` inválido.                         | Com valor de 7 números |
            | 5           | objeto vazio | 400        | 400.000 | Requisição inválida.                                          | Como objeto vazio      |
            | 6           | array vazio  | 400        | 400.000 | Requisição inválida.                                          | Como array vazio       |
    
    # anoFabricacao 
    @CT27-post-apolices
    Esquema do Cenário: CT27.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "anoFabricacao" | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "anoFabricacao" dos dados do veículo tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor             | statusCode | codigo  | mensagem                                                         | descricao                            |
            | 1           | nulo              | 400        | 400.001 | O campo `itens[0].anoFabricacao` não pode ser nulo ou em branco. | Com valor nulo                       |
            | 2           | string vazia      | 400        | 400.001 | O campo `itens[0].anoFabricacao` não pode ser nulo ou em branco. | Com string vazia                     |
            | 3           | negativo          | 400        | 400.000 | Requisição inválida.                                             | Com valor negativo                   |
            | 4           | limite de inteiro | 400        | 400.000 | Requisição inválida.                                             | Com valor acima do limite de inteiro |
            | 5           | booleano          | 400        | 400.000 | Requisição inválida.                                             | Com valor booleano                   |
            | 6           | objeto vazio      | 400        | 400.000 | Requisição inválida.                                             | Como objeto vazio                    |
            | 7           | array vazio       | 400        | 400.000 | Requisição inválida.                                             | Como array vazio                     |
   
    # anoModelo 
    @CT28-post-apolices
    Esquema do Cenário: CT28.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "anoModelo" | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "anoModelo" dos dados do veículo tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor             | statusCode | codigo  | mensagem                                                     | descricao                            |
            | 1           | nulo              | 400        | 400.001 | O campo `itens[0].anoModelo` não pode ser nulo ou em branco. | Com valor nulo                       |
            | 2           | string vazia      | 400        | 400.001 | O campo `itens[0].anoModelo` não pode ser nulo ou em branco. | Com string vazia                     |
            | 3           | negativo          | 400        | 400.000 | Requisição inválida.                                         | Com valor negativo                   |
            | 4           | limite de inteiro | 400        | 400.000 | Requisição inválida.                                         | Com valor acima do limite de inteiro |
            | 5           | booleano          | 400        | 400.000 | Requisição inválida.                                         | Com valor booleano                   |
            | 6           | objeto vazio      | 400        | 400.000 | Requisição inválida.                                         | Como objeto vazio                    |
            | 7           | array vazio       | 400        | 400.000 | Requisição inválida.                                         | Como array vazio                     |
   

    # veiculoZeroKm 
    @CT29-post-apolices
    Esquema do Cenário: CT29.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "veiculoZeroKm" | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "veiculoZeroKm" dos dados do veículo tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor        | statusCode | codigo  | mensagem                                                         | descricao         |
            | 1           | nulo         | 400        | 400.001 | O campo `itens[0].veiculoZeroKm` não pode ser nulo ou em branco. | Com valor nulo    |
            | 2           | string vazia | 400        | 400.001 | O campo `itens[0].veiculoZeroKm` não pode ser nulo ou em branco. | Com string vazia  |
            | 3           | objeto vazio | 400        | 400.000 | Requisição inválida.                                             | Como objeto vazio |
            | 4           | array vazio  | 400        | 400.000 | Requisição inválida.                                             | Como array vazio  |
    
    # placaVeiculo
    @CT30-post-apolices
    Esquema do Cenário: CT30.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "placaVeiculo" | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "placaVeiculo" dos dados do veículo tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor        | statusCode | codigo  | mensagem                                | descricao                             |
            | 1           | AAA-1234     | 400        | 400.015 | Campo `itens[0].placaVeiculo` inválido. | Padrão Brasileiro com hífen           |
            | 2           | AAA-1A23     | 400        | 400.015 | Campo `itens[0].placaVeiculo` inválido. | Padrão Mercosul com hífen             |
            | 3           | aaa-1234     | 400        | 400.015 | Campo `itens[0].placaVeiculo` inválido. | Padrão Brasileiro em MINÚSCULO        |
            | 4           | aaa1a23      | 400        | 400.015 | Campo `itens[0].placaVeiculo` inválido. | Padrão Mercosul em MINÚSCULO          |
            | 5           | AAABBBB      | 400        | 400.015 | Campo `itens[0].placaVeiculo` inválido. | Somente letras em MAIÚSCULO sem HÍFEN |
            | 6           | aaabbbb      | 400        | 400.015 | Campo `itens[0].placaVeiculo` inválido. | Somente letras em MINÚSCULO sem HÍFEN |
            | 7           | AAA-BBBB     | 400        | 400.015 | Campo `itens[0].placaVeiculo` inválido. | Somente letras em MAIÚSCULO com HÍFEN |
            | 8           | aaa-bbbb     | 400        | 400.015 | Campo `itens[0].placaVeiculo` inválido. | Somente letras em MINÚSCULO com HÍFEN |
            | 9           | 1234567      | 400        | 400.015 | Campo `itens[0].placaVeiculo` inválido. | Somente números sem HÍFEN             |
            | 10          | 123-4567     | 400        | 400.015 | Campo `itens[0].placaVeiculo` inválido. | Somente números com HÍFEN             |
            | 11          | objeto vazio | 400        | 400.000 | Requisição inválida.                    | Como objeto vazio                     |
            | 12          | array vazio  | 400        | 400.000 | Requisição inválida.                    | Como array vazio                      |
    
    # chassiVeiculo
    @CT31-post-apolices
    Esquema do Cenário: CT31.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "chassiVeiculo" | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "chassiVeiculo" dos dados do veículo tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor              | statusCode | codigo  | mensagem                                                         | descricao               |
            | 1           | 123456789012345678 | 400        | 400.015 | Campo `itens[0].chassiVeiculo` inválido.                         | Com valor de 18 números |
            | 2           | 1234567890123456   | 400        | 400.015 | Campo `itens[0].chassiVeiculo` inválido.                         | Com valor de 16 números |
            | 3           | string vazia       | 400        | 400.001 | O campo `itens[0].chassiVeiculo` não pode ser nulo ou em branco. | Com string vazia        |
            | 4           | nulo               | 400        | 400.001 | O campo `itens[0].chassiVeiculo` não pode ser nulo ou em branco. | Com valor nulo          |
            | 5           | objeto vazio       | 400        | 400.000 | Requisição inválida.                                             | Como objeto vazio       |
            | 6           | array vazio        | 400        | 400.000 | Requisição inválida.                                             | Como array vazio        |
    
    # codigoCategoria
    @CT32-post-apolices
    Esquema do Cenário: CT32.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "codigoCategoria" | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "codigoCategoria" dos dados do veículo tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor        | statusCode | codigo  | mensagem                                                           | descricao         |
            | 1           | nulo         | 400        | 400.001 | O campo `itens[0].codigoCategoria` não pode ser nulo ou em branco. | Com valor nulo    |
            | 2           | string vazia | 400        | 400.001 | O campo `itens[0].codigoCategoria` não pode ser nulo ou em branco. | Com string vazia  |
            | 3           | objeto vazio | 400        | 400.000 | Requisição inválida.                                               | Como objeto vazio |
            | 4           | array vazio  | 400        | 400.000 | Requisição inválida.                                               | Como array vazio  |
    
    # nomeCategoria
    @CT33-post-apolices
    Esquema do Cenário: CT33.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "nomeCategoria" | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "nomeCategoria" dos dados do veículo tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor        | statusCode | codigo  | mensagem                                                         | descricao         |
            | 1           | nulo         | 400        | 400.001 | O campo `itens[0].nomeCategoria` não pode ser nulo ou em branco. | Com valor nulo    |
            | 2           | string vazia | 400        | 400.001 | O campo `itens[0].nomeCategoria` não pode ser nulo ou em branco. | Com string vazia  |
            | 3           | objeto vazio | 400        | 400.000 | Requisição inválida.                                             | Como objeto vazio |
            | 4           | array vazio  | 400        | 400.000 | Requisição inválida.                                             | Como array vazio  |
    
    # dataEmissao     
    @CT34-post-apolices
    Esquema do Cenário: CT34.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "dataEmissao"  | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "dataEmissao" dos dados do veículo tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor        | statusCode | codigo  | mensagem                                                       | descricao                              |
            | 1           | 2025-15-01   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                      | Data no padrão YYYY-DD-MM              |
            | 2           | 15-01-2025   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                      | Data no padrão DD-MM-YYYY              |
            | 3           | 15-2025-01   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                      | Data no padrão DD-YYYY                 |
            | 4           | YYYY-MM-DD   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                      | Data com letras, no padrão YYYY-MM-DD  |
            | 5           | YYYY-DD-MM   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                      | Data com letras, Tno padrão YYYY-DD-MM |
            | 6           | DD-MM-YYYY   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                      | Data com letras, no padrão DD-MM-YYYY  |
            | 7           | DD-YYYY-MM   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                      | Data com letras, no padrão DD-YYYY-MM  |
            | 8           | 20250115     | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                      | Data sem hífen                         |
            | 9           | string vazia | 400        | 400.001 | O campo `itens[0].dataEmissao` não pode ser nulo ou em branco. | Com string vazia                       |
            | 10          | nulo         | 400        | 400.001 | O campo `itens[0].dataEmissao` não pode ser nulo ou em branco. | Com valor nulo                         |
            | 11          | objeto vazio | 400        | 400.000 | Requisição inválida.                                           | Como objeto vazio                      |
            | 12          | array vazio  | 400        | 400.000 | Requisição inválida.                                           | Como array vazio                       |
    
    # dataInicioVigencia
    @CT35-post-apolices
    Esquema do Cenário: CT35.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "dataInicioVigencia" | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "dataInicioVigencia" dos dados do veículo tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor        | statusCode | codigo  | mensagem                                                              | descricao                              |
            | 1           | 2025-15-01   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                             | Data no padrão YYYY-DD-MM              |
            | 2           | 15-01-2025   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                             | Data no padrão DD-MM-YYYY              |
            | 3           | 15-2025-01   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                             | Data no padrão DD-YYYY                 |
            | 4           | YYYY-MM-DD   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                             | Data com letras, no padrão YYYY-MM-DD  |
            | 5           | YYYY-DD-MM   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                             | Data com letras, Tno padrão YYYY-DD-MM |
            | 6           | DD-MM-YYYY   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                             | Data com letras, no padrão DD-MM-YYYY  |
            | 7           | DD-YYYY-MM   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                             | Data com letras, no padrão DD-YYYY-MM  |
            | 8           | 20250115     | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                             | Data sem hífen                         |
            | 9           | string vazia | 400        | 400.001 | O campo `itens[0].dataInicioVigencia` não pode ser nulo ou em branco. | Com string vazia                       |
            | 10          | nulo         | 400        | 400.001 | O campo `itens[0].dataInicioVigencia` não pode ser nulo ou em branco. | Com valor nulo                         |
            | 11          | objeto vazio | 400        | 400.000 | Requisição inválida.                                                  | Como objeto vazio                      |
            | 12          | array vazio  | 400        | 400.000 | Requisição inválida.                                                  | Como array vazio                       |
    
    # dataFimVigencia
    @CT36-post-apolices
    Esquema do Cenário: CT36.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "dataFimVigencia" | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "dataFimVigencia" dos dados do veículo tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor        | statusCode | codigo  | mensagem                                                           | descricao                              |
            | 1           | 2025-15-01   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                          | Data no padrão YYYY-DD-MM              |
            | 2           | 15-01-2025   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                          | Data no padrão DD-MM-YYYY              |
            | 3           | 15-2025-01   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                          | Data no padrão DD-YYYY                 |
            | 4           | YYYY-MM-DD   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                          | Data com letras, no padrão YYYY-MM-DD  |
            | 5           | YYYY-DD-MM   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                          | Data com letras, Tno padrão YYYY-DD-MM |
            | 6           | DD-MM-YYYY   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                          | Data com letras, no padrão DD-MM-YYYY  |
            | 7           | DD-YYYY-MM   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                          | Data com letras, no padrão DD-YYYY-MM  |
            | 8           | 20250115     | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                          | Data sem hífen                         |
            | 9           | string vazia | 400        | 400.001 | O campo `itens[0].dataFimVigencia` não pode ser nulo ou em branco. | Com string vazia                       |
            | 10          | nulo         | 400        | 400.001 | O campo `itens[0].dataFimVigencia` não pode ser nulo ou em branco. | Com valor nulo                         |
            | 11          | objeto vazio | 400        | 400.000 | Requisição inválida.                                               | Como objeto vazio                      |
            | 12          | array vazio  | 400        | 400.000 | Requisição inválida.                                               | Como array vazio                       |
    
    # statusItem
    @CT37-post-apolices
    Esquema do Cenário: CT37.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "statusItem" | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "statusItem" dos dados do veículo tenha o valor "<valor>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor        | statusCode | codigo  | mensagem                                                      | descricao         |
            | 1           | nulo         | 400        | 400.001 | O campo `itens[0].statusItem` não pode ser nulo ou em branco. | Com valor nulo    |
            | 2           | string vazia | 400        | 400.001 | O campo `itens[0].statusItem` não pode ser nulo ou em branco. | Com string vazia  |
            | 3           | objeto vazio | 400        | 400.000 | Requisição inválida.                                          | Como objeto vazio |
            | 4           | array vazio  | 400        | 400.000 | Requisição inválida.                                          | Como array vazio  |

    # Validação de apólice
    @CT38-post-apolices
    Cenário: CT38 - Falha - Tentativa de cadastro de duas apólices com o mesmo número
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "numeroApolice" dos dados da apólice tenha o valor "1"
        E realizar a chamada de CRIAÇÃO de apolice
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "409"
        E a resposta contém um objeto com o código "409.001" e com a mensagem "Apólice com número existente."

    # Campos opcionais não preenhidos
    @CT39-post-apolices
    Cenário: CT39 - Sucesso - Criação de apólice sem os campos opcionais
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "nomeCondutor" dos dados da apólice tenha o valor "nulo"
        E que quero que o campo "cpfCondutor" dos dados da apólice tenha o valor "nulo"
        E que quero que o campo "cepPernoite" dos dados da apólice tenha o valor "nulo"
        E que quero que o campo "numeroApoliceAnterior" dos dados da apólice tenha o valor "nulo"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "202"


  # Regras de negócio das datas de emissão, início e fim da vigência 
    @CT40-post-apolices
    Esquema do Cenário: CT40.<casoDeTeste> - Falha - Violação dos campos data  | <descricao>
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "dataEmissao" dos dados da apólice tenha o valor "<valorDataEmissao>"
        E que quero que o campo "dataInicioVigencia" dos dados da apólice tenha o valor "<valorDataInicio>"
        E que quero que o campo "dataFimVigencia" dos dados da apólice tenha o valor "<valorDataFim>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valorDataEmissao | valorDataInicio | valorDataFim | statusCode | codigo  | mensagem                                                     | descricao                                |
            | 1           | 2025-01-02       | 2025-01-01      | 2025-01-03   | 422        | 422.002 | Data de Emissão deve ser anterior ou igual à Data de Início. | Data de Emissão Maior que Data de Início |
            | 2           | 2025-01-02       | 2025-01-03      | 2025-01-01   | 422        | 422.001 | Data de Início deve ser anterior ou igual à Data de Fim.     | Data de Início Maior que Data de Fim     |
            # | 3           | 2025-01-02       | 2025-01-03      | 2025-01-01   | 422        | 422.001 | Data de Emissão deve ser anterior ou igual à Data de Fim.    | Data de Emissão Maior que Data de Fim     |
            # | 4           | Amanhã           | Amanhã          | Amanhã       | 422        | 422.001 | Data de Emissão deve ser anterior ou igual à Data corrente.  | Data de Início Maior que Data de Fim     |

    @CT41-post-apolices
    Esquema do Cenário: CT41.<casoDeTeste> - Sucesso - Criação de apólice com cada tipo de operação | <descricao> 
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "<valor>" dos dados da apólice tenha o valor "<valorDataEmissao>"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        Exemplos:
            | casoDeTeste | valor                 | statusCode | descricao                              |
            | 1           | NOVO_SEGURO           | 202        | Operação do tipo NOVO_SEGURO           |
            | 2           | RENOVACAO_PROPRIA     | 202        | Operação do tipo RENOVACAO_PROPRIA     |
            | 3           | RENOVACAO_CONGENERE   | 202        | Operação do tipo RENOVACAO_CONGENERE   |
            | 4           | ENDOSSO_SUBSTITUICAO  | 202        | Operação do tipo ENDOSSO_SUBSTITUICAO  |
            | 5           | ENDOSSO_ALTERACAO     | 202        | Operação do tipo ENDOSSO_ALTERACAO     |
            | 6           | ENDOSSO_CANCELAMENTO  | 202        | Operação do tipo ENDOSSO_CANCELAMENTO  |
            | 7           | ENDOSSO_INCLUSAO_ITEM | 202        | Operação do tipo ENDOSSO_INCLUSAO_ITEM |
            | 8           | ENDOSSO_EXCLUSAO_ITEM | 202        | Operação do tipo ENDOSSO_EXCLUSAO_ITEM |

# ************************************************************** FROTA **************************************************************

    @CT42-post-apolices
    Esquema do Cenário: CT42 - Sucesso - Cadastro de apólice de frota
        Dado que quero que o request body seja o padrão de CRIAÇÃO de apolice
        E que quero que o campo "codigoSegmento" dos dados da apólice tenha o valor "FROTA"
        Quando realizar a chamada de CRIAÇÃO de apolice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor        | statusCode | codigo  | mensagem             | descricao         |
            | 1           | objeto vazio | 400        | 400.000 | Requisição inválida. | Como objeto vazio |
            | 2           | array vazio  | 400        | 400.000 | Requisição inválida. | Como array vazio  |