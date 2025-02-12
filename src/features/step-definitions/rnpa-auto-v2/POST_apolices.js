const { Given, When, Then } = require("@cucumber/cucumber");
const { expect } = require("chai");
const models = require("../../../../models");
const services = require("../../../../services");
const variableCreator = require("../../../../support/create-variable")


Given('que quero que o request body seja o padrão de CRIAÇÃO de apolice', async function(){
    this.requestBody = models.apoliceRequestBody();

    var requestBody = this.requestBody;
    this.attach("Request Body:\n" + JSON.stringify(requestBody, null, 2))
})

Given('que quero que o campo {string} dos dados da apólice tenha o valor {string}', async function (field, value) {
    this.requestBody.dadosDaApolice[field] = variableCreator.createVariableFromString(value);

    var requestBody = this.requestBody;
    this.attach("Request Body:\n" + JSON.stringify(requestBody, null, 2))
})

Given('que quero que o campo {string} dos dados do veículo tenha o valor {string}', async function (field, value) {
    this.requestBody.itens[0][field] = variableCreator.createVariableFromString(value);
    
    var requestBody = this.requestBody;
    this.attach("Request Body:\n" + JSON.stringify(requestBody, null, 2))
})

When('realizar a chamada de CRIAÇÃO de apolice', async function(){
    this.response = await services
        .rnpaAutoV2Service
        .apolices
        .postApolices({
            requestBody: this.requestBody
        });

    var responseBody = this.response.body;
    this.attach("Response Body:\n" + JSON.stringify(responseBody, null, 2))
})