const apolice = require("./entity_apolice_request_body_factory");

function apoliceBodyFactory({ numberOfObjects = 1 }){
    let apolices = Array
        .from({ length: numberOfObjects })
        .map((_, i) => (apolice()));
        
    return apolices;
}

module.exports = {
    apoliceBodyFactory
};