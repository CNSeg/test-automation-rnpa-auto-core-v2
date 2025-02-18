const { Given, When, Then } = require("@cucumber/cucumber");
const models = require("../../../../models");
const services = require("../../../../services");
const variableCreator = require("../../../../support/create-variable")
const Endosso = models.Endosso;

Given('que quero que o request body seja o padrão de ENDOSSO de apólice do tipo {string}', async function(type){
    switch(type){
        case Endosso.ALTERACAO_TECNICA:
            this.requestBody = models.endossoRequestBody.alteracaoTecnica();
            break;

        case Endosso.CANCELAMENTO:
            this.requestBody = models.endossoRequestBody.cancelamento();
            break;
        
        case Endosso.SUBSTITUICAO:
            this.requestBody = models.endossoRequestBody.substituicao();
            break;
        
        case "COM ITEM VAZIO":
            this.requestBody = models.endossoRequestBody.itemVazio();
            break;

        default:
            this.requestBody = models.reqEmpty;
    }

    var requestBody = this.requestBody;
    this.attach("Request Body:\n" + JSON.stringify(requestBody, null, 2))
})


Given('que o número da apólice de ENDOSSO seja o mesmo de uma apólice pré-gerada', async function () {
    this.requestBody["numeroApolice"] = this.preGeneratedApolice.body.dadosDaApolice["numeroApolice"];
    
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