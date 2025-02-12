const models = require("../models");
const request = require("supertest");

const baseUrl = process.env.BASE_URL;
const pathAccessToken = "/oauth/v1/access-token"

async function accessToken(
    requestBody = models.reqAccessToken(),
    headers = models.accessTokenHeader(),
    path = pathAccessToken
   ){
   return request(baseUrl)
           .post(path)
           .set(headers)
           .send(requestBody);
}

module.exports = accessToken;