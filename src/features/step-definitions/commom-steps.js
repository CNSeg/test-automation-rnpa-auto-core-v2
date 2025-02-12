const { Given, Then } = require("@cucumber/cucumber");
const { expect } = require("chai");
const services = require("../../../services");
const variableCreator = require("../../../support/create-variable")

Given('a chamada do endpoint do access token', async function(){
    this.accessToken = (await services.oauthService()).body.access_token;
})

Given('a chamada do endpoint do access token', async function(){
    this.accessToken = (await services.oauthService()).body.access_token;
})

Given('que quero que o campo {string} do request body tenha o valor {string}', async function (field, value) {
    this.requestBody[field] = variableCreator.createVariableFromString(value);

    var requestBody = this.requestBody;
    this.attach("Request Body:\n" + JSON.stringify(requestBody, null, 2))
})

Given('que o query param {string} da requisição tenha o valor {string}', async function (paramName, value) {
    if(this.queryParams == ""){
        this.queryParams += `?${paramName}=${value}`;
    } 
    else {
        this.queryParams += `&${paramName}=${value}`;
    }
})

Then('o statusCode HTTP deve ser {string}', async function(statusCode){
    expect(this.response.status.toString()).to.equal(statusCode);
})

Then('a resposta contém um objeto com o código {string} e com a mensagem {string}', async function (code, message) {
    let expectedError = {
        "codigo": code,
        "mensagem": message
    }

    const compare = (reponse) =>  (reponse.codigo == expectedError.codigo) && (reponse.mensagem == expectedError.mensagem)
    const result = this.response.body.some(compare)

    expect(result).to.be.true;
})

Then('a resposta deve ser igual ao corpo da requisição', async function () {
    expect(this.response.body).to.equal(this.requestBody);
})