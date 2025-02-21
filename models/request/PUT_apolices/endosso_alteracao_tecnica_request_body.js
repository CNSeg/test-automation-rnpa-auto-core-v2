const faker = require("faker");

const endossoAlteracaoTecnica = () => ({
    "numeroApolice": "000123456789",
    "codigoOperacao": "1",
    "dataEmissao": "2025-01-01",
    "dataIniVigencia": "2025-01-06",
    "codigoStatusApolice": true,
    "cepSegurado": "1234567",
    "estadoSegurado": "SP",
    "cepPernoite": "1234567",
    "idTipoEndosso": 4,
    "segmento": "INDIVIDUAL",
    "item": [
      {
        "numeroItem": 1,
        "dataEmissao": "2025-01-16",
        "dataInicioVigencia": "2025-01-17",
        "codigoStatusItem": true
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
      .map((_, i) => (endossoAlteracaoTecnica()));
      
  return endossos;
}

function itemFactory({ numberOfObjects = 1 }){
  let itens = Array
      .from({ length: numberOfObjects })
      .map((_, i) => (item()));
      
  return itens;
}

module.exports = {
  endossoAlteracaoTecnica, 
  item,
  endossoFactory,
  itemFactory
};