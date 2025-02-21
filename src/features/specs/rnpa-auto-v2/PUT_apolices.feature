#language: pt
@rnpa-auto-v2
@put-apolices
@regression

#TODO: Ajustar enumeração

Funcionalidade: Alteraçãp de apólices do RNPA Auto V2

#    Contexto: Geração de token
#        Dado a chamada do endpoint do access token


# Endosso de Substituição   
    # Sucesso
    @CT1-put-apolices
    Cenário: CT1 - Endosso de Subistituição - Sucesso - Endosso de apólice
        Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE SUBSTITUIÇÃO"
        Quando realizar a chamada de ENDOSSO de apólice
        Então o statusCode HTTP deve ser "202"

    # Apólice Inexistente
    @CT2-put-apolices
    Cenário: CT2 - Endosso de Subistituição - Falha - Endosso de apólice INEXISTENTE
        Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE SUBSTITUIÇÃO"
        E que quero que o campo "numeroApolice" do request body tenha o valor "1111111111111111"
        Quando realizar a chamada de ENDOSSO de apólice
        Então o statusCode HTTP deve ser "400"
        E a resposta contém um objeto com o código "400.022" e com a mensagem "Apólice não encontrada."

    # dadosDaApolice
        # numeroApolice 
        @CT3-put-apolices
        Esquema do Cenário: CT3.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "numeroApolice" | <descricao>
            Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE SUBSTITUIÇÃO"
            E que quero que o campo "numeroApolice" do request body tenha o valor "<valor>"
            Quando realizar a chamada de ENDOSSO de apólice
            Então o statusCode HTTP deve ser "<statusCode>"
            E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
            Exemplos:
            | casoDeTeste | valor         | statusCode | codigo  | mensagem                                                 | descricao                       |
            | 1           | teste         | 400        | 400.000 | Campo `numeroApolice` inválido.                          | Como array vazio                |
            | 2           | 21 caracteres | 400        | 400.003 | O campo `numeroApolice` deve ser inferior ou igual à 20. | Com limite MÁXIMO de caracteres |
            | 3           | string vazia  | 400        | 400.001 | O campo `numeroApolice` não pode ser nulo ou em branco.  | Com string vazia                |
            | 4           | nulo          | 400        | 400.001 | O campo `numeroApolice` não pode ser nulo ou em branco.  | Com valor nulo                  |
            | 5           | objeto vazio  | 400        | 400.000 | Requisição inválida.                                     | Como objeto vazio               |
            | 6           | array vazio   | 400        | 400.000 | Requisição inválida.                                     | Como array vazio                |
        
    # EM DEFINIÇÂO: codigoOperacao
    @CT4-put-apolices
    Esquema do Cenário: CT4.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "codigoOperacao" | <descricao> 
        Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE SUBSTITUIÇÃO"
        E que quero que o campo "codigoOperacao" do request body tenha o valor "<valor>"
        Quando realizar a chamada de ENDOSSO de apólice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor        | statusCode | codigo  | mensagem                                                                                                                                                                                                                                                    | descricao                 |
            | 1           | NOVA APOLICE | 400        | 400.018 | O valor enviado para o campo `dadosDaApolice.codigoOperacao` é inválido. Valores aceitos: NOVO_SEGURO, RENOVACAO_PROPRIA, RENOVACAO_CONGENERE, ENDOSSO_SUBSTITUICAO, ENDOSSO_ALTERACAO, ENDOSSO_CANCELAMENTO, ENDOSSO_INCLUSAO_ITEM, ENDOSSO_EXCLUSAO_ITEM. | Com operação em maiúsculo |
            | 2           | string vazia | 400        | 400.001 | O campo `dadosDaApolice.codigoOperacao` não pode ser nulo ou em branco.                                                                                                                                                                                     | Com string vazia          |
            | 3           | nulo         | 400        | 400.001 | O campo `dadosDaApolice.codigoOperacao` não pode ser nulo ou em branco.                                                                                                                                                                                     | Com valor nulo            |
            | 4           | objeto vazio | 400        | 400.000 | Requisição inválida.                                                                                                                                                                                                                                        | Como objeto vazio         |
            | 5           | array vazio  | 400        | 400.000 | Requisição inválida.                                                                                                                                                                                                                                        | Como array vazio          |
    
    # dataEmissao
    @CT5-put-apolices
    Esquema do Cenário: CT5.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "dataEmissao"  | <descricao>
        Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE SUBSTITUIÇÃO"
        E que quero que o campo "dataEmissao" do request body tenha o valor "<valor>"
        Quando realizar a chamada de ENDOSSO de apólice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor        | statusCode | codigo  | mensagem                                                      | descricao                              |
            | 1           | 2025-15-01   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                     | Data no padrão YYYY-DD-MM              |
            | 2           | 15-01-2025   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                     | Data no padrão DD-MM-YYYY              |
            | 3           | 15-2025-01   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                     | Data no padrão DD-YYYY                 |
            | 4           | YYYY-MM-DD   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                     | Data com letras, no padrão YYYY-MM-DD  |
            | 5           | YYYY-DD-MM   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                     | Data com letras, Tno padrão YYYY-DD-MM |
            | 6           | DD-MM-YYYY   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                     | Data com letras, no padrão DD-MM-YYYY  |
            | 7           | DD-YYYY-MM   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                     | Data com letras, no padrão DD-YYYY-MM  |
            | 8           | 20250115     | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                     | Data sem hífen                         |
            | 9           | string vazia | 400        | 400.001 | O campo `item[0].dataEmissao` não pode ser nulo ou em branco. | Com string vazia                       |
            | 10          | nulo         | 400        | 400.001 | O campo `item[0].dataEmissao` não pode ser nulo ou em branco. | Com valor nulo                         |
            | 11          | objeto vazio | 400        | 400.000 | Requisição inválida.                                          | Como objeto vazio                      |
            | 12          | array vazio  | 400        | 400.000 | Requisição inválida.                                          | Como array vazio                       |
    
    # dataIniVigencia
    @CT6-put-apolices
    Esquema do Cenário: CT6.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "dataIniVigencia"  | <descricao>
        Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE SUBSTITUIÇÃO"
        E que quero que o campo "dataIniVigencia" do request body tenha o valor "<valor>"
        Quando realizar a chamada de ENDOSSO de apólice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor        | statusCode | codigo  | mensagem                                                      | descricao                              |
            | 1           | 2025-15-01   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                     | Data no padrão YYYY-DD-MM              |
            | 2           | 15-01-2025   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                     | Data no padrão DD-MM-YYYY              |
            | 3           | 15-2025-01   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                     | Data no padrão DD-YYYY                 |
            | 4           | YYYY-MM-DD   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                     | Data com letras, no padrão YYYY-MM-DD  |
            | 5           | YYYY-DD-MM   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                     | Data com letras, Tno padrão YYYY-DD-MM |
            | 6           | DD-MM-YYYY   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                     | Data com letras, no padrão DD-MM-YYYY  |
            | 7           | DD-YYYY-MM   | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                     | Data com letras, no padrão DD-YYYY-MM  |
            | 8           | 20250115     | 400        | 400.021 | Formato de data inválido. Use yyyy-MM-dd.                     | Data sem hífen                         |
            | 9           | string vazia | 400        | 400.001 | O campo `item0].dataEmissao` não pode ser nulo ou em branco.  | Com string vazia                       |
            | 10          | nulo         | 400        | 400.001 | O campo `item[0].dataEmissao` não pode ser nulo ou em branco. | Com valor nulo                         |
            | 11          | objeto vazio | 400        | 400.000 | Requisição inválida.                                          | Como objeto vazio                      |
            | 12          | array vazio  | 400        | 400.000 | Requisição inválida.                                          | Como array vazio                       |
    
    # codigoStatusApolice
    @CT7-put-apolices
    Esquema do Cenário: CT7.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "codigoStatusApolice" | <descricao>
        Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE SUBSTITUIÇÃO"
        E que quero que o campo "codigoStatusApolice" do request body tenha o valor "<valor>"
        Quando realizar a chamada de ENDOSSO de apólice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor        | statusCode | codigo  | mensagem                                                               | descricao         |
            | 1           | nulo         | 400        | 400.001 | O campo `dadosDaApolice.statusApolice` não pode ser nulo ou em branco. | Com valor nulo    |
            | 2           | objeto vazio | 400        | 400.000 | Requisição inválida.                                                   | Como objeto vazio |
            | 3           | array vazio  | 400        | 400.000 | Requisição inválida.                                                   | Como array vazio  |
            | 4           | string vazia | 400        | 400.001 | O campo `dadosDaApolice.statusApolice` não pode ser nulo ou em branco. | Com string vazia  |

    # idTipoEndosso
    @CT8-put-apolices
    Esquema do Cenário: CT8.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "idTipoEndosso" | <descricao>
        Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE SUBSTITUIÇÃO"
        E que quero que o campo "idTipoEndosso" do request body tenha o valor "<valor>"
        Quando realizar a chamada de ENDOSSO de apólice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor             | statusCode | codigo  | mensagem                                                      | descricao                            |
            | 1           | nulo              | 400        | 400.001 | O campo `itens[0].numeroItem` não pode ser nulo ou em branco. | Com valor nulo                       |
            | 2           | string vazia      | 400        | 400.001 | O campo `itens[0].numeroItem` não pode ser nulo ou em branco. | Com string vazia                     |
            | 3           | limite de inteiro | 400        | 400.000 | Requisição inválida.                                          | Com valor acima do limite de inteiro |
            | 4           | booleano          | 400        | 400.000 | Requisição inválida.                                          | Com valor booleano                   |
            | 5           | objeto vazio      | 400        | 400.000 | Requisição inválida.                                          | Como objeto vazio                    |
            | 6           | array vazio       | 400        | 400.000 | Requisição inválida.                                          | Como array vazio                     |
            | 7           | negativo          | 400        | 400.000 | Requisição inválida.                                          | Com valor negativo                   |
    
    # codigoSegmento
    @CT9-put-apolices
    Esquema do Cenário: CT9.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "codigoSegmento" | <descricao>
        Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE SUBSTITUIÇÃO"
        E que quero que o campo "codigoSegmento" do request body tenha o valor "<valor>"
        Quando realizar a chamada de ENDOSSO de apólice
        Então o statusCode HTTP deve ser "<statusCode>"
        E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
        Exemplos:
            | casoDeTeste | valor        | statusCode | codigo  | mensagem                                                                                                     | descricao         |
            | 1           | teste        | 400        | 400.018 | O valor enviado para o campo `dadosDaApolice.codigoSegmento` é inválido. Valores aceitos: INDIVIDUAL, FROTA. | Com valor teste   |
            | 2           | string vazia | 400        | 400.001 | O campo `codigoSegmento` não pode ser nulo ou em branco.                                                     | Com string vazia  |
            | 3           | nulo         | 400        | 400.001 | O campo `codigoSegmento` não pode ser nulo ou em branco.                                                     | Com valor nulo    |
            | 4           | objeto vazio | 400        | 400.000 | Requisição inválida.                                                                                         | Como objeto vazio |
            | 5           | array vazio  | 400        | 400.000 | Requisição inválida.                                                                                         | Como array vazio  |
    # item
        # item
        @CT10-put-apolices
        Cenário: CT10 - Endosso de Subistituição - Falha - Validação de campos obrigatórios
            Dado que quero que o request body seja o padrão de CRIAÇÃO de apólice
            E que quero que o campo "item" do request body tenha o valor "<valor>"
            Quando realizar a chamada de ENDOSSO de apólice
            Então o statusCode HTTP deve ser "<statusCode>"
            E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
            Exemplos:
                | casoDeTeste | valor        | statusCode | codigo  | mensagem                                       | descricao         |
                | 1           | nulo         | 400        | 400.001 | O campo `item` não pode ser nulo ou em branco. | Com valor nulo    |
                | 2           | array vazio  | 400        | 400.001 | O campo `item` não pode ser nulo ou em branco. | Como array vazio  |
                | 3           | string vazia | 400        | 400.000 | Requisição inválida.                           | Com string vazia  |
                | 4           | objeto vazio | 400        | 400.000 | Requisição inválida.                           | Como objeto vazio |

        # numeroItem
        @CT11-put-apolices
        Esquema do Cenário: CT11.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "numeroItem" | <descricao>
            Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE SUBSTITUIÇÃO"
            E que quero que o campo "numeroItem" do item do endosso tenha o valor "<valor>"
            Quando realizar a chamada de ENDOSSO de apólice
            Então o statusCode HTTP deve ser "<statusCode>"
            E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
            Exemplos:
                | casoDeTeste | valor             | statusCode | codigo  | mensagem                                                     | descricao                            |
                | 1           | nulo              | 400        | 400.001 | O campo `item[0].numeroItem` não pode ser nulo ou em branco. | Com valor nulo                       |
                | 2           | string vazia      | 400        | 400.001 | O campo `item[0].numeroItem` não pode ser nulo ou em branco. | Com string vazia                     |
                | 3           | limite de inteiro | 400        | 400.000 | Requisição inválida.                                         | Com valor acima do limite de inteiro |
                | 4           | booleano          | 400        | 400.000 | Requisição inválida.                                         | Com valor booleano                   |
                | 5           | objeto vazio      | 400        | 400.000 | Requisição inválida.                                         | Como objeto vazio                    |
                | 6           | array vazio       | 400        | 400.000 | Requisição inválida.                                         | Como array vazio                     |
                | 7           | negativo          | 400        | 400.000 | Requisição inválida.                                         | Com valor negativo                   |
    
        # nomeModelo 
        @CT12-put-apolices
        Esquema do Cenário: CT12.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "nomeModelo" | <descricao>
            Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE SUBSTITUIÇÃO"
            E que quero que o campo "nomeModelo" do item do endosso tenha o valor "<valor>"
            Quando realizar a chamada de ENDOSSO de apólice
            Então o statusCode HTTP deve ser "<statusCode>"
            E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
            Exemplos:
                | casoDeTeste | valor        | statusCode | codigo  | mensagem                                                     | descricao         |
                | 1           | nulo         | 400        | 400.001 | O campo `item[0].nomeModelo` não pode ser nulo ou em branco. | Com valor nulo    |
                | 2           | string vazia | 400        | 400.001 | O campo `item[0].nomeModelo` não pode ser nulo ou em branco. | Com string vazia  |
                | 3           | objeto vazio | 400        | 400.000 | Requisição inválida.                                         | Como objeto vazio |
                | 4           | array vazio  | 400        | 400.000 | Requisição inválida.                                         | Como array vazio  |
 
        # codigoFipe
        @CT13-put-apolices
        Esquema do Cenário: CT13.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "codigoFipe" | <descricao>
            Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE SUBSTITUIÇÃO"
            E que quero que o campo "codigoFipe" do item do endosso tenha o valor "<valor>"
            Quando realizar a chamada de ENDOSSO de apólice
            Então o statusCode HTTP deve ser "<statusCode>"
            E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
            Exemplos:
                | casoDeTeste | valor        | statusCode | codigo  | mensagem                                                     | descricao              |
                | 1           | nulo         | 400        | 400.001 | O campo `item[0].codigoFipe` não pode ser nulo ou em branco. | Com valor nulo         |
                | 2           | string vazia | 400        | 400.001 | O campo `item[0].codigoFipe` não pode ser nulo ou em branco. | Com string vazia       |
                | 3           | 123456789    | 400        | 400.015 | Campo `item[0].codigoFipe` inválido.                         | Com valor de 9 números |
                | 4           | 1234567      | 400        | 400.015 | Campo `item[0].codigoFipe` inválido.                         | Com valor de 7 números |
                | 5           | objeto vazio | 400        | 400.000 | Requisição inválida.                                         | Como objeto vazio      |
                | 6           | array vazio  | 400        | 400.000 | Requisição inválida.                                         | Como array vazio       |
    
        # numeroAnoFabricacao
        @CT14-put-apolices
        Esquema do Cenário: CT14.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "numeroAnoFabricacao" | <descricao>
            Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE SUBSTITUIÇÃO"
            E que quero que o campo "numeroAnoFabricacao" do item do endosso tenha o valor "<valor>"
            Quando realizar a chamada de ENDOSSO de apólice
            Então o statusCode HTTP deve ser "<statusCode>"
            E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
            Exemplos:
                | casoDeTeste | valor             | statusCode | codigo  | mensagem                                                              | descricao                            |
                | 1           | nulo              | 400        | 400.001 | O campo `item[0].numeroAnoFabricacao` não pode ser nulo ou em branco. | Com valor nulo                       |
                | 2           | string vazia      | 400        | 400.001 | O campo `item[0].numeroAnoFabricacao` não pode ser nulo ou em branco. | Com string vazia                     |
                | 3           | limite de inteiro | 400        | 400.000 | Requisição inválida.                                                  | Com valor acima do limite de inteiro |
                | 4           | booleano          | 400        | 400.000 | Requisição inválida.                                                  | Com valor booleano                   |
                | 5           | objeto vazio      | 400        | 400.000 | Requisição inválida.                                                  | Como objeto vazio                    |
                | 6           | array vazio       | 400        | 400.000 | Requisição inválida.                                                  | Como array vazio                     |
                | 7           | negativo          | 400        | 400.000 | Requisição inválida.                                                  | Com valor negativo                   |
        
        # numeroAnoModelo
        @CT15-put-apolices
        Esquema do Cenário: CT15.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "numeroAnoModelo" | <descricao>
            Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE SUBSTITUIÇÃO"
            E que quero que o campo "numeroAnoModelo" do item do endosso tenha o valor "<valor>"
            Quando realizar a chamada de ENDOSSO de apólice
            Então o statusCode HTTP deve ser "<statusCode>"
            E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
            Exemplos:
                | casoDeTeste | valor             | statusCode | codigo  | mensagem                                                          | descricao                            |
                | 1           | nulo              | 400        | 400.001 | O campo `item[0].numeroAnoModelo` não pode ser nulo ou em branco. | Com valor nulo                       |
                | 2           | string vazia      | 400        | 400.001 | O campo `item[0].numeroAnoModelo` não pode ser nulo ou em branco. | Com string vazia                     |
                | 3           | limite de inteiro | 400        | 400.000 | Requisição inválida.                                              | Com valor acima do limite de inteiro |
                | 4           | booleano          | 400        | 400.000 | Requisição inválida.                                              | Com valor booleano                   |
                | 5           | objeto vazio      | 400        | 400.000 | Requisição inválida.                                              | Como objeto vazio                    |
                | 6           | array vazio       | 400        | 400.000 | Requisição inválida.                                              | Como array vazio                     |
                | 7           | negativo          | 400        | 400.000 | Requisição inválida.                                              | Com valor negativo                   |
        
        # indicadorZeroKm
        @CT16-put-apolices
        Esquema do Cenário: CT16.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "indicadorZeroKm" | <descricao>
            Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE SUBSTITUIÇÃO"
            E que quero que o campo "indicadorZeroKm" do item do endosso tenha o valor "<valor>"
            Quando realizar a chamada de ENDOSSO de apólice
            Então o statusCode HTTP deve ser "<statusCode>"
            E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
            Exemplos:
                | casoDeTeste | valor        | statusCode | codigo  | mensagem                                                          | descricao         |
                | 1           | nulo         | 400        | 400.001 | O campo `item[0].indicadorZeroKm` não pode ser nulo ou em branco. | Com valor nulo    |
                | 2           | string vazia | 400        | 400.001 | O campo `item[0].indicadorZeroKm` não pode ser nulo ou em branco. | Com string vazia  |
                | 3           | objeto vazio | 400        | 400.000 | Requisição inválida.                                              | Como objeto vazio |
                | 4           | array vazio  | 400        | 400.000 | Requisição inválida.                                              | Como array vazio  |
        
        # numeroPlaca
        @CT17-put-apolices
        Esquema do Cenário: CT17.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "numeroPlaca" | <descricao>
            Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE SUBSTITUIÇÃO"
            E que quero que o campo "numeroPlaca" do item do endosso tenha o valor "<valor>"
            Quando realizar a chamada de ENDOSSO de apólice
            Então o statusCode HTTP deve ser "<statusCode>"
            E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
            Exemplos:
                | casoDeTeste | valor        | statusCode | codigo  | mensagem                                                      | descricao                             |
                | 1           | AAA-1234     | 400        | 400.015 | Campo `item[0].numeroPlaca` inválido.                         | Padrão Brasileiro com hífen           |
                | 2           | AAA-1A23     | 400        | 400.015 | Campo `item[0].numeroPlaca` inválido.                         | Padrão Mercosul com hífen             |
                | 3           | aaa-1234     | 400        | 400.015 | Campo `item[0].numeroPlaca` inválido.                         | Padrão Brasileiro em MINÚSCULO        |
                | 4           | aaa1a23      | 400        | 400.015 | Campo `item[0].numeroPlaca` inválido.                         | Padrão Mercosul em MINÚSCULO          |
                | 5           | AAABBBB      | 400        | 400.015 | Campo `item[0].numeroPlaca` inválido.                         | Somente letras em MAIÚSCULO sem HÍFEN |
                | 6           | aaabbbb      | 400        | 400.015 | Campo `item[0].numeroPlaca` inválido.                         | Somente letras em MINÚSCULO sem HÍFEN |
                | 7           | AAA-BBBB     | 400        | 400.015 | Campo `item[0].numeroPlaca` inválido.                         | Somente letras em MAIÚSCULO com HÍFEN |
                | 8           | aaa-bbbb     | 400        | 400.015 | Campo `item[0].numeroPlaca` inválido.                         | Somente letras em MINÚSCULO com HÍFEN |
                | 9           | 1234567      | 400        | 400.015 | Campo `item[0].numeroPlaca` inválido.                         | Somente números sem HÍFEN             |
                | 10          | 123-4567     | 400        | 400.015 | Campo `item[0].numeroPlaca` inválido.                         | Somente números com HÍFEN             |
                | 11          | objeto vazio | 400        | 400.000 | Requisição inválida.                                          | Como objeto vazio                     |
                | 12          | array vazio  | 400        | 400.000 | Requisição inválida.                                          | Como array vazio                      |
                | 12          | string vazia | 400        | 400.000 | O campo `item[0].numeroPlaca` não pode ser nulo ou em branco. | Como array vazio                      |
                | 12          | nulo         | 400        | 400.000 | O campo `item[0].numeroPlaca` não pode ser nulo ou em branco. | Como array vazio                      |

        # numeroChassi
        @CT18-put-apolices
        Esquema do Cenário: CT18.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "numeroChassi" | <descricao>
            Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE SUBSTITUIÇÃO"
            E que quero que o campo "numeroChassi" do item do endosso tenha o valor "<valor>"
            Quando realizar a chamada de ENDOSSO de apólice
            Então o statusCode HTTP deve ser "<statusCode>"
            E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
            Exemplos:
                | casoDeTeste | valor              | statusCode | codigo  | mensagem                                                       | descricao               |
                | 1           | 123456789012345678 | 400        | 400.015 | Campo `item[0].numeroChassi` inválido.                         | Com valor de 18 números |
                | 2           | 1234567890123456   | 400        | 400.015 | Campo `item[0].numeroChassi` inválido.                         | Com valor de 16 números |
                | 3           | string vazia       | 400        | 400.001 | O campo `item[0].numeroChassi` não pode ser nulo ou em branco. | Com string vazia        |
                | 4           | nulo               | 400        | 400.001 | O campo `item[0].numeroChassi` não pode ser nulo ou em branco. | Com valor nulo          |
                | 5           | objeto vazio       | 400        | 400.000 | Requisição inválida.                                           | Como objeto vazio       |
                | 6           | array vazio        | 400        | 400.000 | Requisição inválida.                                           | Como array vazio        |
    
        # codigoCategoria
        @CT19-put-apolices
        Esquema do Cenário: CT19.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "codigoCategoria" | <descricao>
            Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE SUBSTITUIÇÃO"
            E que quero que o campo "codigoCategoria" do item do endosso tenha o valor "<valor>"
            Quando realizar a chamada de ENDOSSO de apólice
            Então o statusCode HTTP deve ser "<statusCode>"
            E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
            Exemplos:
                | casoDeTeste | valor        | statusCode | codigo  | mensagem                                                         | descricao         |
                | 1           | nulo         | 400        | 400.001 | O campo `item[0].codigoCategoria` não pode ser nulo ou em branco. | Com valor nulo    |
                | 2           | string vazia | 400        | 400.001 | O campo `item[0].codigoCategoria` não pode ser nulo ou em branco. | Com string vazia  |
                | 3           | objeto vazio | 400        | 400.000 | Requisição inválida.                                             | Como objeto vazio |
                | 4           | array vazio  | 400        | 400.000 | Requisição inválida.                                             | Como array vazio  |
 
        # nomeCategoria
        @CT20-put-apolices
        Esquema do Cenário: CT20.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "nomeCategoria" | <descricao>
            Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE SUBSTITUIÇÃO"
            E que quero que o campo "nomeCategoria" do item do endosso tenha o valor "<valor>"
            Quando realizar a chamada de ENDOSSO de apólice
            Então o statusCode HTTP deve ser "<statusCode>"
            E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
            Exemplos:
                | casoDeTeste | valor        | statusCode | codigo  | mensagem                                                         | descricao         |
                | 1           | nulo         | 400        | 400.001 | O campo `item[0].nomeCategoria` não pode ser nulo ou em branco. | Com valor nulo    |
                | 2           | string vazia | 400        | 400.001 | O campo `item[0].nomeCategoria` não pode ser nulo ou em branco. | Com string vazia  |
                | 3           | objeto vazio | 400        | 400.000 | Requisição inválida.                                             | Como objeto vazio |
                | 4           | array vazio  | 400        | 400.000 | Requisição inválida.                                             | Como array vazio  |
 
        # dataEmissao     
        @CT21-put-apolices
        Esquema do Cenário: CT21.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "dataEmissao"  | <descricao>
            Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE SUBSTITUIÇÃO"
            E que quero que o campo "dataEmissao" do item do endosso tenha o valor "<valor>"
            Quando realizar a chamada de ENDOSSO de apólice
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
                | 9           | string vazia | 400        | 400.001 | O campo `item[0].dataEmissao` não pode ser nulo ou em branco. | Com string vazia                       |
                | 10          | nulo         | 400        | 400.001 | O campo `item[0].dataEmissao` não pode ser nulo ou em branco. | Com valor nulo                         |
                | 11          | objeto vazio | 400        | 400.000 | Requisição inválida.                                           | Como objeto vazio                      |
                | 12          | array vazio  | 400        | 400.000 | Requisição inválida.                                           | Como array vazio                       |
        
        # dataInicioVigencia
        @CT22-put-apolices
        Esquema do Cenário: CT22.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "dataInicioVigencia" | <descricao>
            Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE SUBSTITUIÇÃO"
            E que quero que o campo "dataInicioVigencia" do item do endosso tenha o valor "<valor>"
            Quando realizar a chamada de ENDOSSO de apólice
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
                | 9           | string vazia | 400        | 400.001 | O campo `item[0].dataInicioVigencia` não pode ser nulo ou em branco. | Com string vazia                       |
                | 10          | nulo         | 400        | 400.001 | O campo `item[0].dataInicioVigencia` não pode ser nulo ou em branco. | Com valor nulo                         |
                | 11          | objeto vazio | 400        | 400.000 | Requisição inválida.                                                  | Como objeto vazio                      |
                | 12          | array vazio  | 400        | 400.000 | Requisição inválida.                                                  | Como array vazio                       |
        
        # dataFimVigencia
        @CT23-put-apolices
        Esquema do Cenário: CT23.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "dataFimVigencia" | <descricao>
            Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE SUBSTITUIÇÃO"
            E que quero que o campo "dataFimVigencia" do item do endosso tenha o valor "<valor>"
            Quando realizar a chamada de ENDOSSO de apólice
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
                | 9           | string vazia | 400        | 400.001 | O campo `item[0].dataFimVigencia` não pode ser nulo ou em branco. | Com string vazia                       |
                | 10          | nulo         | 400        | 400.001 | O campo `item[0].dataFimVigencia` não pode ser nulo ou em branco. | Com valor nulo                         |
                | 11          | objeto vazio | 400        | 400.000 | Requisição inválida.                                               | Como objeto vazio                      |
                | 12          | array vazio  | 400        | 400.000 | Requisição inválida.                                               | Como array vazio                       |

        # codigoStatusItem
        @CT24-put-apolices
        Esquema do Cenário: CT24.<casoDeTeste> - Falha - Violação dos dados de entrada do campo "codigoStatusItem" | <descricao>
            Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE SUBSTITUIÇÃO"
            E que quero que o campo "codigoStatusItem" do item do endosso tenha o valor "<valor>"
            Quando realizar a chamada de ENDOSSO de apólice
            Então o statusCode HTTP deve ser "<statusCode>"
            E a resposta contém um objeto com o código "<codigo>" e com a mensagem "<mensagem>"
            Exemplos:
                | casoDeTeste | valor        | statusCode | codigo  | mensagem                                                               | descricao         |
                | 1           | nulo         | 400        | 400.001 | O campo `item[0].codigoStatusItem` não pode ser nulo ou em branco. | Com valor nulo    |
                | 2           | string vazia | 400        | 400.001 | O campo `item[0].codigoStatusItem` não pode ser nulo ou em branco. | Com string vazia  |
                | 3           | objeto vazio | 400        | 400.000 | Requisição inválida.                                                   | Como objeto vazio |
                | 4           | array vazio  | 400        | 400.000 | Requisição inválida.                                                   | Como array vazio  |

    # Individual com mais de um item
    @CT25-put-apolices @teste
    Cenário: CT25 - Falha - Endosso de substuição de risco para apólice INDIVIDUAL com mais de 1 item 
        Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE SUBSTITUIÇÃO"
        E que quero que o "ENDOSSO DE SUBSTITUIÇÃO" tenha a quantidade 2 de itens 
        Quando realizar a chamada de ENDOSSO de apólice
        Então o statusCode HTTP deve ser "422"
        E a resposta contém um objeto com o código "422.005" e com a mensagem "Quantidade de ‘item’ inválido para o segmento informado."

    # Frota com um item
    @CT26-put-apolices
    Cenário: CT26 - Falha - Endosso de substuição de risco para apólice de FROTA com apenas 1 item 
        Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE SUBSTITUIÇÃO"
        E que quero que o campo "segmento" do request body tenha o valor "FROTA"
        E que quero que o "ENDOSSO DE SUBSTITUIÇÃO" tenha a quantidade 1 de itens 
        Quando realizar a chamada de ENDOSSO de apólice
        Então o statusCode HTTP deve ser "422"
        E a resposta contém um objeto com o código "422.005" e com a mensagem "Quantidade de ‘item’ inválido para o segmento informado."

    # Cenário: alterar item que não existe