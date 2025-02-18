const apolice = require("./apolices_request_body");

function apoliceBodyFactory({ numberOfObjects = 1 }){
    let apolices = Array
        .from({ length: numberOfObjects })
        .map((_, i) => (apolice.apoliceIndividual()));
        
    return apolices;
}

function itemBodyFactory({ numberOfObjects = 1 }){
    let itens = Array
        .from({ length: numberOfObjects })
        .map((_, i) => (apolice.item()));
        
    return itens;
}

module.exports = {
    apoliceBodyFactory,
    itemBodyFactory
};