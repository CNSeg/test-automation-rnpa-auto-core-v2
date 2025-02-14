#language: pt
@rnpa-auto-v2
@put-apolices
@regression

#TODO: Ajustar codigoOperacao ou idTipoEndosso quando definido

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
    @CT2-put-apolices
    Cenário: CT2 - Endosso de Subistituição - Falha - Endosso de apólice INEXISTENTE
        Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "ENDOSSO DE SUBSTITUIÇÃO"
        Quando realizar a chamada de ENDOSSO de apólice
        Então o statusCode HTTP deve ser "400"
        E a resposta contém um objeto com o código "400.022" e com a mensagem "Apólice não encontrada."

    # Chamada com request body vazio
    @CT3-put-apolices
    Cenário: CT3 - Endosso de Subistituição - Falha - Chamada com request body vazio
        Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "VAZIO"
        Então o statusCode HTTP deve ser "400"
        E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `numeroApolice` não pode ser nulo ou em branco."
        E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `codigoOperacao` não pode ser nulo ou em branco."
        E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `dataEmissao` não pode ser nulo ou em branco."
        E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `dataInicioVigencia` não pode ser nulo ou em branco."
        E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `codigoStatusApolice` não pode ser nulo ou em branco."
        E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `idTipoEndosso` não pode ser nulo ou em branco."
        E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `item` não pode ser nulo ou em branco."
        
    # Chamada com campo item vazio
    @CT4-put-apolices
    Cenário: CT4 - Endosso de Subistituição - Falha - Validação de campos obrigatórios
        Dado que quero que o request body seja o padrão de ENDOSSO de apólice do tipo "COM ITEM VAZIO"
        Então o statusCode HTTP deve ser "400"
        E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `item[0].numeroItem` não pode ser nulo ou em branco."
        E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `item[0].nomeModelo` não pode ser nulo ou em branco."
        E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `item[0].codigoFipe` não pode ser nulo ou em branco."
        E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `item[0].numeroAnoFabricacao` não pode ser nulo ou em branco."
        E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `item[0].numeroAnoModelo` não pode ser nulo ou em branco."
        E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `item[0].indicadorZeroKm` não pode ser nulo ou em branco."
        E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `item[0].numeroPlaca` não pode ser nulo ou em branco."
        E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `item[0].numeroChassi` não pode ser nulo ou em branco."
        E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `item[0].codigoCategoria` não pode ser nulo ou em branco."
        E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `item[0].nomeCategoria` não pode ser nulo ou em branco."
        E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `item[0].dataEmissao` não pode ser nulo ou em branco."
        E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `item[0].dataInicioVigencia` não pode ser nulo ou em branco."
        E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `item[0].dataFimVigencia` não pode ser nulo ou em branco."
        E a resposta contém um objeto com o código "400.001" e com a mensagem "O campo `item[0].codigoStatusItem` não pode ser nulo ou em branco."
      
