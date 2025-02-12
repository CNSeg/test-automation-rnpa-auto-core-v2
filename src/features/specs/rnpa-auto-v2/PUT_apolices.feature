#language: pt
@rnpa-auto-v2
@put-apolices
@regression

Funcionalidade: Alteraçãp de apólices do RNPA Auto V2

#    Contexto: Geração de token
#        Dado a chamada do endpoint do access token
    
# Endosso de Substituição

    # Sucesso
    @CT1-put-apolices
    Cenário: CT1 - Endosso de Subistituição - Sucesso - Endosso de apólice
        Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE SUBSTITUIÇÃO"
        E que o número da apólice de ENDOSSO seja o mesmo de uma apólice pré-gerada
        Quando realizar a chamada de ENDOSSO de apólice
        Então o statusCode HTTP deve ser "200"


    # Apólice Inexistente
    @CTX-put-apolices
    Cenário: CTX - Endosso de Subistituição - Falha - Endosso de apólice INEXISTENTE
        Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE SUBSTITUIÇÃO"
        Quando realizar a chamada de ENDOSSO de apólice
        Então o statusCode HTTP deve ser "400"
        E a resposta contém um objeto com o código "400.022" e com a mensagem "Apólice não encontrada."

    # Chamada sem request body
    @CTX-put-apolices
    Cenário: CTX - Endosso de Subistituição - Falha - Validação de campos obrigatórios
        Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "VAZIO"
        Então o statusCode HTTP deve ser "400"
        E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `numeroApolice` não pode ser nulo ou em branco."
        E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `codigoOperacao` não pode ser nulo ou em branco."
        E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `dataEmissao` não pode ser nulo ou em branco."
        E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `dataInicioVigencia` não pode ser nulo ou em branco."
        E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `codigoStatusApolice` não pode ser nulo ou em branco."
        E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `idTipoEndosso` não pode ser nulo ou em branco."
        E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `item` não pode ser nulo ou em branco."
        # E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `numeroItem` não pode ser nulo ou em branco."
        # E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `nomeModelo` não pode ser nulo ou em branco."
        # E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `numeroAnoFabricao` não pode ser nulo ou em branco."
        # E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `numeroAnoModelo` não pode ser nulo ou em branco."
        # E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `numeroAnoModelo` não pode ser nulo ou em branco."
        # E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `chassi` não pode ser nulo ou em branco."
        # E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `codigoFipe` não pode ser nulo ou em branco."
        # E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `codigoZeroKM` não pode ser nulo ou em branco."
        # E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `codigoZeroKM` não pode ser nulo ou em branco."
        # E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `codigoCategoria` não pode ser nulo ou em branco."
        # E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `dataEmissao` não pode ser nulo ou em branco."
        # E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `dataInicioVigencia` não pode ser nulo ou em branco."



    # Chamada com request body complemtamente em branco
    @CTX-put-apolices
    Cenário: CTX - Endosso de Subistituição - Falha - Chamada com request body completamente em branco
        Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE SUBSTITUIÇÃO"


    # Chamada com request body parcialmente em branco
   @CTX-put-apolices
    Cenário: CTX - Endosso de Subistituição - Falha - Chamada com request body parcialmente em branco
        Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE SUBSTITUIÇÃO"

# (WIP) Endosso de Alteração Técnica

    # Sucesso
    @CTX-put-apolices
    Cenário: CT1 - Endosso de Alteração Técnica - Sucesso - Endosso de apólice
        Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE ENDOSSO TÉCNICA"
        Quando realizar a chamada de ENDOSSO de apólice
        Então o statusCode HTTP deve ser "200"


    # Apólice Inexistente
    @CTX-put-apolices
    Cenário: CTX - Endosso de Alteração Técnica - Falha - Endosso de apólice INEXISTENTE
        Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE ENDOSSO TÉCNICA"


    # Chamada sem request body
    @CTX-put-apolices
    Cenário: CTX - Endosso de Alteração Técnica - Falha - Chamada sem request body
        Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE ENDOSSO TÉCNICA"


    # Chamada com request body complemtamente em branco
    @CTX-put-apolices
    Cenário: CTX - Endosso de Alteração Técnica - Falha - Chamada com request body completamente em branco
        Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE ENDOSSO TÉCNICA"


    # Chamada com request body parcialmente em branco
   @CTX-put-apolices
    Cenário: CTX - Endosso de Alteração Técnica - Falha - Chamada com request body parcialmente em branco
        Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE ENDOSSO TÉCNICA"

# (WIP) Endosso de Cancelamento

    # Sucesso
    @CTX-put-apolices
    Cenário: CT1 - Endosso de Cancelamento - Sucesso - Endosso de apólice
        Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE CANCELAMENTO"
        Quando realizar a chamada de ENDOSSO de apólice
        Então o statusCode HTTP deve ser "200"


    # Apólice Inexistente
    @CTX-put-apolices
    Cenário: CTX - Endosso de Cancelamento - Falha - Endosso de apólice INEXISTENTE
        Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE CANCELAMENTO"


    # Chamada sem request body
    @CTX-put-apolices
    Cenário: CTX - Endosso de Cancelamento - Falha - Chamada sem request body
        Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE CANCELAMENTO"


    # Chamada com request body complemtamente em branco
    @CTX-put-apolices
    Cenário: CTX - Endosso de Cancelamento - Falha - Chamada com request body completamente em branco
        Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE CANCELAMENTO"


    # Chamada com request body parcialmente em branco
    @CTX-put-apolices
    Cenário: CTX - Endosso de Cancelamento - Falha - Chamada com request body parcialmente em branco
        Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE CANCELAMENTO"
