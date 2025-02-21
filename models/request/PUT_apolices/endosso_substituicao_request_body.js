const faker = require("faker");

const endossoSubstituicao = () => ({
    "numeroApolice": "000123456789",
    "codigoOperacao": "1",
    "dataEmissao": "2025-01-01",
    "dataIniVigencia": "2025-01-06",
    "codigoStatusApolice": true,
    "idTipoEndosso": 4,
    "segmento": "INDIVIDUAL",
    "item": [
      {
        "numeroItem": 1,
        "nomeModelo": "Honda Civic",
        "codigoFipe": "87654321",
        "numeroAnoFabricacao": 2024,
        "numeroAnoModelo": 2024,
        "indicadorZeroKm": false,
        "numeroPlaca": "DEF5678",
        "numeroChassi": "8GHJKA98765432123",
        "codigoCategoria": "002",
        "nomeCategoria": "SUV",
        "dataEmissao": "2025-01-16",
        "dataInicioVigencia": "2025-01-17",
        "dataFimVigencia": "2026-01-17",
        "codigoStatusItem": true
      }
    ]
  });
  
const item = () => ({
  "numeroItem": faker.datatype.number({ min: 1, max: 100 }),
  "nomeModelo": faker.vehicle.vehicle(),
  "codigoFipe": "87654321",
  "numeroAnoFabricacao": 2024,
  "numeroAnoModelo": 2024,
  "indicadorZeroKm": false,
  "numeroPlaca": "DEF5678",
  "numeroChassi": "8GHJKA98765432123",
  "codigoCategoria": "002",
  "nomeCategoria": "SUV",
  "dataEmissao": "2025-01-16",
  "dataInicioVigencia": "2025-01-17",
  "dataFimVigencia": "2026-01-17",
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
  endossoSubstituicao,
  item,
  endossoFactory,
  itemFactory
};