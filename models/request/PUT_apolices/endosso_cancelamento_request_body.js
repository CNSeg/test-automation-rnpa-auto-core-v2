const faker = require("faker");

const endossoCancelamento = () => ({
  "numeroApolice": "000123456789",
  "codigoOperacao": "1",
  "dataEmissao": "2025-01-01",
  "dataFimVigencia": "2025-01-06",
  "codigoStatusApolice": false,
  "idTipoEndosso": 4,
  "segmento": "INDIVIDUAL",
  "item": [
    {
      "dataEmissao": "2025-01-16",
      "dataFimVigencia": "2025-01-17",
      "codigoStatusItem": false
    }
  ]
});

const item = () => ({
  "numeroItem": faker.datatype.number({ min: 1, max: 100 }),
  "dataEmissao": "2025-01-16",
  "dataInicioVigencia": "2025-01-17",
  "codigoStatusItem": true
});

function endossoFactory({ numberOfObjects = 1 }){
  let endossos = Array
      .from({ length: numberOfObjects })
      .map((_, i) => (endossoCancelamento()));
      
  return endossos;
}

function itemFactory({ numberOfObjects = 1 }){
  let itens = Array
      .from({ length: numberOfObjects })
      .map((_, i) => (item()));
      
  return itens;
}

module.exports = {
  endossoCancelamento, 
  item,
  endossoFactory,
  itemFactory
};