const { Before } = require("@cucumber/cucumber");
const apoliceService = require("../../../services/rnpa-auto-v2/apolices");
const apoliceRequestBody = require("../../../models/request/POST_apolices/apolices_request_body").apoliceIndividual();


Before(async (scenario) => {
  console.log("\n" + "_".repeat(scenario.pickle.name.length + 50));
  console.log(`\n === ${scenario.pickle.name} ===`);
});