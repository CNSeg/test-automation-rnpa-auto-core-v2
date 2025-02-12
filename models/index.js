// Headers
module.exports.accessTokenHeader = require("./headers/access_token_header");
module.exports.emptyHeader = require("./headers/empty_header");

//Query Params
module.exports.paginationParams = require("./query-params/pagination_params")

// Request Body
module.exports.reqEmpty = require("./request/empty_request_body");
module.exports.reqAccessToken = require("./request/access_token_request_body");
module.exports.entityBodyFactory = require("./request/entity_apolice_request_body_factory");
module.exports.apoliceRequestBody = require("./request/POST_apolices/apolices_request_body");
module.exports.endossoRequestBody = require("./request/PUT_apolices/index");

// Enums
module.exports.Endosso = require("./enums/endosso")