const { Given, When } = require("@cucumber/cucumber");
const models = require("../../../../models");
const { expect } = require("chai");
const services = require("../../../../services");
const variableCreator = require("../../../../support/create-variable")
const Endosso = models.Endosso;

Given('que quero que o request body seja o padrão de ENDOSSO de apólice do tipo {string}', async function(type){
    // Cadastrar apólice
    this.requestBody = models.apoliceRequestBody.apoliceIndividual();
    this.response = await services
        .rnpaAutoV2Service
        .apolices
        .postApolices({
            requestBody: this.requestBody
        });
    
    // Guardar número da apólice
    const numeroApolice = this.requestBody.dadosDaApolice.numeroApolice;
    
    switch(type){
        case Endosso.ALTERACAO_TECNICA:
            this.requestBody = models.endossoRequestBody.alteracaoTecnica.endossoAlteracaoTecnica();
            break;

        case Endosso.CANCELAMENTO:
            this.requestBody = models.endossoRequestBody.cancelamento.endossoCancelamento();
            break;
        
        case Endosso.SUBSTITUICAO:
            this.requestBody = models.endossoRequestBody.substituicao.endossoSubstituicao();
            break;
        
        case "COM ITEM VAZIO":
            this.requestBody = models.endossoRequestBody.itemVazio();
            break;

        default:
            this.requestBody = models.reqEmpty();
    }

    this.requestBody.numeroApolice = numeroApolice;

    var requestBody = this.requestBody;
    this.attach("Request Body:\n" + JSON.stringify(requestBody, null, 2))
})


Given('que o número da apólice de ENDOSSO seja o mesmo de uma apólice pré-gerada', async function () {
    this.requestBody["numeroApolice"] = this.preGeneratedApolice.body.dadosDaApolice.numeroApolice;
    
    var requestBody = this.requestBody;
    this.attach("Request Body:\n" + JSON.stringify(requestBody, null, 2))
})

Given('que quero que o campo {string} do item do endosso tenha o valor {string}', async function (field, value) {
    this.requestBody.item[0][field] = variableCreator.createVariableFromString(value);

    var requestBody = this.requestBody;
    this.attach("Request Body:\n" + JSON.stringify(requestBody, null, 2))
})

Given('que quero que o {string} tenha a quantidade {int} de itens', async function (type, amount) {
    switch(type){
        case Endosso.ALTERACAO_TECNICA:
            this.requestBody.item = models.endossoRequestBody.alteracaoTecnica.itemFactory({numberOfObjects: amount});
            break;

        case Endosso.CANCELAMENTO:
            this.requestBody.item = models.endossoRequestBody.cancelamento.itemFactory({numberOfObjects: amount});
            break;
        
        case Endosso.SUBSTITUICAO:
            this.requestBody.item = models.endossoRequestBody.substituicao.itemFactory({numberOfObjects: amount});
            break;

        default:
            this.requestBody.item = this.requestBody.item;
    }

    var requestBody = this.requestBody;
    this.attach("Request Body:\n" + JSON.stringify(requestBody, null, 2))
})

When('realizar a chamada de ENDOSSO de apólice', async function(){
    this.response = await services
        .rnpaAutoV2Service
        .apolices
        .putApolices({
            requestBody: this.requestBody
        });

    var responseBody = this.response.body;
    this.attach("Response Body:\n" + JSON.stringify(responseBody, null, 2))
})