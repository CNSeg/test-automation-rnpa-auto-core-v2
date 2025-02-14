const { Before } = require("@cucumber/cucumber");
const apoliceService = require("../../../services/rnpa-auto-v2/apolices");
const apoliceRequestBody = require("../../../models/request/POST_apolices/apolices_request_body");


Before(async (scenario) => {
  console.log("\n" + "_".repeat(scenario.pickle.name.length + 50));
  console.log(`\n === ${scenario.pickle.name} ===`);
});

Before({tags: 'not @post-apolices'}, async function () {
  
  if(process.env.NODE_ENV == "local" || process.env.NODE_ENV == "dev") {
    const rq = apoliceRequestBody();

    this.preGeneratedApolice = await apoliceService.postApolices({ requestBody:  rq});
  
    console.log("Apólice gerada previamente armazenada na variável 'this.preGeneratedApolice'");
    console.log(rq.dadosDaApolice.numeroApolice);
  }
})