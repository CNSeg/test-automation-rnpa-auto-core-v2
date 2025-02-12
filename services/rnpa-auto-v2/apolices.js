const models = require("../../models");
const request = require("supertest");

const baseUrl = process.env.BASE_URL;
const basePathApolice = "/apolices";

// POST /apolices
async function postApolices({
    requestBody = models.reqEmpty(),
    requestHeaders = models.emptyHeader(),
    path = basePathApolice
}){
    return request(baseUrl)
            .post(path)
            .set(requestHeaders)
            .send(requestBody);
}

// PUT /apolices
async function putApolices({
    requestBody = models.reqEmpty(),
    requestHeaders = models.emptyHeader(),
    path = basePathApolice
}){
    return request(baseUrl)
            .put(path)
            .set(requestHeaders)
            .send(requestBody);
}

// GET /apolices
async function getApolices({
    requestBody = models.reqEmpty(),
    requestHeaders = models.emptyHeader(),
    path = basePathApolice
}){
    return request(baseUrl)
            .get(path)
            .set(requestHeaders)
            .send(requestBody);
}

module.exports = {
    postApolices,
    putApolices,
    getApolices
}