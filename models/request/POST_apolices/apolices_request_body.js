const apoliceIndividual = () => ({
  "dadosDaApolice": {
    "codigoSusep": "1234",
    "nomeSeguradora": "Seguradora Exemplo",
    "numeroApolice": `${Math.random() * 1e20}`,
    "codigoSegmento": "INDIVIDUAL",
    "codigoCobertura": "1",
    "codigoOperacao": "1",
    "statusApolice": true,
    "numeroApoliceAnterior": null,
    "dataEmissao": "2025-01-01",
    "dataInicioVigencia": "2025-01-02",
    "dataFimVigencia": "2026-01-01",
    "nomeSegurado": "João da Silva",
    "documentoSegurado": "41170178880",
    "cepSegurado": "57680970",
    "estadoSegurado": "SP",
    "nomeCondutor": "João da Silva",
    "cpfCondutor": "41170178880",
    "cepPernoite": "57680970"
  },
  "itens": [
    {
      "numeroItem": 1,
      "modeloVeiculo": "Fiat Uno",
      "codigoFipe": "12345678",
      "anoFabricacao": 2024,
      "anoModelo": 2025,
      "veiculoZeroKm": true,
      "placaVeiculo": "AAA1234",
      "chassiVeiculo": "9BWZZZ377VT004251",
      "codigoCategoria": "C123",
      "nomeCategoria": "Compacto",
      "dataEmissao": "2025-01-01",
      "dataInicioVigencia": "2025-01-02",
      "dataFimVigencia": "2026-01-01",
      "statusItem": true
    }
  ]
});

module.exports = apoliceIndividual;